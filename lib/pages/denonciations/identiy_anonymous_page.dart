// ignore_for_file: deprecated_member_use

import 'package:finalert/global/style.dart';
import 'package:finalert/widgets/costum_field.dart';
import 'package:finalert/widgets/custom_check_box.dart';
import 'package:finalert/widgets/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'pages/step_two_page.dart';

class IdentityAnonymousPage extends StatefulWidget {
  final bool hasAnonymous;
  IdentityAnonymousPage({Key key, this.hasAnonymous = false}) : super(key: key);

  @override
  _IdentityAnonymousPageState createState() => _IdentityAnonymousPageState();
}

class _IdentityAnonymousPageState extends State<IdentityAnonymousPage> {
  String selectedRegion;
  bool hasRegionError = false;
  String selectedCity;
  bool hasCityError = false;

  bool isMr = false;
  bool isMme = false;
  bool isPerson = false;
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
              "Etape 1/2",
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
                              "Informations sur le plaignant",
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
                  const CostumTextField(
                    hintText: "Entrez le nom complet...",
                    expandedLabel: "Nom complet du plaignant",
                    icon: Icons.assignment_ind_outlined,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumTextField(
                    hintText: "Entrez le télephone du plaignant",
                    inputType: TextInputType.phone,
                    expandedLabel: "Téléphone du plaignant",
                    icon: CupertinoIcons.phone,
                    maxLength: 10,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumTextField(
                    hintText: "Entrez l'email du plaignant...",
                    inputType: TextInputType.emailAddress,
                    expandedLabel: "Email du plaignant",
                    icon: CupertinoIcons.envelope,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CostumDropdown(
                    array: ["province 1", "province 2"],
                    errorText: "province du plaignant réquise !",
                    hintText: "Entrez la province du plaignant",
                    isError: hasRegionError,
                    onChanged: (value) {},
                    value: selectedRegion,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CostumDropdown(
                    array: ["ville", "ville2"],
                    isError: hasCityError,
                    errorText: "ville du plaignant réquise !",
                    hintText: "Entrez la ville du plaignant",
                    onChanged: (value) {},
                    value: selectedCity,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumTextField(
                    hintText: "Entrez l'adresse...",
                    expandedLabel: "Adresse plaignant",
                    inputType: TextInputType.streetAddress,
                    icon: CupertinoIcons.location_solid,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 60.0,
                    width: double.infinity,
                    child: RaisedButton.icon(
                      elevation: 10.0,
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_right,
                          color: Colors.white),
                      label: Text(
                        "Suivant",
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                      onPressed: () {
                        /*if (selectedRegion == null) {
                          setState(() {
                            hasRegionError = !hasRegionError;
                          });
                        }
                        if (selectedCity == null) {
                          setState(() {
                            hasCityError = !hasCityError;
                          });
                        }*/

                        Navigator.push(
                          context,
                          PageTransition(
                            fullscreenDialog: true,
                            type: PageTransitionType.rightToLeftWithFade,
                            child: SecondStepPage(),
                          ),
                        );
                      },
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
