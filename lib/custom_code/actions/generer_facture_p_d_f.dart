// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future genererFacturePDF(
  String nomClient,
  List<OrderRecord> panierDocuments,
  List<String> nomsProduits,
  String totalAvant,
  String totalApres,
  bool isAnniversaire,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final pdf = pw.Document();

  final double montantAvant = int.parse(totalAvant) / 100;
  final double montantApres = (totalApres == "0" || totalApres.isEmpty)
      ? montantAvant
      : int.parse(totalApres) / 100;

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // ── En-tête ──────────────────────────────────────
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'FACTURE',
                  style: pw.TextStyle(
                    fontSize: 28,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  DateTime.now().toString().substring(0, 10),
                  style: const pw.TextStyle(fontSize: 12),
                ),
              ],
            ),

            pw.Divider(thickness: 2),
            pw.SizedBox(height: 10),

            // ── Infos client ─────────────────────────────────
            pw.Text('Client : $nomClient',
                style: const pw.TextStyle(fontSize: 14)),
            pw.SizedBox(height: 20),

            // ── Tableau des articles ──────────────────────────
            pw.Text('Détail de la commande :',
                style:
                    pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),

            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey300),
              children: [
                // En-tête tableau
                pw.TableRow(
                  decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(6),
                      child: pw.Text('Produit',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(6),
                      child: pw.Text('Prix',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
                // Lignes articles
                ...List.generate(panierDocuments.length, (index) {
                  final item = panierDocuments[index];
                  final nomProduit = index < nomsProduits.length
                      ? nomsProduits[index]
                      : 'Produit';
                  return pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(6),
                        child: pw.Text(nomProduit),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(6),
                        child: pw.Text('${item.prix.toStringAsFixed(2)} dt'),
                      ),
                    ],
                  );
                }),
              ],
            ),

            pw.SizedBox(height: 20),

            // ── Totaux ────────────────────────────────────────
            pw.Container(
              padding: const pw.EdgeInsets.all(12),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey300),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('Sous-total :'),
                      pw.Text('${montantAvant.toStringAsFixed(2)} dt'),
                    ],
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('Frais de livraison :'),
                      pw.Text('7 dt'),
                    ],
                  ),

                  // Réduction anniversaire
                  if (isAnniversaire && montantApres != montantAvant) ...[
                    pw.SizedBox(height: 4),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Reduction anniversaire (-30%) :',
                            style: pw.TextStyle(color: PdfColors.green700)),
                        pw.Text(
                          '- ${(montantAvant - montantApres).toStringAsFixed(2)} dt',
                          style: pw.TextStyle(color: PdfColors.green700),
                        ),
                      ],
                    ),
                  ],

                  pw.Divider(),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('TOTAL :',
                          style: pw.TextStyle(
                              fontSize: 16, fontWeight: pw.FontWeight.bold)),
                      pw.Text(
                        '${montantApres.toStringAsFixed(2)} dt',
                        style: pw.TextStyle(
                            fontSize: 16, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            pw.SizedBox(height: 30),

            // ── Pied de page ──────────────────────────────────
            pw.Center(
              child: pw.Text(
                'Merci pour votre commande !',
                style: pw.TextStyle(
                    fontSize: 12,
                    fontStyle: pw.FontStyle.italic,
                    color: PdfColors.grey600),
              ),
            ),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
