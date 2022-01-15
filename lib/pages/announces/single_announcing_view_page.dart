import 'package:finalert/global/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleAnnouncingViewPage extends StatefulWidget {
  SingleAnnouncingViewPage({Key key}) : super(key: key);

  @override
  _SingleAnnouncingViewPageState createState() =>
      _SingleAnnouncingViewPageState();
}

class _SingleAnnouncingViewPageState extends State<SingleAnnouncingViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentSchemeColor,
        title: Text(
          "Announce title",
          style: GoogleFonts.lato(
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/shape5.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            accentSchemeColor.withOpacity(.3),
                            accentSchemeColor.withOpacity(.5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    left: 10.0,
                    child: Text(
                      "Our announce big title",
                      style: GoogleFonts.lato(
                        fontSize: 25.0,
                        color: Colors.white,
                        letterSpacing: 1.0,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 8,
                            offset: const Offset(0, 1),
                          )
                        ],
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
