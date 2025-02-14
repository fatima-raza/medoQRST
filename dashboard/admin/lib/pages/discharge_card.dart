import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DischargeCard extends StatefulWidget {
  const DischargeCard({super.key});

  @override
  _DischargeCardState createState() => _DischargeCardState();
}

class _DischargeCardState extends State<DischargeCard> {
  TextEditingController bedNoController = TextEditingController();
  String? pdfPath;
  bool isPdfGenerated = false;
  final FocusNode bedNoFocusNode = FocusNode();

  // Function to generate the discharge card PDF
  Future<void> generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text("Hospital Name",
                    style: pw.TextStyle(
                        fontSize: 20, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 20),
                pw.Text("Discharge Card for Bed No: ${bedNoController.text}",
                    style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 10),
                pw.Text("Patient Name: ___________________"),
                pw.Text("Diagnosis: ___________________"),
                pw.Text("Doctor's Notes: ___________________"),
                pw.SizedBox(height: 30),
                pw.Text("Thank you for choosing our hospital!",
                    style: pw.TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file =
        File("${dir.path}/discharge_card_bed${bedNoController.text}.pdf");
    await file.writeAsBytes(await pdf.save());

    setState(() {
      pdfPath = file.path;
      isPdfGenerated = true;
    });
  }

  // Function to print or download the PDF and hide the bottom bar
  void downloadPdf() async {
    if (pdfPath != null) {
      final file = File(pdfPath!);
      final bytes = await file.readAsBytes();

      await Printing.layoutPdf(
        onLayout: (format) async => bytes,
      );

      setState(() {
        isPdfGenerated = false; // Hide the bottom bar after clicking download
        bedNoController
            .clear(); // Now clearing input after download, not after generate
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Generate Discharge Card',
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(255, 122, 121, 121),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: bedNoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Bed Number",
                labelStyle: GoogleFonts.roboto(
                  color: bedNoFocusNode.hasFocus
                      ? const Color.fromARGB(255, 122, 121, 121)
                      : Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 122, 121, 121),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Aligns button to rightmost corner
              children: [
                ElevatedButton(
                  onPressed: generatePDF,
                  child: Text(
                    "Generate",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 138, 24, 24)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: isPdfGenerated
          ? GestureDetector(
              onTap: downloadPdf,
              child: Container(
                color: Color.fromARGB(255, 122, 121, 121),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discharge Card Generated!",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Icon(Icons.download, color: Colors.white),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
