import 'package:finalert/global/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CostumDropdown extends StatefulWidget {
  final String hintText;
  final String errorText;
  final List<dynamic> array;
  final dynamic value;
  final Function(dynamic value) onChanged;
  final bool isError;
  CostumDropdown({
    this.hintText,
    this.array,
    this.onChanged,
    this.value,
    this.isError = false,
    this.errorText,
  });

  @override
  _CostumDropdownState createState() => _CostumDropdownState();
}

class _CostumDropdownState extends State<CostumDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          height: 60.0,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.isError ? Colors.red : primaryColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton(
              underline: const SizedBox(),
              menuMaxHeight: 300,
              dropdownColor: Colors.white,
              alignment: Alignment.centerRight,
              borderRadius: BorderRadius.circular(5.0),
              style: GoogleFonts.lato(color: Colors.black),
              value: widget.value,
              hint: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.hintText,
                  style: GoogleFonts.mulish(
                      color: Colors.grey[600],
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic),
                ),
              ),
              isExpanded: true,
              items: widget.array.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "$e",
                      style: GoogleFonts.lato(fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              }).toList(),
              onChanged: widget.onChanged,
            ),
          ),
        ),
        if (widget.isError)
          SizedBox(
            height: 5.0,
          ),
        if (widget.isError)
          Text(
            "${widget.errorText} !",
            style: GoogleFonts.lato(color: Colors.red, fontSize: 12.0),
          )
      ],
    );
  }
}
