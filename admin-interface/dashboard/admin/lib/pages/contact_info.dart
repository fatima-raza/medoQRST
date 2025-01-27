import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfo extends StatefulWidget {
  final VoidCallback? onNext;
  const ContactInfo({super.key, this.onNext});

  @override
  // ignore: library_private_types_in_public_api
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  // Controllers for the text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isRegistered = false; // Flag to track if registration is successful

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Registration Desk',
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(
                  255, 122, 121, 121), // Red color for heading
            ),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          width: 500, // Match block size with other forms
          padding: const EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isRegistered) ...[
                  // Form content (if not registered)
                  Center(
                      child: Text(
                    'Contact Information Form',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: const Color.fromARGB(
                          255, 138, 24, 24), // Red color for heading
                    ),
                  )),
                  const SizedBox(height: 10),
                  // Name Field
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.roboto(
                        color:
                            Color.fromARGB(255, 122, 121, 121), // Label color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 122, 121, 121), // Focused border color
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 122, 121, 121), // Default border color
                        ),
                      ),
                      focusColor:
                          Color.fromARGB(255, 122, 121, 121), // Cursor color
                    ),
                    style: TextStyle(color: Colors.black),
                    cursorColor:
                        Color.fromARGB(255, 122, 121, 121), // Text color
                  ),
                  const SizedBox(height: 10),
                  // Relationship with Patient Field
                  TextField(
                    controller: relationshipController,
                    decoration: InputDecoration(
                      labelText: 'Relationship with Patient',
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.roboto(
                        color:
                            Color.fromARGB(255, 122, 121, 121), // Label color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 122, 121, 121), // Focused border color
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 122, 121, 121), // Default border color
                        ),
                      ),
                      focusColor:
                          Color.fromARGB(255, 122, 121, 121), // Cursor color
                    ),
                    style: TextStyle(color: Colors.black),
                    cursorColor:
                        Color.fromARGB(255, 122, 121, 121), // Text color
                  ),
                  const SizedBox(height: 10),
                  // Phone Field
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.roboto(
                        color:
                            Color.fromARGB(255, 122, 121, 121), // Label color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 122, 121, 121), // Focused border color
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 122, 121, 121), // Default border color
                        ),
                      ),
                      focusColor:
                          Color.fromARGB(255, 122, 121, 121), // Cursor color
                    ),
                    style: TextStyle(color: Colors.black),
                    cursorColor:
                        Color.fromARGB(255, 122, 121, 121), // Text color
                  ),
                  const SizedBox(height: 10),
                  // Email Field
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.roboto(
                        color:
                            Color.fromARGB(255, 122, 121, 121), // Label color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 122, 121, 121), // Focused border color
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(
                              255, 122, 121, 121), // Default border color
                        ),
                      ),
                      focusColor:
                          Color.fromARGB(255, 122, 121, 121), // Cursor color
                    ),
                    style: TextStyle(color: Colors.black),
                    cursorColor:
                        Color.fromARGB(255, 122, 121, 121), // Text color
                  ),
                  const SizedBox(height: 20),
                  // Register Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        final String name = nameController.text.trim();
                        final String relationship =
                            relationshipController.text.trim();
                        final String phone = phoneController.text.trim();
                        final String email = emailController.text.trim();

                        if (name.isEmpty ||
                            relationship.isEmpty ||
                            phone.isEmpty ||
                            email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill out all fields.'),
                              backgroundColor:
                                  Color.fromARGB(255, 122, 121, 121),
                            ),
                          );
                        } else {
                          try {
                            //  Call the API or database logic to save patient data
                            // Example: Make HTTP request to your backend API that interacts with SQL Server

                            // Placeholder for database logic (SQL Server integration):
                            /*
                            final response = await http.post(
                              'http://yourapi.com/api/patient', // Your backend API endpoint
                              body: json.encode({
                                'name': name,
                                'relationship': relationship,
                                'phone': phone,
                                'email': email,
                              }),
                            );
                            if (response.statusCode == 200) {
                              // Handle success
                            } else {
                              // Handle failure
                            }
                            */

                            // If successful, update state
                            setState(() {
                              isRegistered = true; // Update registration status
                            });

                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Patient Registered Successfully!'),
                                backgroundColor:
                                    Color.fromARGB(200, 138, 24, 24),
                              ),
                            );
                          } catch (e) {
                            // Handle any errors during the database operation
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 138, 24, 24), // Red color for button
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  // Success content (after registration)
                  Center(
                      child: Text(
                    'Patient Registered Successfully!',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: const Color.fromARGB(
                          255, 138, 24, 24), // Red color for heading
                    ),
                  )),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
