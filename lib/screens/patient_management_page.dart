import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PatientManagementPage extends StatefulWidget {
  final int ngoId; // Pass the ngoId from the login page
  PatientManagementPage({required this.ngoId});

  @override
  _PatientManagementPageState createState() => _PatientManagementPageState();
}

class _PatientManagementPageState extends State<PatientManagementPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  int age = 0;
  String mobile = '';
  String email = '';
  String addictionType = '';
  String password='';

  Future<void> addPatient() async {
    final url = Uri.parse('http://localhost:3000/patient'); // Adjust the URL if needed
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'age': age,
        'mobile': mobile,
        'email': email,
        'addiction_type': addictionType,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Patient added successfully! ID: ${responseData['patient_id']}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add patient.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient Management')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
                validator: (value) => value!.isEmpty ? 'Name is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onChanged: (value) => age = int.tryParse(value) ?? 0,
                validator: (value) => value!.isEmpty ? 'Age is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile'),
                onChanged: (value) => mobile = value,
                validator: (value) => value!.isEmpty ? 'Mobile is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
                validator: (value) => value!.isEmpty ? 'Email is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Addiction Type'),
                onChanged: (value) => addictionType = value,
                validator: (value) => value!.isEmpty ? 'Addiction type is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) => password = value,
                validator: (value) => value!.isEmpty ? 'Password is required' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addPatient();
                  }
                },
                child: Text('Add Patient'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

