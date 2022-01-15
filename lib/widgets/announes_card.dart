import 'package:finalert/global/style.dart';
import 'package:finalert/pages/announces/single_announcing_view_page.dart';
import 'package:finalert/widgets/rounded_icon_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class AnnounceCard extends StatelessWidget {
  final Function onLiked, onCommented, onViewMore;

  const AnnounceCard({
    Key key,
    this.onCommented,
    this.onLiked,
    this.onViewMore,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Colors.black.withOpacity(.1),
                            offset: const Offset(0, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/shape5.jpg"),
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
                              "Announce title",
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
                              "Le lorem ipsum est, en imprimerie, une suite de mots...",
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CustomIconRoundedBtn(
                                      color: accentColor,
                                      icon: CupertinoIcons.heart,
                                      onPressed: onLiked,
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    CustomIconRoundedBtn(
                                      color: primaryColor,
                                      icon: CupertinoIcons.chat_bubble_text,
                                      isActived: true,
                                      onPressed: onCommented,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    gradient: LinearGradient(
                                      colors: [accentSchemeColor, primaryColor],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Colors.black.withOpacity(.1),
                                        offset: const Offset(0, 3),
                                      )
                                    ],
                                  ),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: onViewMore,
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_right_alt_outlined,
                                          color: Colors.white,
                                          size: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
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
                  primaryColor,
                  accentSchemeColor,
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
        )
      ],
    );
  }
}
