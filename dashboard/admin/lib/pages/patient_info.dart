// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class PatientInfo extends StatefulWidget {
//   final VoidCallback? onNext;

//   const PatientInfo({Key? key, this.onNext}) : super(key: key);

//   @override
//   State<PatientInfo> createState() => _PatientInfoState();
// }

// class _PatientInfoState extends State<PatientInfo> {
//   // Controllers for text fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController phoneNoController = TextEditingController();

//   // FocusNodes for text fields
//   final FocusNode nameFocusNode = FocusNode();
//   final FocusNode ageFocusNode = FocusNode();
//   final FocusNode addressFocusNode = FocusNode();
//   final FocusNode phoneNoFocusNode = FocusNode();

//   // Gender dropdown
//   String? selectedGender;
//   final List<String> genderOptions = ['Male', 'Female'];

//   // Validation function
//   void _validateAndProceed() async {
//     if (nameController.text.isEmpty ||
//         ageController.text.isEmpty ||
//         addressController.text.isEmpty ||
//         phoneNoController.text.isEmpty ||
//         selectedGender == null) {
//       // Show a snackbar if any field is empty
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill in all fields'),
//           backgroundColor: Color.fromARGB(255, 122, 121, 121),
//         ),
//       );
//     } else {
//       // Proceed to save patient info to the database
//       await _savePatientInfoToDatabase();

//       // Proceed to next step if all fields are filled and data is saved
//       if (widget.onNext != null) {
//         widget.onNext!();
//       }
//     }
//   }

//   // Method to save patient info to the database
//   Future<void> _savePatientInfoToDatabase() async {
//     try {
//       // --- Database Logic Start ---
//       // Write your database logic here to save the patient info.
//       // Example (replace with your actual database logic):
//       // await database.savePatientInfo({
//       //   'name': nameController.text,
//       //   'age': ageController.text,
//       //   'address': addressController.text,
//       //   'phone_no': phoneNoController.text,
//       //   'gender': selectedGender,
//       // });

//       print('Patient information saved to the database');
//       // --- Database Logic End ---
//     } catch (e) {
//       // Handle any errors here
//       print('Error saving patient information: $e');
//       // Optionally show an error message if needed
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error saving data. Please try again.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Registration Desk',
//           style: GoogleFonts.roboto(
//             color: const Color.fromARGB(255, 122, 121, 121),
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.4,
//             height: MediaQuery.of(context).size.height * 0.6,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Text(
//                     'Patient Information Form',
//                     style: GoogleFonts.roboto(
//                       fontSize: 20,
//                       color: const Color.fromARGB(255, 138, 24, 24),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),

//                 // Name Field
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: nameController,
//                         focusNode: nameFocusNode,
//                         decoration: InputDecoration(
//                           labelText: 'Name',
//                           labelStyle: GoogleFonts.roboto(
//                             color: nameFocusNode.hasFocus
//                                 ? Color.fromARGB(255, 122, 121, 121)
//                                 : Colors.grey,
//                           ),
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 2,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                         cursorColor: Color.fromARGB(255, 122, 121, 121),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),

//                 // Age and Gender in a single row
//                 Row(
//                   children: [
//                     // Age Field
//                     Expanded(
//                       child: TextField(
//                         controller: ageController,
//                         keyboardType: TextInputType.number,
//                         focusNode: ageFocusNode,
//                         decoration: InputDecoration(
//                           labelText: 'Age',
//                           labelStyle: GoogleFonts.roboto(
//                             color: ageFocusNode.hasFocus
//                                 ? Color.fromARGB(255, 122, 121, 121)
//                                 : Colors.grey,
//                           ),
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 2,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                         cursorColor: Color.fromARGB(255, 122, 121, 121),
//                       ),
//                     ),
//                     SizedBox(width: 10),

