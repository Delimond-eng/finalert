import 'dart:convert';

import 'package:finalert/global/style.dart';
import 'package:flutter/material.dart';

class AttachmentBtn extends StatelessWidget {
  final String title;
  final bool hasFile;
  final String image;
  final Function onPressed;
  AttachmentBtn({
    Key key,
    this.title,
    this.onPressed,
    this.hasFile = false,
    this.image = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 100.0,
      decoration: BoxDecoration(
        image: image.isNotEmpty
            ? DecorationImage(
                image: MemoryImage(base64Decode(image)),
                fit: BoxFit.cover,
              )
            : null,
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
