// ignore_for_file: deprecated_member_use

import 'package:finalert/global/style.dart';
import 'package:finalert/widgets/custom_check_box.dart';
import 'package:finalert/widgets/custom_dropdown.dart';
import 'package:finalert/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IdentityAnonymousPage extends StatefulWidget {
  IdentityAnonymousPage({Key key}) : super(key: key);

  @override
  _IdentityAnonymousPageState createState() => _IdentityAnonymousPageState();
}

class _IdentityAnonymousPageState extends State<IdentityAnonymousPage> {
  String selectedRegion;
  String selectedCity;
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
                          padding: const EdgeInsets.all(10.0),
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
                                fontWeight: FontWeight.w500,
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
                  const Text("Vous êtes ?"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CostumChexkBox(
                          hasColored: false,
                          onChanged: () {},
                          title: "Monsieur",
                          value: true,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: CostumChexkBox(
                          hasColored: false,
                          onChanged: () {},
                          title: "Madame",
                          value: true,
                        ),
                      ),
                    ],
                  ),
                  CostumChexkBox(
                    hasColored: false,
                    onChanged: () {},
                    title: "Personne morale",
                    value: false,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumFormTextField(
                    hintText: "Entrez le nom complet...",
                    expandedLabel: "Nom complet du plaignant",
                    errorText: "nom du plaignat réquis !",
                    icon: Icons.assignment_ind_outlined,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumFormTextField(
                    hintText: "Entrez le télephone...10 chiffres",
                    expandedLabel: "Téléphone(10 chiffres) plaignant",
                    errorText: "téléphone du plaignat réquis !",
                    icon: CupertinoIcons.phone,
                    maxLength: 10,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumFormTextField(
                    hintText: "Entrez l'email...exemple@cd.com",
                    expandedLabel: "Email plaignant",
                    icon: CupertinoIcons.envelope,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CostumDropdown(
                    array: ["province 1", "province 2"],
                    errorText: "province du plaignant réquise !",
                    hintText: "Entrez la province du plaignant",
                    onChanged: (value) {},
                    value: selectedRegion,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CostumDropdown(
                    array: ["ville", "ville2"],
                    errorText: "ville du plaignant réquise !",
                    hintText: "Entrez la ville du plaignant",
                    onChanged: (value) {},
                    value: selectedCity,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const CostumFormTextField(
                    hintText: "Entrez l'adresse...exemple@cd.com",
                    expandedLabel: "Adresse plaignant",
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
