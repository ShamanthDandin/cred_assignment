import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePlanButton extends StatelessWidget {
  final VoidCallback onTap;

  const CreatePlanButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white70, // Border color
            width: 1.5, // Border width
          ),
          borderRadius: BorderRadius.circular(30), // Rounded border
        ),
        child: Text(
          "Create your own plan",
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white70, // Text color
          ),
        ),
      ),
    );
  }
}
