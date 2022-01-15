import 'package:finalert/global/dialog.dart';
import 'package:finalert/global/style.dart';
import 'package:finalert/widgets/comment_area_widget.dart';
import 'package:finalert/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
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
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                                    accentSchemeColor.withOpacity(.4),
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
                                    offset: const Offset(0, 2),
                                  )
                                ],
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10.0,
                            left: 10.0,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: accentColor,
                                  width: 1.0,
                                ),
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.2),
                                    blurRadius: 12.0,
                                    offset: const Offset(0, 3),
                                  )
                                ],
                              ),
                              child: Material(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.heart,
                                      size: 18.0,
                                      color: accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.lato(
                            color: Colors.grey[800],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            CommentArea(
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Future<void> writeComment(context) async {
    /*Modal.show(
      context,
      height: 230.0,
      title: "Votre commentaire",
      modalContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: StatefulBuilder(
            builder: (context, setter) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Veuillez saisir votre commentaire !",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        const Flexible(
                          child: CostumFormTextField(
                            errorText: "commentaire réquis !",
                            expandedLabel: "Commentaire",
                            hintText: "Entrez votre commentaire !",
                            icon: CupertinoIcons.t_bubble,
                            inputType: TextInputType.multiline,
                          ),
                        ),
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(5.0),
                            ),
                          ),
                          child: InkWell(
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(5.0),
                            ),
                            onTap: (){},
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.bubble_left,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    // ignore: sized_box_for_whitespace
                  ],
                ),
              );
            },
          )),
    );*/
  }
}
