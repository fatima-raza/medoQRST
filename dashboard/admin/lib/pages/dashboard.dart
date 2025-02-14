import 'package:admin/pages/access_record.dart';
import 'package:admin/pages/admission_info.dart';
// import 'package:admin/pages/available_beds.dart';
import 'package:admin/pages/contact_info.dart';
import 'package:admin/pages/discharge_card.dart';
import 'package:admin/pages/login.dart';
import 'package:admin/pages/patient_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/pages/available_beds.dart';

class Dashboard extends StatefulWidget {
  final int loggedValue;

  const Dashboard({super.key, required this.loggedValue});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? selectedOption; // Track the selected option

  // Build different body content based on the selected option
  Widget getBodyContent() {
    switch (selectedOption) {
      case '/patient_info':
        return PatientInfo(
          onNext: () {
            setState(() {
              selectedOption =
                  '/admission_info'; // Update body to AdmissionInfo
            });
          },
        );
      case '/admission_info':
        return AdmissionInfo(
          onNext: () {
            setState(() {
              selectedOption = '/contact_info'; // Update body to ContactInfo
            });
          },
        );

      case '/contact_info':
        return ContactInfo(
          onNext: () {
            setState(() {
              selectedOption =
                  '/register_success'; // Update body to ContactInfo
            });
          },
        );

      case '/available_beds':
        return GenerateQRCodes();
      case '/discharge_card':
        return DischargeCard();
      case '/access_record':
        return AccessRecord();
      default:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to MedoQRST Admin Dashboard!',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 138, 24, 24),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Manage your tasks and operations with ease.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'MedoQRST',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 138, 24, 24),
      ),
      sideBar: SideBar(
        backgroundColor: Colors.white,
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 122, 121, 121),
        ),
        selectedRoute: selectedOption ?? '',
        onSelected: (item) {
          setState(() {
            selectedOption = item.route ?? ''; // Update selected option
          });
        },
        header: GestureDetector(
          onTap: () {
            setState(() {
              selectedOption = null; // Reset to welcome page
            });
          },
          child: Container(
            height: 50,
            color: Colors.white,
            width: double.infinity,
            child: const Center(
              child: Text(
                'DASHBOARD',
                style: TextStyle(
                  color: Color.fromARGB(255, 122, 121, 121),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color.fromARGB(197, 255, 247, 247),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 138, 24, 24),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Color.fromARGB(255, 138, 24, 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        items: [
          AdminMenuItem(
            title: 'Registration Desk',
            icon: Icons.app_registration,
            children: [
              AdminMenuItem(
                title: 'Patient Information',
                icon: Icons.health_and_safety,
                route: '/patient_info',
              ),
              AdminMenuItem(
                title: 'Admission Information',
                icon: Icons.hdr_auto_rounded,
                route: '/admission_info',
              ),
              AdminMenuItem(
                title: 'Emergency Contact',
                icon: Icons.contact_emergency,
                route: '/contact_info',
              ),
            ],
          ),
          AdminMenuItem(
            title: 'Bed QR',
            icon: Icons.bed,
            route: '/available_beds',
          ),
          AdminMenuItem(
            title: 'Generate Discharge Card',
            icon: Icons.print,
            route: '/discharge_card',
          ),
          AdminMenuItem(
            title: 'Access Records',
            icon: Icons.file_copy,
            route: '/access_record',
          ),
        ],
      ),
      body: getBodyContent(),
    );
  }
}
