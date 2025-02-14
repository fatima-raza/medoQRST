// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCodes extends StatefulWidget {
  const GenerateQRCodes({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GenerateQRCodesState createState() => _GenerateQRCodesState();
}

class _GenerateQRCodesState extends State<GenerateQRCodes> {
  bool _isSingleMode = true;
  final TextEditingController _singleBedController = TextEditingController();
  final TextEditingController _lastBedController = TextEditingController();
  final TextEditingController _numBedsController = TextEditingController();
  final FocusNode bedNoFocusNode = FocusNode();

  List<int> _bedNumbers = [];
  String? _singleQrData;

  void _generateSingleQR() {
    int? bedNo = int.tryParse(_singleBedController.text);
    if (bedNo != null) {
      setState(() {
        _singleQrData = "Bed $bedNo";
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid bed number")),
      );
    }
  }

  void _generateMultipleQRCodes() {
    int? numBeds = int.tryParse(_numBedsController.text);
    int? lastBed = int.tryParse(_lastBedController.text);

    if (numBeds != null && lastBed != null && numBeds > 0) {
      setState(() {
        _bedNumbers = List.generate(numBeds, (index) => lastBed + index + 1);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter valid numbers")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Generate QR Codes',
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(
                  255, 122, 121, 121), // Red color for heading
            ),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
                Icons.more_vert), // Mode selection icon in top-right corner
            onSelected: (value) {
              setState(() {
                _isSingleMode = value == "single";
                _singleQrData = null;
                _bedNumbers.clear();
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "single",
                child: Row(
                  children: [
                    if (_isSingleMode)
                      Icon(Icons.check,
                          color: const Color.fromARGB(
                              255, 138, 24, 24)), // Tick mark
                    SizedBox(width: 8),
                    Text("Generate for Single Bed"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "multiple",
                child: Row(
                  children: [
                    if (!_isSingleMode)
                      Icon(Icons.check,
                          color: const Color.fromARGB(
                              255, 138, 24, 24)), // Tick mark
                    SizedBox(width: 8),
                    Text("Generate for Multiple Beds"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isSingleMode) ...[
              TextField(
                controller: _singleBedController,
                decoration: InputDecoration(
                  labelText: "Enter Bed No",
                  border: OutlineInputBorder(),
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
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Aligns button to rightmost corner
                children: [
                  ElevatedButton(
                    onPressed: _generateSingleQR,
                    child: Text(
                      "Generate",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 138, 24, 24)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (_singleQrData != null)
                Column(
                  children: [
                    Text(
                      "QR Code for ${_singleQrData!}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    QrImageView(
                      data: _singleQrData!,
                      size: 200,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
            ],
            if (!_isSingleMode) ...[
              TextField(
                controller: _lastBedController,
                decoration: InputDecoration(
                  labelText: "Last Generated Bed No",
                  border: OutlineInputBorder(),
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
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              TextField(
                controller: _numBedsController,
                decoration: InputDecoration(
                  labelText: "Number of Beds to Generate",
                  border: OutlineInputBorder(),
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
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateMultipleQRCodes,
                child: Text(
                  "Generate",
                  style:
                      TextStyle(color: const Color.fromARGB(255, 138, 24, 24)),
                ),
              ),
              SizedBox(height: 20),
              if (_bedNumbers.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _bedNumbers.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            "Bed ${_bedNumbers[index]}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          QrImageView(
                            data: "Bed ${_bedNumbers[index]}",
                            size: 150,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
