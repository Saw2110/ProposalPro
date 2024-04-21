import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffffcb4c),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 30,
            color: const Color(0xff493d00),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
