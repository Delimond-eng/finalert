// ignore_for_file: deprecated_member_use

import 'package:finalert/global/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'pages/step_one_page.dart';
import 'pages/step_two_page.dart';

class IdentityAnonymousPage extends StatefulWidget {
  final bool hasAnonymous;
  IdentityAnonymousPage({Key key, this.hasAnonymous = false}) : super(key: key);

  @override
  _IdentityAnonymousPageState createState() => _IdentityAnonymousPageState();
}

class _IdentityAnonymousPageState extends State<IdentityAnonymousPage> {
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
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (hasStepOne) ...[
                          StepOnePage(
                            hasAnonyme: widget.hasAnonymous,
                            onNext: () {
                              setState(() {
                                hasStepOne = false;
                                level = 100.0;
                              });
                            },
                          ),
                        ] else ...[
                          StepTwoPage(),
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
}

class AttachmentBtn extends StatelessWidget {
  final String title;
  final bool hasFile;
  final Function onPressed;
  AttachmentBtn({
    Key key,
    this.title,
    this.onPressed,
    this.hasFile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 100.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: hasFile ? accentSchemeColor : Colors.grey[300],
        ),
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.attach_file_rounded,
                color: accentSchemeColor,
                size: 20.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
