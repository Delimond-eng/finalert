// ignore_for_file: deprecated_member_use

import 'package:finalert/global/style.dart';
import 'package:finalert/widgets/costum_field.dart';
import 'package:finalert/widgets/custom_check_box.dart';
import 'package:finalert/widgets/custom_dropdown.dart';
import 'package:finalert/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';

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

  bool hasStepOne = true;

  double level = 50.0;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentSchemeColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Plainte dénonciation",
              style: GoogleFonts.lato(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Etape ${hasStepOne ? 1 : 2}/2",
              style: GoogleFonts.lato(
                fontSize: 15.0,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          height: _size.height,
          child: Column(
            children: [
              Container(
                height: 50.0,
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentSchemeColor,
                      accentSchemeColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Text(
                    hasStepOne
                        ? "1. Informations sur le plaignant"
                        : "2. Informations sur l'accusé",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              LinearPercentIndicator(
                lineHeight: 2.0,
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey[200],
                percent: (level / 100.0),
                progressColor:
                    (level <= 50.0) ? accentColor : Colors.green[800],
              ),
              Expanded(
                child: Form(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (hasStepOne) ...[
                          stepOneContent(context),
                        ] else ...[
                          stepTwoContent(context),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stepOneContent(context) {
    return Column(
      children: [
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
            icon: const Icon(Icons.keyboard_arrow_right, color: Colors.white),
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

              /*Navigator.push(
                              context,
                              PageTransition(
                                fullscreenDialog: true,
                                type: PageTransitionType.rightToLeftWithFade,
                                child: SecondStepPage(),
                              ),
                            );*/

              setState(() {
                hasStepOne = false;
                level = 100.0;
              });
            },
          ),
        )
      ],
    );
  }

  Widget stepTwoContent(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
          height: 30.0,
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
    );
  }
}
