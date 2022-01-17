// ignore_for_file: deprecated_member_use

import 'package:finalert/global/style.dart';
import 'package:finalert/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuiviPage extends StatefulWidget {
  SuiviPage({Key key}) : super(key: key);

  @override
  _SuiviPageState createState() => _SuiviPageState();
}

class _SuiviPageState extends State<SuiviPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentSchemeColor,
        title: Text(
          "Suivi plainte",
          style: GoogleFonts.lato(
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: const CostumFormTextField(
                hintText: "Entrez la référence de la plainte...",
                errorText: "veuillez entrer quelque chose !",
                inputType: TextInputType.text,
                expandedLabel: "Recherche",
                icon: CupertinoIcons.search,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 60.0,
              width: double.infinity,
              child: RaisedButton.icon(
                elevation: 10.0,
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                icon: const Icon(CupertinoIcons.search, color: Colors.white),
                label: Text(
                  "Rechercher",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
