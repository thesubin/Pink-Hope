import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Mission extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  
    return Column(
      children: [
        
        Container(width: double.infinity,
             decoration: BoxDecoration(
                  
                    color: Colors.white,
                    ),
             
        padding:EdgeInsets.symmetric(vertical: size.height * 0.07,horizontal: 25),
        child:
        Column(
          children: [
            Text(
                'Our Mission',
                style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                
                  
                )),
              )    
            ,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:Text(
                'Here at Pink Hope, we want to ensure every woman is empowered to take control of their breast and ovarian cancer risk, by providing tools, education and support to members of the at-risk community. We also work collaboratively with healthcare providers to ensure a better transition for at-risk women as they move through each stage of their journey, and we promote open discussion around family health history in Australia through targeted campaigns and education. We also advocate for women at risk of breast and ovarian cancer and their families with the aim of earlier diagnoses, risk reduction, and better treatment options. This is how we do this:' ,
                 style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                  
                  color: Color(0xff73313b),
                  fontWeight: FontWeight.w100
                )
                ),
              ))
              ]),
        ),
      ],
    );
  }
}
