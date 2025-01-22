import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Patient {
  final int id;
  final String name;
  final int? age;
  final String? mobile;
  final String? email;
  final String? addictionType;
  final String? ngoName;
  final String? doctorName;

  Patient({
    required this.id,
    required this.name,
    this.age,
    this.mobile,
    this.email,
    this.addictionType,
    this.ngoName,
    this.doctorName,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      age: json['age'],
      mobile: json['mobile'],
      email: json['email'],
      addictionType: json['addiction_type'],
      ngoName: json['ngo_name'],
      doctorName: json['doctor_name'],
    );
  }
}

class PatientListPage extends StatefulWidget {
  const PatientListPage({super.key});

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Patient> _patients = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPatients();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadPatients() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/patients'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _patients = data.map((json) => Patient.fromJson(json)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to load patients';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Connection error: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _searchPatients(String query) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/patients/search?searchQuery=$query'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _patients = data.map((json) => Patient.fromJson(json)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to search patients';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Connection error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search patients...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  _loadPatients();
                } else {
                  // Add debounce to avoid too many API calls
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (value == _searchController.text) {
                      _searchPatients(value);
                    }
                  });
                }
              },
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_error!),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _loadPatients,
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    : _patients.isEmpty
                        ? const Center(child: Text('No patients found'))
                        : RefreshIndicator(
                            onRefresh: _loadPatients,
                            child: ListView.builder(
                              itemCount: _patients.length,
                              itemBuilder: (context, index) {
                                final patient = _patients[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    title: Text(patient.name),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('ID: ${patient.id}'),
                                        if (patient.addictionType != null)
                                          Text(
                                              'Addiction: ${patient.addictionType}'),
                                        if (patient.ngoName != null)
                                          Text('NGO: ${patient.ngoName}'),
                                        if (patient.doctorName != null)
                                          Text('Doctor: ${patient.doctorName}'),
                                      ],
                                    ),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      // Navigate to patient details
                                      // You can add navigation logic here
                                    },
                                    isThreeLine: true,
                                  ),
                                );
                              },
                            ),
                          ),
          ),
        ],
      ),
    );
  }
}
