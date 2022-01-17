// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:finalert/constants/controllers.dart';
import 'package:finalert/global/dialog.dart';
import 'package:finalert/global/global.dart';
import 'package:finalert/global/style.dart';
import 'package:finalert/models/entity_models.dart';
import 'package:finalert/models/plainte_model.dart';
import 'package:finalert/models/provinces_models.dart';
import 'package:finalert/models/territoires_models.dart';
import 'package:finalert/models/type_plainte_models.dart';
import 'package:finalert/services/api_manager.dart';
import 'package:finalert/widgets/attachment_widget.dart';
import 'package:finalert/widgets/costum_field.dart';
import 'package:finalert/widgets/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class StepTwoPage extends StatefulWidget {
  StepTwoPage({Key key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  bool isPreuve = false;
  bool isNotPreuve = true;

  Provinces selectedRegion;
  bool hasRegionError = false;
  Territoires selectedCity;
  bool hasCityError = false;
  Entites selectedEntity;
  bool hasEntityError = false;
  TypePlaintes selectedMotif;
  bool hasMotifError = false;

  bool hasFile1 = false;
  List<Territoires> territoires = [];

  //textField
  final TextEditingController textNom = TextEditingController();
  final TextEditingController textService = TextEditingController();
  String preuveStrImage = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //entité dropdown
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
                  color: hasEntityError ? Colors.red : primaryColor,
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
                  value: selectedEntity,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sélectionnez l'entité de l'accusé",
                      style: GoogleFonts.mulish(
                        color: Colors.grey[600],
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  items: homeController.entites.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              height: 10.0,
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Colors
                                    .primaries[Random()
                                        .nextInt(Colors.primaries.length)]
                                    .shade900,
                              ),
                              margin: const EdgeInsets.only(right: 5.0),
                            ),
                            Flexible(
                              child: Text(
                                e.nomEntite,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                  color: accentSchemeColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedEntity = value;
                      hasEntityError = false;
                    });
                  },
                ),
              ),
            ),
            if (hasEntityError)
              const SizedBox(
                height: 5.0,
              ),
            if (hasRegionError)
              Text(
                "l'entité de l'accusé est réquise !",
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
                  color: hasEntityError ? Colors.red : primaryColor,
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
                  value: selectedMotif,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sélectionnez le motif de la plainte",
                      style: GoogleFonts.mulish(
                        color: Colors.grey[600],
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  items: homeController.typePlaintes.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          e.libelleTypePlainte,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: accentSchemeColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMotif = value;
                      hasMotifError = false;
                    });
                  },
                ),
              ),
            ),
            if (hasEntityError)
              const SizedBox(
                height: 5.0,
              ),
            if (hasRegionError)
              Text(
                "le motif de la plainte est réquis !",
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
                      "Province du plaignant",
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
                            fontSize: 15.0,
                            color: accentSchemeColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      hasRegionError = false;
                      selectedRegion = value;
                      territoires.clear();
                      homeController.territoires.forEach((e) {
                        if (e.villeId == selectedRegion.id) {
                          territoires.add(e);
                        }
                      });
                    });
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
                "Province du plaignant réquise !",
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
                      "Localisation de l'accusé",
                      style: GoogleFonts.mulish(
                        color: Colors.grey[600],
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  items: territoires.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          e.libelleTerritoire,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: accentSchemeColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                      hasCityError = false;
                    });
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
                "Localisation de l'accusé réquise !",
                style: GoogleFonts.lato(color: Colors.red, fontSize: 12.0),
              )
          ],
        ),

        const SizedBox(
          height: 10.0,
        ),
        CostumTextField(
          hintText: "Entrez le service d'attache de l'accusé",
          inputType: TextInputType.text,
          expandedLabel: "Service d'attache",
          icon: CupertinoIcons.pencil,
          controller: textService,
        ),
        const SizedBox(
          height: 10.0,
        ),
        CostumTextField(
          hintText: "Entrez le nom de l'accusé...",
          expandedLabel: "Nom complet de l'accusé",
          inputType: TextInputType.text,
          icon: CupertinoIcons.person_fill,
          controller: textNom,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: CostumChexkBox(
                hasColored: false,
                fontSize: 15.0,
                onChanged: () {
                  setState(() {
                    isPreuve = false;
                    isNotPreuve = true;
                  });
                },
                title: "Sans preuve",
                value: isNotPreuve,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: CostumChexkBox(
                hasColored: false,
                fontSize: 15.0,
                onChanged: () {
                  setState(() {
                    isPreuve = true;
                    isNotPreuve = false;
                    preuveStrImage = "";
                  });
                },
                title: "Avec preuve",
                value: isPreuve,
              ),
            ),
          ],
        ),
        if (isPreuve) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AttachmentBtn(
                  title: "Image",
                  hasFile: hasFile1,
                  image: preuveStrImage,
                  onPressed: () async {
                    var picked = await takePhoto(source: ImageSource.gallery);
                    var imageBytes = File(picked.path).readAsBytesSync();
                    var strImage = base64Encode(imageBytes);

                    if (picked != null) {
                      setState(() {
                        hasFile1 = true;
                        preuveStrImage = strImage;
                      });
                    }
                  },
                ),
                AttachmentBtn(
                  title: "Document",
                  onPressed: () {},
                ),
                AttachmentBtn(
                  title: "Audio",
                  onPressed: () {},
                ),
              ],
            ),
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
            color: Colors.green[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            icon: const Icon(Icons.check, color: Colors.white),
            label: Text(
              "Dénoncer",
              style: GoogleFonts.lato(color: Colors.white),
            ),
            onPressed: () async {
              setState(() {
                if (selectedRegion == null) {
                  hasRegionError = true;
                  return;
                }
                if (hasCityError == null) {
                  hasCityError = true;
                  return;
                }
                if (selectedEntity == null) {
                  hasEntityError = true;
                  return;
                }

                if (selectedMotif == null) {
                  hasMotifError = true;
                  return;
                }
              });
              PlainteAccuse info2 = PlainteAccuse(
                motifAccuse: selectedMotif.libelleTypePlainte,
                entiteAccuse: selectedEntity.nomEntite,
                nomAccuse: textNom.text,
                provinceAccuse: selectedRegion.libelleVille,
                serviceAccuse: textService.text,
                territoireAccuse: selectedCity.libelleTerritoire,
              );
              Xloading.showLoading(context);
              await ApiManager.savePlainte(
                      infosAccuse: info2,
                      infosPlaignant: homeController.plaignantInfos.value)
                  .then((res) {
                Xloading.dismiss();
                print(res);
              });
            },
          ),
        )
      ],
    );
  }
}