//                     // Gender Dropdown
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: selectedGender,
//                         onChanged: (value) {
//                           setState(() {
//                             selectedGender = value;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           labelText: 'Gender',
//                           labelStyle: GoogleFonts.roboto(
//                             color: ageFocusNode.hasFocus
//                                 ? Color.fromARGB(255, 122, 121, 121)
//                                 : Colors.grey,
//                           ),
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 2,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                         items: genderOptions.map((String gender) {
//                           return DropdownMenuItem<String>(
//                             value: gender,
//                             child: Text(gender),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),

//                 // Phone No Field
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: phoneNoController,
//                         keyboardType: TextInputType.phone,
//                         focusNode: phoneNoFocusNode,
//                         decoration: InputDecoration(
//                           labelText: 'Phone No',
//                           labelStyle: GoogleFonts.roboto(
//                             color: phoneNoFocusNode.hasFocus
//                                 ? Color.fromARGB(255, 122, 121, 121)
//                                 : Colors.grey,
//                           ),
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 2,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                         cursorColor: Color.fromARGB(255, 122, 121, 121),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),

//                 // Address Field
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: addressController,
//                         focusNode: addressFocusNode,
//                         decoration: InputDecoration(
//                           labelText: 'Address',
//                           labelStyle: GoogleFonts.roboto(
//                             color: addressFocusNode.hasFocus
//                                 ? Color.fromARGB(255, 122, 121, 121)
//                                 : Colors.grey,
//                           ),
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 2,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color.fromARGB(255, 122, 121, 121),
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                         cursorColor: Color.fromARGB(255, 122, 121, 121),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),

//                 // Aligning the 'Next' button to the right with custom styling
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: ElevatedButton(
//                     onPressed: _validateAndProceed, // Call validation method
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 138, 24, 24),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                     ),
//                     child: Text(
//                       'Next',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Roboto',
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientInfo extends StatefulWidget {
  final VoidCallback? onNext;

  const PatientInfo({super.key, this.onNext});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  // FocusNodes for text fields
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode phoneNoFocusNode = FocusNode();

  // Gender dropdown
  String? selectedGender;
  final List<String> genderOptions = ['Male', 'Female'];

  // Validation function
  void _validateAndProceed() async {
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        addressController.text.isEmpty ||
        phoneNoController.text.isEmpty ||
        selectedGender == null) {
      // Show a snackbar if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Color.fromARGB(255, 122, 121, 121),
        ),
      );
    } else {
      // Save patient info to the database
      await _savePatientInfoToDatabase();

      // Proceed to the next step
      if (widget.onNext != null) {
        widget.onNext!();
      }
    }
  }

  // Method to save patient info to the database
  Future<void> _savePatientInfoToDatabase() async {
    try {
      // --- Database Logic Placeholder ---
      // Replace this section with your actual database logic.
      // print('Saving the following data to the database:');
      // print('Name: ${nameController.text}');
      // print('Age: ${ageController.text}');
      // print('Address: ${addressController.text}');
      // print('Phone No: ${phoneNoController.text}');
      // print('Gender: $selectedGender');
      // --- Database Logic Placeholder End ---
    } catch (e) {
      // Handle any errors here
      // print('Error saving patient information: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving data. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration Desk',
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 122, 121, 121),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Patient Information Form',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 138, 24, 24),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Name Field
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: nameController,
                        focusNode: nameFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: GoogleFonts.roboto(
                            color: nameFocusNode.hasFocus
                                ? Color.fromARGB(255, 122, 121, 121)
                                : Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 1,
                            ),
                          ),
                        ),
                        cursorColor: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Age and Gender in a single row
                Row(
                  children: [
                    // Age Field
                    Expanded(
                      child: TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        focusNode: ageFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          labelStyle: GoogleFonts.roboto(
                            color: ageFocusNode.hasFocus
                                ? Color.fromARGB(255, 122, 121, 121)
                                : Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 1,
                            ),
                          ),
                        ),
                        cursorColor: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                    SizedBox(width: 10),

                    // Gender Dropdown
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
                            color: ageFocusNode.hasFocus
                                ? Color.fromARGB(255, 122, 121, 121)
                                : Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 1,
                            ),
                          ),
                        ),
                        items: genderOptions.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Phone No Field
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: phoneNoController,
                        keyboardType: TextInputType.phone,
                        focusNode: phoneNoFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Phone No',
                          labelStyle: GoogleFonts.roboto(
                            color: phoneNoFocusNode.hasFocus
                                ? Color.fromARGB(255, 122, 121, 121)
                                : Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 1,
                            ),
                          ),
                        ),
                        cursorColor: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Address Field
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: addressController,
                        focusNode: addressFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: GoogleFonts.roboto(
                            color: addressFocusNode.hasFocus
                                ? Color.fromARGB(255, 122, 121, 121)
                                : Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 122, 121, 121),
                              width: 1,
                            ),
                          ),
                        ),
                        cursorColor: Color.fromARGB(255, 122, 121, 121),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Aligning the 'Next' button to the right with custom styling
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _validateAndProceed, // Call validation method
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 138, 24, 24),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    child: Text(
                      'Next',
                      style:
                          GoogleFonts.roboto(fontSize: 16, color: Colors.white),
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
