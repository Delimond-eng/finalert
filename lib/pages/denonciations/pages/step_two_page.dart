// ignore_for_file: deprecated_member_use

import 'package:finalert/global/style.dart';
import 'package:finalert/widgets/costum_field.dart';
import 'package:finalert/widgets/custom_check_box.dart';
import 'package:finalert/widgets/custom_dropdown.dart';
import 'package:finalert/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondStepPage extends StatefulWidget {
  final bool hasAnonymous;
  SecondStepPage({Key key, this.hasAnonymous = false}) : super(key: key);

  @override
  _SecondStepPageState createState() => _SecondStepPageState();
}

class _SecondStepPageState extends State<SecondStepPage> {
  bool isMr = false;
  bool isMme = false;

  String selectedCategoryUser = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentSchemeColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Plainte dénonciation".toUpperCase(),
              style: GoogleFonts.lato(
                fontSize: 14.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Etape 2/2",
              style: GoogleFonts.lato(
                fontSize: 16.0,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Form(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                accentSchemeColor,
                                primaryColor,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Informations sur l'accusé",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const CostumFormTextField(
                    hintText: "Entrez le nom complet de l'accusé...",
                    expandedLabel: "Nom complet de l'accusé  ",
                    errorText: "nom de l'accusé réquis !",
                    icon: Icons.assignment_ind_rounded,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumTextField(
                    hintText: "Entrez le télephone de l'accusé",
                    inputType: TextInputType.phone,
                    expandedLabel: "Téléphone de l'accusé",
                    icon: CupertinoIcons.phone,
                    maxLength: 10,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text("Genre de l'accusé"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          child: CostumChexkBox(
                            hasColored: false,
                            fontSize: 15.0,
                            onChanged: () {
                              setState(() {
                                isMr = !isMr;
                                isMme = false;

                                if (isMr) {
                                  selectedCategoryUser = "Masculin";
                                }
                              });
                            },
                            title: "Masculin",
                            value: isMr,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Container(
                          child: CostumChexkBox(
                            hasColored: false,
                            fontSize: 15.0,
                            onChanged: () {
                              setState(() {
                                isMme = !isMme;
                                isMr = false;
                                if (isMme) {
                                  selectedCategoryUser = "Féminin";
                                }
                              });
                            },
                            title: "Féminin",
                            value: isMme,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumTextField(
                    hintText: "Entrez la fonction de l'accusé...",
                    expandedLabel: "Adresse plaignant",
                    inputType: TextInputType.text,
                    icon: CupertinoIcons.location_solid,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumFormTextField(
                    hintText: "Entrez votre plainte...",
                    expandedLabel: "Plainte",
                    errorText: "plainte requise !",
                    inputType: TextInputType.multiline,
                    icon: CupertinoIcons.bubble_middle_bottom,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 60.0,
                    width: double.infinity,
                    child: RaisedButton.icon(
                      elevation: 10.0,
                      color: Colors.green[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      icon: const Icon(Icons.check, color: Colors.white),
                      label: Text(
                        "Dénoncer",
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
