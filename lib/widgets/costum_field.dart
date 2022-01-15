import 'package:finalert/global/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CostumTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String expandedLabel;
  final TextEditingController controller;
  final int maxLength;
  final bool readOnly;
  final TextInputType inputType;
  const CostumTextField({
    this.icon,
    this.hintText,
    this.expandedLabel,
    this.controller,
    this.maxLength,
    this.readOnly = false,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: inputType ?? TextInputType.text,
      decoration: InputDecoration(
        hintMaxLines: maxLength,
        labelText: expandedLabel,
        hintText: '$hintText...',
        hintStyle: GoogleFonts.lato(
          color: Colors.grey[500],
        ),
        prefixIcon: Icon(
          icon,
          color: accentSchemeColor,
          size: 16.0,
        ),
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
