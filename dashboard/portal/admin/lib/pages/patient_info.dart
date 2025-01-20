import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientInfo extends StatefulWidget {
  const PatientInfo({super.key});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  // Controllers for text fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController admissionNoController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Dropdown options and selected values
  String? selectedGender;
  String? selectedStatus;

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> statusOptions = ['Single', 'Married', 'Other'];

  // Simulated database: Initialize with the last registered number
  int lastRegisteredNumber = 1;
  bool isNumberGenerated =
      false; // Tracks if the admission number has been generated

  // Flag to toggle visibility of the next form section
  bool isAdmissionInfoVisible = false;

  // Method to handle form validation and database logic
  void _submitForm() {
    // Check if all fields are filled
    if (fullNameController.text.isEmpty ||
        ageController.text.isEmpty ||
        admissionNoController.text.isEmpty ||
        selectedGender == null ||
        selectedStatus == null ||
        occupationController.text.isEmpty ||
        addressController.text.isEmpty) {
      // Show a snackbar if any required fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill all fields before proceeding.',
            style: GoogleFonts.roboto(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 122, 121, 121),
        ),
      );
    } else {
      // Placeholder for database logic
      // Replace this with actual database saving logic
      // Example: savePatientDataToDatabase(
      //   fullNameController.text,
      //   ageController.text,
      //   admissionNoController.text,
      //   selectedGender!,
      //   selectedStatus!,
      //   occupationController.text,
      //   addressController.text,
      // );

      // Once data is saved, proceed to the next form section
      setState(() {
        isAdmissionInfoVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            ' Registration Form',
            style: GoogleFonts.roboto(
              color: Color.fromARGB(255, 122, 121, 121),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Title
                Text(
                  'Patient Information',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 138, 24, 24),
                  ),
                ),
                const SizedBox(height: 10),

                // Full Name and Age Fields
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 122, 121, 121),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                            ),
                          ),
                        ),
                        cursorColor: Color.fromARGB(255, 122, 121, 121),
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          labelStyle: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 122, 121, 121),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                            ),
                          ),
                        ),
                        cursorColor: Color.fromARGB(255, 122, 121, 121),
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Hospital Admission Number (Read Only with Add Button)
                TextField(
                  controller: admissionNoController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Hospital Admission No',
                    labelStyle: GoogleFonts.roboto(
                      color: Color.fromARGB(255, 122, 121, 121),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: isNumberGenerated
                            ? Color.fromARGB(255, 122, 121, 121)
                            : Color.fromARGB(255, 122, 121, 121),
                      ),
                      onPressed: isNumberGenerated
                          ? null
                          : () {
                              setState(() {
                                lastRegisteredNumber++;
                                admissionNoController.text =
                                    lastRegisteredNumber
                                        .toString()
                                        .padLeft(5, '0');
                                isNumberGenerated = true;
                              });
                            },
                    ),
                  ),
                  cursorColor: Color.fromARGB(255, 122, 121, 121),
                  style: GoogleFonts.roboto(color: Colors.black),
                ),
                const SizedBox(height: 10),

                // Gender and Status Dropdowns
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          labelStyle: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 122, 121, 121),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                            ),
                          ),
                        ),
                        items: genderOptions.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender, style: GoogleFonts.roboto()),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedStatus,
                        onChanged: (value) {
                          setState(() {
                            selectedStatus = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Status',
                          labelStyle: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 122, 121, 121),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                            ),
                          ),
                        ),
                        items: statusOptions.map((String status) {
                          return DropdownMenuItem<String>(
                            value: status,
                            child: Text(status, style: GoogleFonts.roboto()),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Occupation and Address Fields
                TextField(
                  controller: occupationController,
                  decoration: InputDecoration(
                    labelText: 'Occupation',
                    labelStyle: GoogleFonts.roboto(
                      color: Color.fromARGB(255, 122, 121, 121),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                  ),
                  cursorColor: Color.fromARGB(255, 122, 121, 121),
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: GoogleFonts.roboto(
                      color: Color.fromARGB(255, 122, 121, 121),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                  ),
                  cursorColor: Color.fromARGB(255, 122, 121, 121),
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // "Next" Button
                Center(
                  child: ElevatedButton(
                    onPressed:
                        _submitForm, // Submit form when button is pressed
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 138, 24, 24),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
