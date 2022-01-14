// ignore_for_file: prefer_const_constructors

import 'package:finalert/global/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/drc.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: _size.height,
          width: _size.width,
          child: Column(
            children: [
              headerBox(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: GridView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .95,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    children: [
                      HomeMenuBtn(
                        icon: "assets/icons/world-grid-svgrepo-com.svg",
                        title: "Nos annonces",
                        description:
                            "Découvrez nos annonces sur les tracasseries",
                      ),
                      HomeMenuBtn(
                        icon: "assets/icons/talking-pac-man-svgrepo-com.svg",
                        title: "Je dénonce...",
                        description: "Dénoncez tout type de tracasseries",
                      ),
                      HomeMenuBtn(
                        icon: "assets/icons/marketing-research-svgrepo-com.svg",
                        title: "Suivi plainte",
                        description: "Suivez le statut de votre plainte",
                      ),
                      HomeMenuBtn(
                        icon: "assets/icons/information-point-svgrepo-com.svg",
                        title: "Aide",
                        description:
                            "Découvrez comment denoncer de tracasseries ",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerBox() {
    var _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: _size.height * .4,
          width: _size.width,
          decoration: BoxDecoration(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  accentSchemeColor,
                  primaryColor,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "FinAlert",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Loger vos plaintes pour dénonciation au Ministère de finance",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            child: Row(
              children: [
                Container(
                  width: _size.width / 3,
                  height: 2.0,
                  color: primaryColor,
                ),
                Container(
                  width: _size.width / 3,
                  height: 2.0,
                  color: accentColor,
                ),
                Container(
                  width: _size.width / 3,
                  height: 2.0,
                  color: secondaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class HomeMenuBtn extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  HomeMenuBtn({
    Key key,
    this.icon,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 12.0,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 50.0,
            width: 50.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: accentSchemeColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.grey[800],
              fontSize: 14.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
