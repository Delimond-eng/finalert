import 'package:finalert/constants/controllers.dart';
import 'package:finalert/global/style.dart';
import 'package:finalert/models/provinces_models.dart';
import 'package:finalert/models/territoires_models.dart';
import 'package:finalert/widgets/costum_field.dart';
import 'package:finalert/widgets/custom_check_box.dart';
import 'package:finalert/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepOnePage extends StatefulWidget {
  final bool hasAnonyme;
  final Function onNext;
  StepOnePage({Key key, this.onNext, this.hasAnonyme}) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  Provinces selectedRegion;
  bool hasRegionError = false;
  Territoires selectedCity;
  bool hasCityError = false;

  bool isMr = false;
  bool isMme = false;
  bool isPerson = false;
  String selectedCategoryUser = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        if (widget.hasAnonyme) ...[
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              bottom: 8.0,
            ),
            child: Text(
              "Civilité du plaignant",
              style: GoogleFonts.lato(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
                          selectedCategoryUser = "Monsieur";
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
                          selectedCategoryUser = "Madame";
                        }
                      });
                    },
                    title: "Madame",
                    value: isMme,
                  ),
                ),
              ),
            ],
          ),
          CostumChexkBox(
            hasColored: false,
            fontSize: 15.0,
            onChanged: () {
              setState(() {
                isPerson = true;
                isMr = false;
                isMme = false;
                if (isMr) {
                  selectedCategoryUser = "Personne morale";
                }
              });
            },
            title: "Personne morale",
            value: isPerson,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const CostumFormTextField(
            hintText: "Entrez le nom complet...",
            expandedLabel: "Nom complet du plaignant",
            errorText: "nom du plaignant réquis !",
            icon: Icons.assignment_ind_outlined,
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
        ],
        Row(
          children: [
            Container(
              height: 58.0,
              width: 70.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  "+243",
                  style: GoogleFonts.lato(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 2.0,
            ),
            const Flexible(
              child: CostumFormTextField(
                hintText: "n° de tél...",
                errorText: "téléphone du plaignant réquis !",
                inputType: TextInputType.phone,
                expandedLabel: "Téléphone du plaignant",
                icon: null,
                maxLength: 9,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: hasRegionError ? Colors.red : primaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  underline: const SizedBox(),
                  menuMaxHeight: 400,
                  dropdownColor: Colors.white,
                  alignment: Alignment.centerRight,
                  style: GoogleFonts.lato(color: Colors.black),
                  value: selectedRegion,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sélectionnez la province du plaignant",
                      style: GoogleFonts.mulish(
                        color: Colors.grey[600],
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  items: homeController.provinces.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          e.libelleVille,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value;
                    });
                    print(selectedRegion.id);
                  },
                ),
              ),
            ),
            if (hasRegionError)
              SizedBox(
                height: 5.0,
              ),
            if (hasRegionError)
              Text(
                "province du plaignant réquise !",
                style: GoogleFonts.lato(color: Colors.red, fontSize: 12.0),
              )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: hasCityError ? Colors.red : primaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  underline: const SizedBox(),
                  menuMaxHeight: 400,
                  dropdownColor: Colors.white,
                  alignment: Alignment.centerRight,
                  style: GoogleFonts.lato(color: Colors.black),
                  value: selectedCity,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Commune/Territoire du plaignant",
                      style: GoogleFonts.mulish(
                        color: Colors.grey[600],
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  items: homeController.territoires.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          e.libelleTerritoire,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                    print(selectedCity.id);
                  },
                ),
              ),
            ),
            if (hasCityError)
              const SizedBox(
                height: 5.0,
              ),
            if (hasCityError)
              Text(
                "Commune/Territoire du plaignant réquise !",
                style: GoogleFonts.lato(color: Colors.red, fontSize: 12.0),
              )
          ],
        ),
        if (widget.hasAnonyme) ...[
          const SizedBox(
            height: 10.0,
          ),
          const CostumTextField(
            hintText: "Entrez l'adresse...",
            expandedLabel: "Adresse plaignant",
            inputType: TextInputType.streetAddress,
            icon: CupertinoIcons.location_solid,
          ),
        ],
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
              widget.onNext();
            },
          ),
        )
      ],
    );
  }
}
