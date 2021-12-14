import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function onTap;
  final bool enable;
  const NotificationTiles({
    Key key, this.title, this.subtitle, this.onTap, this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/bag_1.png'), fit: BoxFit.cover))),
      title: Text(title, style: GoogleFonts.mulish(textStyle:TextStyle(color: Color(0xff73313b)))),
      subtitle: Text(subtitle,
          style: GoogleFonts.mulish(textStyle:TextStyle(color: Color(0xff73313b),fontWeight: FontWeight.w100))),
      onTap: onTap,
      enabled: enable,
    );
  }
}