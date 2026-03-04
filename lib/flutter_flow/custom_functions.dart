import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? calculerPrixTotal(
  List<OrderRecord>? orderDocuments,
  bool? anniversaireAujourdhui,
) {
  if (orderDocuments == null || orderDocuments.isEmpty) {
    return jsonEncode({
      "totalAvant": "0",
      "totalApres": "0",
      "isAnniversaire": false,
    });
  }

  // ── 1. Calcul du total brut ──────────────────────────────────────
  double totalAvantCentimes = 0.0;
  for (var doc in orderDocuments) {
    totalAvantCentimes += doc.prix;
  }

  // ── 2. Appliquer réduction 30% si anniversaire ──────────────────
  final bool isAnniversaire = anniversaireAujourdhui ?? false;

  final double totalApresCentimes =
      isAnniversaire ? (totalAvantCentimes * 0.70) : totalAvantCentimes;

  return jsonEncode({
    "totalAvant": totalAvantCentimes.toString(),
    "totalApres": totalApresCentimes.toString(),
    "isAnniversaire": isAnniversaire,
  });
}

String? calculerPrixTotalStripe(String? prixTotal) {
  if (prixTotal == null) return null;

  // Parser le JSON de calculerPrixTotal
  final Map<String, dynamic> data = jsonDecode(prixTotal);

  final double totalAvant = (data["totalAvant"] as num).toDouble();
  final double totalApres = (data["totalApres"] as num).toDouble();
  final bool isAnniversaire = data["isAnniversaire"] as bool;

  // Convertir en centimes pour Stripe (ex: 10.00 → 1000)
  final int totalAvantStripe = (totalAvant * 100).round();
  final int totalApresStripe = (totalApres * 100).round();

  return jsonEncode({
    "totalAvant": totalAvantStripe,
    "totalApres": totalApresStripe,
    "isAnniversaire": isAnniversaire,
  });
}

String? validerCarte(String? cardNumber) {
  if (cardNumber == null) return 'invalid';

  // Supprimer les espaces
  String cleaned = cardNumber.replaceAll(RegExp(r'\s+'), '');

  // Vérifier uniquement la carte de test Stripe
  if (cleaned == '4242424242424242') return 'valid';

  return 'invalid';
}

bool? isAnniversaire(DateTime? dateDeNaissance) {
  if (dateDeNaissance == null) return false;

  final DateTime now = DateTime.now();
  return dateDeNaissance.day == now.day && dateDeNaissance.month == now.month;
}

String? getTotalAvant(String? jsonResult) {
  if (jsonResult == null || jsonResult.isEmpty) return "0";
  final map = jsonDecode(jsonResult);
  return map["totalAvant"] ?? "0";
}

String? getTotalApres(String? jsonResult) {
  if (jsonResult == null || jsonResult.isEmpty) return "0";
  final map = jsonDecode(jsonResult);
  return map["totalApres"] ?? "0";
}

String? ajouterFraisLivraison(String? prixTotal) {
  if (prixTotal == null) return null;

  final Map<String, dynamic> data = jsonDecode(prixTotal);

  final double totalAvant = double.tryParse(data["totalAvant"]) ?? 0.0;
  final double totalApres = double.tryParse(data["totalApres"]) ?? 0.0;
  final bool isAnniversaire = data["isAnniversaire"] as bool;

  const double fraisLivraison = 7.0;

  final double nouveauTotalAvant = totalAvant + fraisLivraison;
  final double nouveauTotalApres = totalApres + fraisLivraison;

  return jsonEncode({
    "totalAvant": nouveauTotalAvant.toString(),
    "totalApres": nouveauTotalApres.toString(),
    "isAnniversaire": isAnniversaire,
  });
}

List<ProductRecord>? filtrerEtTrierProduits(
  List<ProductRecord>? products,
  DocumentReference? categoryRef,
  String? tri,
) {
  if (products == null || products.isEmpty) return [];

  List<ProductRecord> liste = List.from(products);

  // ── 1. Filtre par category_ref ───────────────────────────────────
  if (categoryRef != null) {
    liste = liste.where((p) => p.categoryRef == categoryRef).toList();
  }

  // ── 2. Tri ───────────────────────────────────────────────────────
  switch (tri) {
    case 'prix_asc':
      liste.sort((a, b) => a.price.compareTo(b.price));
      break;
    case 'prix_desc':
      liste.sort((a, b) => b.price.compareTo(a.price));
      break;
    case 'nom_asc':
      liste.sort((a, b) => a.name.compareTo(b.name));
      break;
    case 'nom_desc':
      liste.sort((a, b) => b.name.compareTo(a.name));
      break;
    case 'date_desc':
      liste.sort((a, b) =>
          (b.createdAt ?? DateTime(0)).compareTo(a.createdAt ?? DateTime(0)));
      break;
    case 'date_asc':
      liste.sort((a, b) =>
          (a.createdAt ?? DateTime(0)).compareTo(b.createdAt ?? DateTime(0)));
      break;
    default:
      break;
  }

  return liste;
}
