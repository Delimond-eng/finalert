import 'package:finalert/global/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconRoundedBtn extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool isActived;
  final Function onPressed;
  const CustomIconRoundedBtn({
    Key key,
    this.color,
    this.icon,
    this.isActived = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 30.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 1.0,
        ),
        color: isActived ? color : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50.0),
          child: Center(
            child: Icon(
              icon,
              size: 15.0,
              color: isActived ? Colors.white : color,
            ),
          ),
        ),
      ),
    );
  }
}
