import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ContactUs/components/rounded_input_field.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/ContactUs/components/background.dart';
import 'package:flutter_auth/Screens/ContactUs/components/or_divider.dart';
import 'package:flutter_auth/Screens/ContactUs/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/Auth/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController fnameController = TextEditingController();
    final TextEditingController lnameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController messageController = TextEditingController();

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          
            // Text(
            //   "SIGNUP",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
             SizedBox(height: size.height * 0.19),
          
              Text(
              "Send a message",
              style: GoogleFonts.abrilFatface(textStyle:TextStyle(fontWeight: FontWeight.w400,  fontSize: 30.0,
                color: kPrimaryColor)),
            ),
           
          
            SizedBox(height: size.height * 0.03),
          
            // SvgPicture.asset(
            //   "assets/icons/pink-hope.svg",
            //   height: size.height * 0.095,
            // ),
          
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
              RoundedDoubleInputField(
              hintText: "First Name",
              onChanged: (value) {},
               controller: fnameController,
              ),
          
             RoundedDoubleInputField(
              hintText: "Last Name",
              onChanged: (value) {},
               controller: lnameController,
             )
            ],
            ),
          
            RoundedInputField(
              hintText: "Email",
              icon: Icons.email,
              onChanged: (value) {},
               controller: emailController,
             
            ),

             RoundedInputField(
              hintText: "Phone",
              icon: Icons.phone,
              onChanged: (value) {},
              controller: phoneController,
             
            ),
             RoundedInputField(
              hintText: "Message",
              icon: Icons.message,
              onChanged: (value) {},
               controller: messageController,
             
            ),
            RoundedButton(
              text: "Submit",
              press: () {
                     context.read<AuthenticationService>().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    name: fnameController.text.trim()
                  ).then((value) => print(value));
            
              },
            ),
            SizedBox(height: size.height * 0.03),
            OrDivider(),
             Text(
              "Contact Info",
              style: GoogleFonts.abrilFatface(textStyle:TextStyle(fontWeight: FontWeight.w400,  fontSize: 30.0,
                color: kPrimaryColor)),
            ),
            
              SizedBox(height: size.height * 0.01),
          
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              Text(
              "Phone : ",
              style: GoogleFonts.mulish(textStyle:TextStyle(fontWeight: FontWeight.bold,  fontSize: 14.0,
                color: kPrimaryColor)),
            ),
            Text(
              
              "02 8084 2288",
              style: GoogleFonts.mulish(textStyle:TextStyle(fontWeight: FontWeight.bold,  fontSize: 14.0,
                color: kPrimaryColor)),
            ),
            ]),

              SizedBox(height: size.height * 0.009),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              Text(
              "Email : ",
              style: GoogleFonts.mulish(textStyle:TextStyle(fontWeight: FontWeight.bold,  fontSize: 14.0,
                color: kPrimaryColor)),
            ),
            Text(
              "info@pinkhope.org.au",
              style: GoogleFonts.mulish(textStyle:TextStyle(fontWeight: FontWeight.bold,  fontSize: 14.0,
                color: kPrimaryColor)),
            ),
            ]),

              SizedBox(height: size.height * 0.009),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children:[
             Text(
              "Address :",
              style: GoogleFonts.mulish(textStyle:TextStyle(fontWeight: FontWeight.bold,  fontSize: 14.0,
                color: kPrimaryColor)),
            ),
            Text(
              "PO Box 725, Narrabeen NSW 2101",
              style: GoogleFonts.mulish(textStyle:TextStyle(fontWeight: FontWeight.bold,  fontSize: 14.0,
                color: kPrimaryColor)),
            ),
            ]),
                SizedBox(height: size.height * 0.03),
        
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
                
              ],
            ),
                SizedBox(height: size.height * 0.03),
        
          ],
        ),
      ),
    );
  }
}
