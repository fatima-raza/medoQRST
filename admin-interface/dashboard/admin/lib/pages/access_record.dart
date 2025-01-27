import 'package:flutter/material.dart';

class AccessRecord extends StatefulWidget {
  const AccessRecord({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccessRecordsPageState createState() => _AccessRecordsPageState();
}

class _AccessRecordsPageState extends State<AccessRecord> {
  bool isDatabaseSelected = true; // Initially Database is selected
  final TextEditingController patientIdController =
      TextEditingController(); // Controller for Patient Id input

  // Sample list of history files (replace with real data)
  List<Map<String, String>> historyFiles = [
    {'patientId': 'P001', 'date': '24-01-2025', 'bedNo': '01'},
    {'patientId': 'P002', 'date': '23-01-2025', 'bedNo': '02'},
    {'patientId': 'P003', 'date': '22-01-2025', 'bedNo': '03'},
    {'patientId': 'P004', 'date': '21-01-2025', 'bedNo': '04'},
  ];

  late List<Map<String, String>>
      filteredHistoryFiles; // Declare with late keyword

  @override
  void initState() {
    super.initState();
    filteredHistoryFiles =
        List.from(historyFiles); // Initialize inside initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Access Records',
            style: TextStyle(
              color: Color.fromARGB(255, 138, 24, 24),
              fontFamily: 'Roboto',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Access Options Icon (Popup menu button) moved to the AppBar actions
          PopupMenuButton<String>(
            icon: Icon(
              Icons.settings,
              color: Colors.grey[500], // Light gray icon
            ),
            tooltip: 'Access Options',
            onSelected: (String value) {
              setState(() {
                isDatabaseSelected = value == 'Database';
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'Database',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Database Access'),
                    if (isDatabaseSelected)
                      Icon(Icons.check,
                          color: Color.fromARGB(255, 138, 24, 24)),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'Cloud',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cloud Access'),
                    if (!isDatabaseSelected)
                      Icon(Icons.check,
                          color: Color.fromARGB(255, 138, 24, 24)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Row for both Access Options Icon and MedoQRST Database Records heading
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Heading change based on selection
                Expanded(
                  child: Center(
                    child: Text(
                      isDatabaseSelected
                          ? 'MedoQRST Database Records'
                          : 'Search From Cloud Records', // Updated heading
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                            255, 122, 121, 121), // Gray color for the heading
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Space between row and body content

          // Search Field for Patient Id (Label fixed as 'Patient Id')
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: patientIdController,
              decoration: InputDecoration(
                labelText: 'Patient Id:',
                labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                hintText: 'Enter Patient Id (e.g., P001, P002)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 138, 24, 24),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16), // Space between search field and other content

          // Row for aligning the button to the right
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align to the right
              children: [
                ElevatedButton(
                  onPressed: () {
                    String patientId = patientIdController.text.trim();
                    if (patientId.isNotEmpty) {
                      // Filter the history files based on the entered Patient Id
                      setState(() {
                        filteredHistoryFiles = historyFiles
                            .where((file) =>
                                file['patientId']!.contains(patientId))
                            .toList();
                      });
                      if (filteredHistoryFiles.isEmpty) {
                        // Do Nothing if no result found
                      }
                    } else {
                      setState(() {
                        filteredHistoryFiles = List.from(
                            historyFiles); // Show all records if no Patient Id is entered
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Displaying all records'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 138, 24, 24),
                  ),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // Space between search and section separator

          // Section Separator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 2, // Thin line
              color: Colors.grey[300], // Light gray color
            ),
          ),
          SizedBox(
              height: 16), // Space between the separator and the next section

          // Heading for the Active History Files section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align to the left
              children: [
                Text(
                  isDatabaseSelected
                      ? 'Active History Files'
                      : 'Recent History Files',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 138, 24, 24),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16), // Space between the heading and the content

          // Display message when no files are found or show list of history files
          filteredHistoryFiles.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'No file available',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredHistoryFiles.length,
                    itemBuilder: (context, index) {
                      var file = filteredHistoryFiles[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                              'Patient Id: ${file['patientId']!}',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Color.fromARGB(255, 122, 121, 121),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date: ${file['date']!}',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 122, 121, 121),
                                  ),
                                ),
                                Text(
                                  'Bed No: ${file['bedNo']}',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 122, 121, 121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
