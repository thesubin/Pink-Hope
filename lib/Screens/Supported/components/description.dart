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
                'Looking for more information and a little help? You’ve come to the right place. Whether you’ve just been diagnosed with cancer, have a genetic mutation, or are interested in knowing if you’re at risk of either of those, we can help. Here at Pink Hope we provide personalised support for your situation to help you better understand the risk of breast and ovarian cancer. We want to make sure the services and support we provide makes your health journey easier to navigate. We don’t want you to feel alone. We are always here for you.',
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
