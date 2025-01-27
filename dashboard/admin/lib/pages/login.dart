import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/pages/mobile_login.dart';
import 'package:admin/pages/desktop_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 138, 24, 24),
        title: Text(
          'MedoQRST',
          style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/Logo.png",
            color: const Color.fromARGB(171, 255, 255, 255),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const LoginMobile();
          } else {
            return const LoginDesktop();
          }
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
