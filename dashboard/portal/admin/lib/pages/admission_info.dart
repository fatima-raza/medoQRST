import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/pages/contact_info.dart';

class AdmissionInfo extends StatefulWidget {
  const AdmissionInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdmissionInfoState createState() => _AdmissionInfoState();
}

class _AdmissionInfoState extends State<AdmissionInfo> {
  // Controllers for text fields
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  // Focus nodes for fields
  final FocusNode dateFocusNode = FocusNode();
  final FocusNode modeFocusNode = FocusNode();
  final FocusNode bedFocusNode = FocusNode();
  final FocusNode doctorNameFocusNode = FocusNode();

  // Selected values
  String? selectedMode;
  String? selectedBed;

  // List to hold available beds from database
  List<String> availableBeds = [];

  // Fetch available beds from the database
  @override
  void initState() {
    super.initState();
    fetchAvailableBeds();
  }

  // Simulated database call to fetch available beds (replace with actual DB call)
  void fetchAvailableBeds() async {
    // Example of fetching data from database (replace with actual DB call)
    // Assuming the result from DB query will give a list of bed numbers
    List<String> fetchedBeds = await fetchBedsFromDatabase();

    setState(() {
      availableBeds = fetchedBeds; // Populate the available beds list
    });
  }

  // Placeholder function to simulate fetching available beds from the database
  Future<List<String>> fetchBedsFromDatabase() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate a delay
    // Example: beds fetched from the database, only available beds should be included
    return ['1', '2', '3', '4', '5']; // Replace with actual DB result
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Registration Form',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 122, 121, 121),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          width: 500, // Adjusted to match the Patient Info Form width
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
                  'Admission Information',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 138, 24, 24),
                  ),
                ),
                const SizedBox(height: 10),
                // Date of Admission Field
                TextField(
                  controller: dateController,
                  readOnly: true,
                  focusNode: dateFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Date of Admission',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          dateController.text =
                              '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                        }
                      },
                    ),
                    border: const OutlineInputBorder(),
                    labelStyle: GoogleFonts.roboto(
                      color: dateFocusNode.hasFocus
                          ? const Color.fromARGB(255, 122, 121, 121)
                          : Colors.grey, // Grey when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 122, 121, 121),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Mode of Admission Dropdown
                DropdownButtonFormField<String>(
                  focusNode: modeFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Mode of Admission',
                    border: const OutlineInputBorder(),
                    labelStyle: GoogleFonts.roboto(
                      color: modeFocusNode.hasFocus
                          ? const Color.fromARGB(255, 122, 121, 121)
                          : Colors.grey, // Grey when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 122, 121, 121),
                        width: 2.0,
                      ),
                    ),
                  ),
                  value: selectedMode,
                  items: ['From OPD', 'Emergency', 'Referred', 'Transferred']
                      .map((mode) => DropdownMenuItem(
                            value: mode,
                            child: Text(mode, style: GoogleFonts.roboto()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    selectedMode = value;
                  },
                ),
                const SizedBox(height: 10),
                // Bed No Dropdown (This is where the dynamic bed logic will be)
                availableBeds.isEmpty
                    ? const CircularProgressIndicator() // Show a loading spinner while data is being fetched
                    : DropdownButtonFormField<String>(
                        focusNode: bedFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Bed No',
                          border: const OutlineInputBorder(),
                          labelStyle: GoogleFonts.roboto(
                            color: bedFocusNode.hasFocus
                                ? const Color.fromARGB(255, 122, 121, 121)
                                : Colors.grey, // Grey when not focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 122, 121, 121),
                              width: 2.0,
                            ),
                          ),
                        ),
                        value: selectedBed,
                        items: availableBeds
                            .map((bed) => DropdownMenuItem(
                                  value: bed,
                                  child: Text(bed, style: GoogleFonts.roboto()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          selectedBed = value;
                        },
                      ),
                const SizedBox(height: 10),
                // Admitted Under the Care of Field
                TextField(
                  controller: doctorNameController,
                  focusNode: doctorNameFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Admitted Under the Care of',
                    border: const OutlineInputBorder(),
                    labelStyle: GoogleFonts.roboto(
                      color: doctorNameFocusNode.hasFocus
                          ? const Color.fromARGB(255, 122, 121, 121)
                          : Colors.grey, // Grey when not focused
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 122, 121, 121),
                        width: 2.0,
                      ),
                    ),
                  ),
                  cursorColor: const Color.fromARGB(255, 122, 121, 121),
                ),
                const SizedBox(height: 20),
                // Next Button
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic to navigate to the next form
                      if (dateController.text.isEmpty ||
                          selectedMode == null ||
                          selectedBed == null ||
                          doctorNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill out all fields.'),
                            backgroundColor: Color.fromARGB(255, 122, 121, 121),
                          ),
                        );
                      } else {
                        // Database block starts here
                        // Implement the logic to store the data in the database
                        // Example:
                        /*
                        DatabaseHelper().insertAdmissionInfo(
                          date: dateController.text,
                          mode: selectedMode!,
                          bed: selectedBed!,
                          doctorName: doctorNameController.text,
                        );
                        */

                        // Once data is stored, navigate to the next form
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactInfo(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 138, 24, 24),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.roboto(color: Colors.white),
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
