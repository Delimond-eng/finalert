import 'package:finalert/global/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncingPage extends StatefulWidget {
  AnnouncingPage({Key key}) : super(key: key);

  @override
  _AnnouncingPageState createState() => _AnnouncingPageState();
}

class _AnnouncingPageState extends State<AnnouncingPage> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
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
          child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            itemCount: 10,
            itemBuilder: (__, _) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    height: _size.height * .19,
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
                                    image:
                                        AssetImage("assets/images/shape5.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Announce title",
                                              style: GoogleFonts.lato(
                                                color: accentSchemeColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Text(
                                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, ",
                                          )
                                        ],
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
            },
          ),
        ),
      ),
    );
  }
}
