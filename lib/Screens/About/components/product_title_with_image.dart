import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'package:google_fonts/google_fonts.dart';



class ProductTitleWithImage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin,vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Pink Hope",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "Who we Are",
              style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  fontSize: 40.0,
                    fontWeight: FontWeight.w400,
                color: Colors.white
              
          ))),
          SizedBox(height: kDefaultPaddin),
        ],
      ),
    );
  }
}
