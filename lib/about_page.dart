import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ======================================
            // STACK HEADER
            // ======================================
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Wallpaper
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/wallpaper.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Dark overlay
                Container(
                  height: 220,
                  color: Colors.black.withValues(
                    alpha: 0.20,
                  ),
                ),

                // StudentHub title
                const Positioned(
                  left: 20,
                  bottom: 70,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "StudentHub",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Student Management Application",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                // Profile image
                Positioned(
                  bottom: -50,
                  left: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/images/profile.jpg',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 70),

            // ======================================
            // NAME SECTION
            // ======================================
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "AliCat",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "102345@studenthut.edu",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ======================================
            // PERSONAL DETAILS CARD
            // ======================================
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: 0.05,
                    ),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Personal Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  _detailRow(
                    "Full Name",
                    "Muhammad Ali",
                  ),

                  _detailRow(
                    "Matric Number",
                    "102345",
                  ),

                  _detailRow(
                    "Programme",
                    "Software Engineering",
                  ),

                  _detailRow(
                    "Group",
                    "G01 T10",
                  ),

                  _detailRow(
                    "University",
                    "UNIMAS",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ======================================
            // ABOUT APP CARD
            // ======================================
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: 0.05,
                    ),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "About StudentHut",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "StudentHut is a Student Management System "
                        "student management application "
                        "developed for TMA3084 Software "
                        "Engineering Lab. It provides "
                        "student information management, "
                        "records tracking, programme "
                        "categorisation and navigation "
                        "through a modern interface.",
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Version: 1.0",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Developed using Flutter & Dart Programming",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(
      String label,
      String value,
      ) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}