// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class DoctorManagementPage extends StatefulWidget {
//   final int ngoId; // Pass the ngoId from the login page
//   DoctorManagementPage({required this.ngoId});

//   @override
//   _DoctorManagementPageState createState() => _DoctorManagementPageState();
// }

// class _DoctorManagementPageState extends State<DoctorManagementPage> {
//   final _formKey = GlobalKey<FormState>();
//   String name = '';
//   String license = '';
//   String email = '';
//   String mobile = '';
//   String degree = '';
//   String password = '';

//   Future<void> addDoctor() async {
//     final url = Uri.parse('http://localhost:3000/doctor'); // Adjust the URL if needed
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'name': name,
//         'license': license,
//         'email': email,
//         'mobile': mobile,
//         'degree': degree,
//         'password': password
//       }),
//     );

//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Doctor added successfully! ID: ${responseData['doctor_id']}')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to add doctor.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Doctor Management')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 onChanged: (value) => name = value,
//                 validator: (value) => value!.isEmpty ? 'Name is required' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'License'),
//                 onChanged: (value) => license = value,
//                 validator: (value) => value!.isEmpty ? 'License is required' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 onChanged: (value) => email = value,
//                 validator: (value) => value!.isEmpty ? 'Email is required' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Mobile'),
//                 onChanged: (value) => mobile = value,
//                 validator: (value) => value!.isEmpty ? 'Mobile is required' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Degree'),
//                 onChanged: (value) => degree = value,
//                 validator: (value) => value!.isEmpty ? 'Degree is required' : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 onChanged: (value) => password = value,
//                 obscureText: true,
//                 validator: (value) => value!.isEmpty ? 'Password is required' : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     addDoctor();
//                   }
//                 },
//                 child: Text('Add Doctor'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorManagementPage extends StatefulWidget {
  final int ngoId; // Pass the ngoId from the login page
  const DoctorManagementPage({required this.ngoId, Key? key}) : super(key: key);

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
  bool _ispasswordvisible = false;

  Future<void> addDoctor() async {
    final url = Uri.parse(
        'http://localhost:3000/doctor'); // Adjust the URL if needed
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
        SnackBar(
            content: Text(
                'Doctor added successfully! ID: ${responseData['doctor_id']}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add doctor.')),
      );
    }
  }

  Widget _buildGradientCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Colors.teal.withOpacity(0.6),
            Colors.transparent,
          ],
          radius: 0.6,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Doctor Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background gradient circles
          Positioned(
            top: -100,
            right: -100,
            child: _buildGradientCircle(200),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: _buildGradientCircle(180),
          ),
          // Main content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Add a Doctor',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),
                            ),
                            const SizedBox(height: 32),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: const Icon(Icons.person,
                                    color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.teal, width: 2),
                                ),
                              ),
                              onChanged: (value) => name = value,
                              validator: (value) =>
                                  value!.isEmpty ? 'Name is required' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'License',
                                prefixIcon: const Icon(Icons.card_membership,
                                    color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.teal, width: 2),
                                ),
                              ),
                              onChanged: (value) => license = value,
                              validator: (value) =>
                                  value!.isEmpty ? 'License is required' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon:
                                    const Icon(Icons.email, color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.teal, width: 2),
                                ),
                              ),
                              onChanged: (value) => email = value,
                              validator: (value) =>
                                  value!.isEmpty ? 'Email is required' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Mobile',
                                prefixIcon:
                                    const Icon(Icons.phone, color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.teal, width: 2),
                                ),
                              ),
                              onChanged: (value) => mobile = value,
                              validator: (value) =>
                                  value!.isEmpty ? 'Mobile is required' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Degree',
                                prefixIcon: const Icon(Icons.school,
                                    color: Colors.teal),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.teal, width: 2),
                                ),
                              ),
                              onChanged: (value) => degree = value,
                              validator: (value) =>
                                  value!.isEmpty ? 'Degree is required' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon:
                                    const Icon(Icons.lock, color: Colors.teal),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _ispasswordvisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.teal,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _ispasswordvisible = !_ispasswordvisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.teal, width: 2),
                                ),
                              ),
                              onChanged: (value) => password = value,
                              obscureText: !_ispasswordvisible,
                              validator: (value) => value!.isEmpty
                                  ? 'Password is required'
                                  : null,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  addDoctor();
                                }
                              },
                              child: const Text(
                                'Add Doctor',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
