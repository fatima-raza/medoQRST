// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_admin_scaffold/admin_scaffold.dart';

// class PatientRegisteredPage extends StatefulWidget {
//   @override
//   State<PatientRegisteredPage> createState() => _PatientRegisteredPageState();
// }

// class _PatientRegisteredPageState extends State<PatientRegisteredPage> {
//   @override
//   Widget build(BuildContext context) {
//     return AdminScaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'MedoQRST',
//           style: GoogleFonts.roboto(color: Colors.white),
//         ),
//         backgroundColor: const Color.fromARGB(255, 138, 24, 24),
//       ),
//       sideBar: SideBar(
//         backgroundColor: Colors.white,
//         textStyle: const TextStyle(
//           color: Color.fromARGB(255, 122, 121, 121),
//         ),
//         selectedRoute: '/patient_registered',
//         onSelected: (item) {},
//         header: GestureDetector(
//           onTap: () {},
//           child: Container(
//             height: 50,
//             color: Colors.white,
//             width: double.infinity,
//             child: const Center(
//               child: Text(
//                 'DASHBOARD',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 122, 121, 121),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         footer: Container(
//           height: 50,
//           width: double.infinity,
//           color: const Color.fromARGB(197, 255, 247, 247),
//           child: Center(
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => const LoginScreen()),
//                 );
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Icon(
//                     Icons.logout,
//                     color: Color.fromARGB(255, 138, 24, 24),
//                   ),
//                   SizedBox(width: 8),
//                   Text(
//                     'Logout',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 138, 24, 24),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         items: [],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Patient Registered Successfully',
//               style: GoogleFonts.roboto(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: const Color.fromARGB(255, 138, 24, 24),
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'The patient has been successfully registered in the system.',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
