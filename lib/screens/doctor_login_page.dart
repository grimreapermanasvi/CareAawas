import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'doctor_home_page.dart';
import 'forgot_password_page.dart'; // Import the forgotten password page

class DoctorLoginPage extends StatefulWidget {
  const DoctorLoginPage({super.key});

  @override
  _DoctorLoginPageState createState() => _DoctorLoginPageState();
}

class _DoctorLoginPageState extends State<DoctorLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _statusMessage = ''; // To display success or error messages

  // Function to send login data to the backend
  Future<void> _loginDoctor() async {
    final String apiUrl =
        'http://172.19.132.216:3000/doctor/login'; // API endpoint for login

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Assuming the response contains a success message and user data
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DoctorHomePage()),
        );
      } else {
        setState(() {
          _statusMessage = 'Invalid email or password.';
        });
      }
    } catch (error) {
      setState(() {
        _statusMessage = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Login'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login as Doctor',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loginDoctor,
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ForgotPasswordPage()), // Navigate to forgot password page
                  );
                },
                child: const Text('Forgotten Password?'),
              ),
              const SizedBox(height: 16),
              Text(
                _statusMessage,
                style: TextStyle(
                  color: _statusMessage.contains('Error')
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
