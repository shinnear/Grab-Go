// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

Future<List<String>> extractNomsProduits() async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // 1. Récupérer les documents panier de l'utilisateur connecté
  final panierSnapshot = await FirebaseFirestore.instance
      .collection('Order')
      .where('iduser', isEqualTo: currentUserReference)
      .get();

  if (panierSnapshot.docs.isEmpty) return [];

  // 2. Pour chaque document panier, récupérer le produit via idproduct
  List<String> noms = [];

  for (var panierDoc in panierSnapshot.docs) {
    final DocumentReference? idproduct = panierDoc.data()['idproduct'];

    if (idproduct != null) {
      final produitDoc = await idproduct.get();
      if (produitDoc.exists) {
        final data = produitDoc.data() as Map<String, dynamic>?;
        final String nom = data?['nom'] ?? 'Produit';
        noms.add(nom);
      } else {
        noms.add('Produit');
      }
    } else {
      noms.add('Produit');
    }
  }

  return noms;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
