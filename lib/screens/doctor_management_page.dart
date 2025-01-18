import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorManagementPage extends StatefulWidget {
  final int ngoId; // Pass the ngoId from the login page
  DoctorManagementPage({required this.ngoId});

  @override
  _DoctorManagementPageState createState() => _DoctorManagementPageState();
}

class _DoctorManagementPageState extends State<DoctorManagementPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String license = '';
  String email = '';
  String mobile = '';
  String degree = '';
  String password = '';

  Future<void> addDoctor() async {
    final url = Uri.parse('http://localhost:3000/doctor'); // Adjust the URL if needed
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'license': license,
        'email': email,
        'mobile': mobile,
        'degree': degree,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Doctor added successfully! ID: ${responseData['doctor_id']}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add doctor.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Management')),
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
                decoration: InputDecoration(labelText: 'License'),
                onChanged: (value) => license = value,
                validator: (value) => value!.isEmpty ? 'License is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
                validator: (value) => value!.isEmpty ? 'Email is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile'),
                onChanged: (value) => mobile = value,
                validator: (value) => value!.isEmpty ? 'Mobile is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Degree'),
                onChanged: (value) => degree = value,
                validator: (value) => value!.isEmpty ? 'Degree is required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) => password = value,
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Password is required' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addDoctor();
                  }
                },
                child: Text('Add Doctor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}