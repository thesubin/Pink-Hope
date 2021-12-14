import 'package:flutter/material.dart';
import 'package:flutter_auth/models/Product.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';

class Description extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  
    return Column(
      children: [
        Container(width: double.infinity,
             decoration: BoxDecoration(
                      gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xfff1cfd5),
                          Color(0xfff1cfd5),
                      
                      ]
                    ),
                  
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44),
                      topRight: Radius.circular(44),
                    ),
                  ),
             
        padding:EdgeInsets.symmetric(vertical: size.height * 0.07,horizontal: 25),
        child: Text(
                'Pink Hope is a preventative health hub that gives our community the tools to assess, manage and reduce their risk of breast and ovarian cancer, while also providing personalised support for at-risk women. We empower people to take charge of their own health by assessing, understanding, and reducing their risk of breast and ovarian cancer. And we offer support every step of the way.',
                style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w100,
                  color: Color(0xff73313b)
                )),
              ),
        ),
      ],
    );
  }
}
