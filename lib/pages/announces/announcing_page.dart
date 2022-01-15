import 'package:finalert/global/style.dart';
import 'package:finalert/widgets/announes_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncingPage extends StatefulWidget {
  AnnouncingPage({Key key}) : super(key: key);

  @override
  _AnnouncingPageState createState() => _AnnouncingPageState();
}

class _AnnouncingPageState extends State<AnnouncingPage> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentSchemeColor,
        title: Text(
          "Nos annonces".toUpperCase(),
          style: GoogleFonts.lato(
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Scrollbar(
            interactive: true,
            radius: const Radius.circular(10.0),
            thickness: 5.0,
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              itemCount: 10,
              itemBuilder: (__, _) {
                return AnnounceCard();
              },
            ),
          ),
        ),
      ),
    );
  }
}
