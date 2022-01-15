import 'package:finalert/global/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentArea extends StatelessWidget {
  final TextEditingController controller;
  final Function onPressed;
  const CommentArea({
    Key key,
    this.controller,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 12.0,
            offset: const Offset(0.0, 10.0),
          )
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                style: const TextStyle(fontSize: 14.0),
                keyboardType: TextInputType.multiline,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                  hintText: "Ecrire un commentaire...",
                  hintStyle: GoogleFonts.lato(
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      CupertinoIcons.pencil,
                      color: primaryColor,
                      size: 20.0,
                    ),
                  ),
                  border: InputBorder.none,
                  counterText: '',
                  suffixIcon: CustomGradientIconBtn(
                    onPressed: onPressed,
                    icon: Icons.send_rounded,
                    iconColor: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        primaryColor,
                        accentSchemeColor,
                      ],
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.7),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: accentSchemeColor, width: 1.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 12.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGradientIconBtn extends StatelessWidget {
  final Function onPressed;
  final Gradient gradient;
  final IconData icon;
  final Color iconColor;
  const CustomGradientIconBtn({
    Key key,
    this.onPressed,
    this.gradient,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 60.0,
      decoration: BoxDecoration(
        gradient: gradient,
        /*LinearGradient(
          colors: [
            Colors.yellow[500],
            accentColor,
          ],
        ),*/
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 12.0,
            color: Colors.black.withOpacity(.1),
            offset: const Offset(0.0, 10.0),
          )
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: onPressed,
          child: Center(
            child: Icon(
              //CupertinoIcons.photo_camera_solid,
              icon,
              color: iconColor,
              size: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
