import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import your Registration Form page here
import 'package:admin/pages/patient_info.dart'; // Replace with your actual file path

class AvailableBeds extends StatefulWidget {
  const AvailableBeds({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AvailableBedsState createState() => _AvailableBedsState();
}

class _AvailableBedsState extends State<AvailableBeds> {
  late Future<List<String>> availableBeds;
  bool isFormLocked = false;

  @override
  void initState() {
    super.initState();
    availableBeds = fetchAvailableBeds(); // Fetch beds from the database
  }

  Future<List<String>> fetchAvailableBeds() async {
    // Simulating database fetch (Replace with your database query)
    await Future.delayed(const Duration(seconds: 2)); // Simulate a delay
    List<String> beds = [
      "Bed 1",
      "Bed 3",
      "Bed 7",
      "Bed 9",
      "Bed 12",
      "Bed 14"
    ]; // Example data

    // If no beds are available, lock the form
    if (beds.isEmpty) {
      setState(() {
        isFormLocked = true;
      });
    }
    return beds;
  }

  void showNoBedsMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'No available beds! Registration form is locked.',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Function to navigate to the registration form page with pre-filled bed number
  void navigateToRegistrationForm(String bedNumber) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientInfo(
          onNext: () {
            // Define the behavior for the 'Next' button
            // print('Navigated to next step for $bedNumber');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available Beds',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 138, 24, 24),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<String>>(
        future: availableBeds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: GoogleFonts.roboto(fontSize: 16, color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              showNoBedsMessage();
              return Center(
                child: Text(
                  'No available beds!',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 cards per row
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2 / 1, // Adjust card height/width ratio
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigateToRegistrationForm(snapshot.data![index]);
                    },
                    child: Card(
                      color: Colors.grey, // Transparent gray background
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          snapshot.data![index],
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(
                'No data found.',
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: isFormLocked
          ? Container(
              color: Colors.red.shade100,
              padding: const EdgeInsets.all(16),
              child: Text(
                'Registration Form is Locked: No Available Beds',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : null,
    );
  }
}
