import 'package:flutter/material.dart';
import 'doctor_login_page.dart';
import 'patient_login_page.dart';
import 'organization_login_page.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Stack(
        children: [
          // Background Design Elements (Gradient Circles)
          Positioned(
            top: -100,
            right: -100,
            child: _buildGradientCircle(200),
          ),
          Positioned(
            top: 100,
            left: -150,
            child: _buildGradientCircle(150),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: _buildGradientCircle(180),
          ),
          Positioned(
            bottom: 50,
            right: -120,
            child: _buildGradientCircle(220),
          ),
          Positioned(
            top: 250,
            right: -70,
            child: _buildGradientCircle(120),
          ),
          Positioned(
            top: 180,
            left: 50,
            child: _buildGradientCircle(130),
          ),
          Positioned(
            top: 300,
            left: 120,
            child: _buildGradientCircle(160),
          ),
          Positioned(
            top: 400,
            right: 80,
            child: _buildGradientCircle(190),
          ),
          Positioned(
            top: 500,
            left: 200,
            child: _buildGradientCircle(140),
          ),
          Positioned(
            top: 600,
            right: 150,
            child: _buildGradientCircle(180),
          ),
          Positioned(
            bottom: 150,
            left: 250,
            child: _buildGradientCircle(150),
          ),
          Positioned(
            bottom: 200,
            right: 200,
            child: _buildGradientCircle(170),
          ),
          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Logo Section with Icon
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.health_and_safety_rounded,
                      size: 60,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Welcome Text Section
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.teal[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Careआवास',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.teal[700],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  const SizedBox(height: 60),
                  // Role Selection Boxes - Horizontal Layout
                  Expanded(
                    child: ListView(
                      children: [
                        _buildRoleBox(
                          context,
                          'Doctor',
                          Icons.medical_services_rounded,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DoctorLoginPage(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildRoleBox(
                          context,
                          'Patient',
                          Icons.person_rounded,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PatientLoginPage(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildRoleBox(
                          context,
                          'NGO',
                          Icons.business_rounded,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrganizationLoginPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create gradient circles
  Widget _buildGradientCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.white, Colors.teal[100]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _buildRoleBox(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Colors.teal[200]!,
              Colors.teal[400]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 40,
                color: Colors.teal[700],
              ),
            ),
            const SizedBox(width: 20),
            // Title Section
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
