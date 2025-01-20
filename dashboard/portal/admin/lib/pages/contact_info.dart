import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for the text fields
    final TextEditingController nameController = TextEditingController();
    final TextEditingController relationshipController =
        TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Registration Form',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(
                  255, 138, 24, 24), // Red color for heading
            ),
          ),
        ),
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
                // Subheading
                Text(
                  'Emergency Contact Information',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(
                        255, 138, 24, 24), // Red color for heading
                  ),
                ),
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
                        Color.fromARGB(255, 122, 121, 121) // Text color
                    ),
                const SizedBox(height: 10),
                // Relationship with Patient Field
                TextField(
                  controller: relationshipController,
                  decoration: InputDecoration(
                    labelText: 'Relationship with Patient',
                    border: const OutlineInputBorder(),
                    labelStyle: GoogleFonts.roboto(
                      color: Color.fromARGB(255, 122, 121, 121), // Label color
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
                  cursorColor: Color.fromARGB(255, 122, 121, 121), // Text color
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
                      color: Color.fromARGB(255, 122, 121, 121), // Label color
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
                  cursorColor: Color.fromARGB(255, 122, 121, 121), // Text color
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
                      color: Color.fromARGB(255, 122, 121, 121), // Label color
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
                  cursorColor: Color.fromARGB(255, 122, 121, 121), // Text color
                ),
                const SizedBox(height: 20),
                // Register Button
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform registration logic here
                      final name = nameController.text.trim();
                      final relationship = relationshipController.text.trim();
                      final phone = phoneController.text.trim();
                      final email = emailController.text.trim();

                      if (name.isEmpty ||
                          relationship.isEmpty ||
                          phone.isEmpty ||
                          email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill out all fields.'),
                            backgroundColor: Color.fromARGB(255, 122, 121, 121),
                          ),
                        );
                      } else {
                        // Database logic (commented for future integration)

                        // Example of how to store the data in the database
                        // Here, you'll need to replace this with your database logic

                        // Database code to store the emergency contact details
                        // await database.saveEmergencyContact(name, relationship, phone, email);

                        // Placeholder for further processing
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Registration Completed Successfully!'),
                            backgroundColor: Color.fromARGB(200, 138, 24, 24),
                          ),
                        );
                        // Navigate to a success or summary page if needed
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
