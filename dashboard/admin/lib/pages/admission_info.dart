import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmissionInfo extends StatefulWidget {
  final VoidCallback? onNext;

  const AdmissionInfo({super.key, this.onNext});

  @override
  // ignore: library_private_types_in_public_api
  _AdmissionInfoState createState() => _AdmissionInfoState();
}

class _AdmissionInfoState extends State<AdmissionInfo> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController modeController = TextEditingController();
  final TextEditingController hospitalAdmissionNoController =
      TextEditingController();
  final TextEditingController wardNoController = TextEditingController();
  final TextEditingController bedNoController = TextEditingController();
  final TextEditingController careController = TextEditingController();
  final TextEditingController doctorNameController = TextEditingController();

  final FocusNode dateFocusNode = FocusNode();
  final FocusNode modeFocusNode = FocusNode();
  final FocusNode bedFocusNode = FocusNode();
  final FocusNode doctorNameFocusNode = FocusNode();
  final FocusNode hospitalAdmissionFocusNode = FocusNode();
  final FocusNode wardNoFocusNode = FocusNode();

  String? selectedMode;
  String? selectedBed;

  List<String> availableBeds = [];

  bool admissionNumberGenerated = false;

  // GlobalKey for the Form to manage form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Function to fetch available beds from database
  void fetchAvailableBeds() async {
    List<String> fetchedBeds = await fetchBedsFromDatabase();
    setState(() {
      availableBeds = fetchedBeds;
    });
  }

  // Simulated database fetch for available beds
  Future<List<String>> fetchBedsFromDatabase() async {
    await Future.delayed(const Duration(seconds: 2));
    return ['1', '2', '3', '4', '5'];
  }

  // Function to validate the form and proceed to next step
  void validateAndProceed() {
    if (_formKey.currentState!.validate()) {
      // Save form data to database (This is where you add your database logic)
      saveAdmissionInfoToDatabase();

      // Proceed to next screen/form
      if (widget.onNext != null) {
        widget.onNext!();
      }
    }
  }

  // Function to save admission info to database (placeholder for actual logic)
  void saveAdmissionInfoToDatabase() {
    // Here, you can write code to save the data to your actual database (e.g., Firebase, SQLite)
    // print('Saving Admission Information...');
    // print('Date of Admission: ${dateController.text}');
    // print('Mode of Admission: $selectedMode');
    // print('Hospital Admission No: ${hospitalAdmissionNoController.text}');
    // print('Ward No: ${wardNoController.text}');
    // print('Bed No: $selectedBed');
    // print('Admitted Under the Care of: ${doctorNameController.text}');
    // Add your actual database saving logic here
  }

  @override
  void initState() {
    super.initState();
    fetchAvailableBeds();
  }

  // Function to generate Hospital Admission No
  String generateHospitalAdmissionNo() {
    final int admissionNo = DateTime.now().millisecondsSinceEpoch % 100000;
    return admissionNo.toString().padLeft(5, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Registration Desk',
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(255, 122, 121, 121),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    'Admission Information Form',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 138, 24, 24),
                    ),
                  )),
                  const SizedBox(height: 10),
                  TextFormField(
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
                            : Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 122, 121, 121),
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date of admission';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    focusNode: modeFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Mode of Admission',
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.roboto(
                        color: modeFocusNode.hasFocus
                            ? const Color.fromARGB(255, 122, 121, 121)
                            : Colors.grey,
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
                      setState(() {
                        selectedMode = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a mode of admission';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: hospitalAdmissionNoController,
                    focusNode: hospitalAdmissionFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Hospital Admission No',
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.roboto(
                        color: hospitalAdmissionFocusNode.hasFocus
                            ? const Color.fromARGB(255, 122, 121, 121)
                            : Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 122, 121, 121),
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: admissionNumberGenerated
                          ? const SizedBox.shrink()
                          : IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                if (!admissionNumberGenerated) {
                                  setState(() {
                                    hospitalAdmissionNoController.text =
                                        generateHospitalAdmissionNo();
                                    admissionNumberGenerated = true;
                                  });
                                }
                              },
                            ),
                    ),
                    readOnly: admissionNumberGenerated,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the hospital admission number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: wardNoController,
                    focusNode: wardNoFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Ward No',
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.roboto(
                        color: wardNoFocusNode.hasFocus
                            ? const Color.fromARGB(255, 122, 121, 121)
                            : Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 122, 121, 121),
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the ward number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  availableBeds.isEmpty
                      ? const CircularProgressIndicator()
                      : DropdownButtonFormField<String>(
                          focusNode: bedFocusNode,
                          decoration: InputDecoration(
                            labelText: 'Bed No',
                            border: const OutlineInputBorder(),
                            labelStyle: GoogleFonts.roboto(
                              color: bedFocusNode.hasFocus
                                  ? const Color.fromARGB(255, 122, 121, 121)
                                  : Colors.grey,
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
                                    child:
                                        Text(bed, style: GoogleFonts.roboto()),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedBed = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a bed number';
                            }
                            return null;
                          },
                        ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: doctorNameController,
                    focusNode: doctorNameFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Admitted Under the Care of',
                      border: const OutlineInputBorder(),
                      labelStyle: GoogleFonts.roboto(
                        color: doctorNameFocusNode.hasFocus
                            ? const Color.fromARGB(255, 122, 121, 121)
                            : Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 122, 121, 121),
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the doctor\'s name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: validateAndProceed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 138, 24, 24),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                      ),
                      child: Text(
                        'Next',
                        style: GoogleFonts.roboto(
                            fontSize: 16, color: Colors.white),
                      ),
                    ),
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
