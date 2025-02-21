import 'package:admin/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginMobileState createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
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
                  loggedValue: 1,
                )),
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
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SizedBox(
              width: 300,
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
                  const SizedBox(height: 35),
                  // Username TextFormField
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  const SizedBox(height: 20),
                  // Password TextFormField
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _login,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Color.fromARGB(255, 138, 24, 24)),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                          content: const Text(
                              'Kindly contact MedoQRST IT Department'),
                        ),
                      );
                    },
                    child: const Text('Forgot Password?',
                        style:
                            TextStyle(color: Color.fromARGB(255, 138, 24, 24))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
