import 'package:finalert/global/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CostumFormTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String errorText;
  final String expandedLabel;
  final TextEditingController controller;
  final int maxLength;
  final bool readOnly;
  final TextInputType inputType;

  const CostumFormTextField({
    this.icon,
    this.hintText,
    this.errorText,
    this.expandedLabel,
    this.controller,
    this.maxLength,
    this.readOnly = false,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        } else {
          return null;
        }
      },
      controller: controller,
      readOnly: readOnly,
      keyboardType: inputType ?? TextInputType.text,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintMaxLines: maxLength,
        labelText: expandedLabel,
        hintText: '$hintText...',
        errorStyle: GoogleFonts.lato(
          color: Colors.red,
          fontSize: 12.0,
        ),
        counterText: '',
        hintStyle: GoogleFonts.lato(
          color: Colors.grey[500],
        ),
        prefix: inputType == TextInputType.phone ? const Text("+243 ") : null,
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
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
