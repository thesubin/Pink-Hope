import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Ask Our Genetic Counsellor',
                style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  fontSize: 30.0,
                    fontWeight: FontWeight.w400,
                color: kPrimaryColor
                  
                )),
              )    
            ,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:Text(
                'This free Pink Hope service allows you to submit questions about being at risk. If you’re interested in knowing if you are at-risk, getting genetic testing or learning about ways to reduce your risk, this service is for you. Our Pink Hope Genetic Counsellor can provide general information relating to your situation and can advise the kinds of questions to ask your doctor about your specific situation.' ,
                 style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                  
                  color: Color(0xff73313b),
                  fontWeight: FontWeight.w100
                )
                ),
              ))
              ]),
        ),
         Container(width: double.infinity,
             decoration: BoxDecoration(
                  
                    color: Colors.white,
                    ),
             
        padding:EdgeInsets.symmetric(vertical: size.height * 0.01,horizontal: 25),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Text(
                'Online Support Groups',
                
                textAlign: TextAlign.left,
                style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  fontSize: 30.0,
                    fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                
                  
                )),
              )    
            ,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:Text(
                'If you feel more comfortable on your laptop, live too far from an in-person event, or just need a safe and supportive environment, Pink Hope’s peer support program on Facebook is here for you. Our closed and private groups are a great way to connect with women who are going through the same worries, treatments, and recovery as you. People jump in to give support, provide reassurance, or offer advice when they can as well as seek support. These groups are there for you to use in a way that helps you the most. Please note members are required to follow the group guidelines which are published in each group.Interested? The online support groups that you can join are:' ,
                 style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                  
                  color: Color(0xff73313b),
                  fontWeight: FontWeight.w100
                )
                ),
              ))
              ]),
        ),
          Container(width: double.infinity,
             decoration: BoxDecoration(
                  
                    color: Colors.white,
                    ),
             
        padding:EdgeInsets.symmetric(vertical: size.height * 0.01,horizontal: 25),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Text(
                'National Support Group',
                
                textAlign: TextAlign.left,
                style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                
                  
                )),
              )    
            ,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:Text(
                'For women who are at increased risk of breast and ovarian cancer or who are facing hereditary cancer.' ,
                 style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                  
                  color: Color(0xff73313b),
                  fontWeight: FontWeight.w100
                )
                ),
              ))
              ]),
        ),
          Container(width: double.infinity,
             decoration: BoxDecoration(
                  
                    color: Colors.white,
                    ),
             
        padding:EdgeInsets.symmetric(vertical: size.height * 0.01,horizontal: 25),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Text(
                'Before and After Photos',
                
                textAlign: TextAlign.left,
                style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                
                  
                )),
              )    
            ,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:Text(
                'A group for sharing pre-and post-surgery photos related to surgeries and procedures undertaken as a result of being at increased risk of breast and ovarian cancer.' ,
                 style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                  
                  color: Color(0xff73313b),
                  fontWeight: FontWeight.w100
                )
                ),
              ))
              ]),
        ),
          Container(width: double.infinity,
             decoration: BoxDecoration(
                  
                    color: Colors.white,
                    ),
             
        padding:EdgeInsets.symmetric(vertical: size.height * 0.01,horizontal: 25),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Text(
                'Young Women’s Group',
                
                textAlign: TextAlign.left,
                style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                
                  
                )),
              )    
            ,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:Text(
                'For women aged 32 and under who have been diagnosed with breast or ovarian cancer or diagnosed with a high risk of developing these diseases.' ,
                 style: GoogleFonts.mulish(textStyle:TextStyle(
                  fontSize: 14.0,
                  
                  color: Color(0xff73313b),
                  fontWeight: FontWeight.w100
                )
                ),
              ))
              ]),
        ),
         Container(width: double.infinity,
             decoration: BoxDecoration(
                  
                    color: Colors.white,
                    ),
             
        padding:EdgeInsets.symmetric(vertical: size.height * 0.07,horizontal: 25),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'She Shares',
                style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  fontSize: 30.0,
                    fontWeight: FontWeight.w400,
                color: kPrimaryColor
                  
                )),
              )    
            ,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child:Text(
                'Our She Shares events are a place for women to share laughs, thoughts, questions and advice. These events are held across the country and involve various activities and thoughtful interactions with others who truly “get it”. We aim to create engaging and enjoyable events that spark meaningful conversations. It doesn’t matter what stage of your journey you’re in, we’ve designed our She Shares events to be a breath of fresh air; and don’t worry, sharing your story is completely up to you. ' ,
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
