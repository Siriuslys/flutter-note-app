import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(
              left: 80.0,
              right: 80,
              bottom: 40,
              top: 160,
            ),
            child: Image.asset('lib/images/face.png'),
          ),

          // Text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Welcome to Note Taking App",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Notes
          Text(
            "Time, Note taking, Habbit tracker",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),

          const Spacer(),

          // Get Started Button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const Spacer(),

          
        ],
      ),
    );
  }
}