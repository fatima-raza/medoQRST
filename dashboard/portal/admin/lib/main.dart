import 'package:flutter/material.dart';
import 'package:admin/pages/login.dart';
// import 'package:admin/pages/access_record.dart';
// import 'package:admin/pages/admission_info.dart';
// import 'package:admin/pages/available_beds.dart';
// import 'package:admin/pages/contact_info.dart';
// import 'package:admin/pages/discharge_card.dart';
// import 'package:admin/pages/patient_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define the initial route and other routes
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(), // Login screen
        //   '/available_beds': (context) =>
        //       const AvailableBeds(), // Available beds screen
        //   '/admission_info': (context) =>
        //       const AdmissionInfo(), // Admission information screen
        //   '/contact_info': (context) =>
        //       const ContactInfo(), // Emergency contact info screen
        //   '/discharge_card': (context) =>
        //       const DischargeCard(), // Generate discharge card screen
        //   '/access_record': (context) =>
        //       const AccessRecord(), // Access records screen
        //   '/patient_info': (context) =>
        //       const PatientInfo(), // Patient info screen
      },
    );
  }
}
