import 'package:finalert/global/global.dart';
import 'package:finalert/global/style.dart';
import 'package:finalert/models/annonce_models.dart';
import 'package:finalert/widgets/rounded_icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnounceCard extends StatelessWidget {
  final Annonces data;
  final Function onViewMore;

  const AnnounceCard({
    Key key,
    this.onViewMore,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          height: 128.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 12.0,
                color: Colors.grey.withOpacity(.2),
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: onViewMore,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 12.0,
                                color: Colors.black.withOpacity(.1),
                                offset: const Offset(0, 3),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.titreAnnonce,
                                  style: GoogleFonts.lato(
                                    color: accentSchemeColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  truncateStringWithPoint(
                                      data.contenuAnnonce, 70),
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 12.0,
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(0, 3),
                )
              ],
              gradient: LinearGradient(
                colors: [
                  accentColor,
                  Colors.redAccent,
                ],
              ),
            ),
            child: const Center(
              child: Icon(
                CupertinoIcons.bell_fill,
                color: Colors.white,
                size: 15.0,
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: CustomIconRoundedBtn(
            color: accentColor,
            icon: CupertinoIcons.heart,
            onPressed: null,
          ),
        )
      ],
    );
  }
}
