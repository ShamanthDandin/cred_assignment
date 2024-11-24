import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepaymentPlanCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool isSelected;
  final bool isRecommended;

  const RepaymentPlanCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    this.isRecommended = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 160,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4B254A) : const Color(0xFF2F294E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isSelected)
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.black38, // Tick mark background
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              // Recommended Tag (if recommended)
              if (isRecommended)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300, // Tag background
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Recommended",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // Title (EMI Amount)
          Text(
            title!,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          // Subtitle (Duration)
          Text(
            subtitle!,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
          const Spacer(),
          // See Calculations
          Text(
            "See calculations",
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}
