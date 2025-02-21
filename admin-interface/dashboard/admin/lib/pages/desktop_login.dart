// import 'package:carousel_slider/carousel_slider.dart';
import 'package:admin/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginDesktopState createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
  bool _isChecked = false;

  // Controllers for TextFields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String enteredUsername = _usernameController.text.trim();
    String enteredPassword = _passwordController.text.trim();

    // Replace this static logic with database interaction logic in the future
    if (_validateCredentials(enteredUsername, enteredPassword)) {
      // Navigate to the Dashboard if credentials are correct
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(
            loggedValue: 1, // Pass loggedValue to Dashboard
          ),
        ),
      );
    } else {
      // Show error dialog if credentials are incorrect
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Login Failed"),
          content:
              const Text("Invalid username or password. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                "OK",
                style: TextStyle(color: Color.fromARGB(255, 138, 24, 24)),
              ),
            ),
          ],
        ),
      );
    }
  }

  // Static validation logic - Replace this method with database logic in the future
  bool _validateCredentials(String username, String password) {
    // Static credentials for testing
    const String staticUsername = "user123";
    const String staticPassword = "password123";

    return username == staticUsername && password == staticPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/MDS.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome back',
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Login to your account',
                  style: GoogleFonts.inter(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Username TextField
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
                const SizedBox(height: 20),
                // Password TextField
                TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    obscureText: true,
                    cursorColor: Colors.black),
                const SizedBox(height: 25),
                // Remember Me Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    const Text(
                      'Remember Me',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Login Button
                ElevatedButton(
                  onPressed: _login,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Color.fromARGB(255, 138, 24, 24)),
                  ),
                ),
                const SizedBox(height: 15),
                // Forgot Password Button
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 138, 24, 24)),
                            ),
                          )
                        ],
                        title: const Text('Forget Password Alert!'),
                        contentPadding: const EdgeInsets.all(28.0),
                        content:
                            const Text('Kindly contact MedoQRST IT Department'),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color.fromARGB(255, 138, 24, 24)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
