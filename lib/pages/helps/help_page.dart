import 'package:finalert/global/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HelpBtn(
                        icon: CupertinoIcons.question_circle_fill,
                        title: "Comment ça marche ?",
                        desc: "Voir la démarche de l’application",
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16))),
                            builder: (context) => DraggableScrollableSheet(
                              initialChildSize: 0.4,
                              minChildSize: 0.2,
                              maxChildSize: 0.75,
                              expand: false,
                              builder: (_, controller) => Column(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    color: Colors.grey[600],
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ListView(
                                        controller: controller,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        children: [
                                          Text(
                                            "1. Je denonce ?",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: accentSchemeColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                                "Pour denoncer tout type de tracasseries:\n-cliquer sur le menu je denonce-choisir le type de dénonciation.\n-remplir les informations du plaignat\n-remplir les informations de l'accusé\n-joindre les preuves au cas où Vous recevrez un SMS avec le numero refence de la plainte que vous utiliserez pour suivre la plaintedans le menu suivre plainte"),
                                          ),
                                          Text(
                                            "2. Nos annonces",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: accentSchemeColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                                "Rester connecté en recevant toutes les annonces provenant du ministere de finance"),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            "3. Suivi plainte",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              color: accentSchemeColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                                "Rechercher une plainte en mentionnant son numero reference dans la barre des recherches"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      HelpBtn(
                        icon: CupertinoIcons.info_circle_fill,
                        title: "FinAlerte",
                        desc: "En savoir plus sur FinAlerte",
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16))),
                            builder: (context) => DraggableScrollableSheet(
                              initialChildSize: 0.4,
                              minChildSize: 0.2,
                              maxChildSize: 0.75,
                              expand: false,
                              builder: (_, controller) => Column(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    color: Colors.grey[600],
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ListView(
                                        controller: controller,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        children: [
                                          Text(
                                            "En savoir plus",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: accentSchemeColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                                "Chers plaignants (Mesdames et Messieurs), nous vous prions de bien vouloir communiquer avec le Ministère des Finances sur les cas de:\n\n - Plaintes pour tracasseries fiscales;\n - Dénonciation des cas de fraudes tant douanières que fiscales;\n - Dénonciation des cas de détournements des deniers publics; \n - Dénonciation des cas d’évasion fiscale.\n La bonne gouvernance implique :  \n\n - La responsabilité ; \n - L'obligation de rendre compte de ses actes ; \n - La participation ; \n - La capacité de répondre aux besoins de la population."),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      HelpBtn(
                        icon: Icons.apps_sharp,
                        title: "Autres applications",
                        desc: "Voir les autres applications du M.F",
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16))),
                            builder: (context) => DraggableScrollableSheet(
                              initialChildSize: 0.4,
                              minChildSize: 0.2,
                              maxChildSize: 0.75,
                              expand: false,
                              builder: (_, controller) => Column(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    color: Colors.grey[600],
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: ListView(
                                        controller: controller,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              Text(
                                                "Déclarer la TVA mensuelle",
                                                style: GoogleFonts.lato(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: accentSchemeColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              Text(
                                                "Demander une immatriculation",
                                                style: GoogleFonts.lato(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: accentSchemeColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              Text(
                                                "Demander le rembourssement",
                                                style: GoogleFonts.lato(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: accentSchemeColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              Text(
                                                "Declarer les stocks",
                                                style: GoogleFonts.lato(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: accentSchemeColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              Text(
                                                "Declarer les assujetissement à la TVA",
                                                style: GoogleFonts.lato(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: accentSchemeColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              Text(
                                                "Declarer IBP",
                                                style: GoogleFonts.lato(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: accentSchemeColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons
                                                  .arrow_right_alt_outlined),
                                              Text(
                                                "Declarer Acompte provisionnel",
                                                style: GoogleFonts.lato(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: accentSchemeColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIconBtn(
                            svg: "assets/icons/fb.svg",
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          SocialIconBtn(
                            svg: "assets/icons/insta.svg",
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          SocialIconBtn(
                            svg: "assets/icons/twitter.svg",
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          SocialIconBtn(
                            svg: "assets/icons/youtube.svg",
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          SocialIconBtn(
                            svg: "assets/icons/web.svg",
                          ),
                        ],
                      )
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
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(.7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 12.0,
                          offset: const Offset(0, 8),
                        )
                      ],
                      image: const DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Chers plaignants (Mesdames et Messieurs), nous vous prions de bien vouloir communiquer avec le Ministère des Finances ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w400,
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
                  height: 4.0,
                  color: primaryColor,
                ),
                Container(
                  width: _size.width / 3,
                  height: 4.0,
                  color: accentColor,
                ),
                Container(
                  width: _size.width / 3,
                  height: 4.0,
                  color: secondaryColor,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 20.0,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            color: Colors.white,
            icon: const Icon(Icons.arrow_back_sharp),
          ),
        )
      ],
    );
  }
}

class SocialIconBtn extends StatelessWidget {
  final String svg;
  const SocialIconBtn({
    Key key,
    this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 12.0,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Center(
        child: SvgPicture.asset(svg),
      ),
    );
  }
}

class HelpBtn extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Function onPressed;
  const HelpBtn({
    Key key,
    this.icon,
    this.title,
    this.desc,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: primaryColor, width: 1.5),
        ),
      ),
      width: double.infinity,
      height: 90.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: primaryColor,
                  size: 40.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.lato(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      desc,
                      style: GoogleFonts.lato(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
