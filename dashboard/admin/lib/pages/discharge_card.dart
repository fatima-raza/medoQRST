import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:printing/printing.dart';

class DischargeCard extends StatefulWidget {
  const DischargeCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DischargeCardState createState() => _DischargeCardState();
}

class _DischargeCardState extends State<DischargeCard> {
  String? selectedFilePath;

  // Function to browse and select a PDF file
  Future<void> browseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFilePath = result.files.single.path;
      });
    }
  }

  // Function to print the selected PDF
  void printPdf() async {
    if (selectedFilePath != null) {
      final file = File(selectedFilePath!);
      final bytes = await file.readAsBytes();

      // Print the PDF using the printing package
      await Printing.layoutPdf(
        onLayout: (format) async {
          return bytes; // Return the PDF bytes for printing
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Generate Discharge Card',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 138, 24, 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: browseFile,
              child: Text('Browse PDF'),
            ),
            if (selectedFilePath != null)
              Expanded(
                child: Stack(
                  children: [
                    // PDF Viewer
                    Positioned.fill(
                      child: PDFView(
                        filePath: selectedFilePath,
                      ),
                    ),
                    // Print Button Overlay
                    Positioned(
                      right: 10,
                      top: 10,
                      child: IconButton(
                        icon: Icon(Icons.print, color: Colors.white),
                        onPressed: printPdf,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
