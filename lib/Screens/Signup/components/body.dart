import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/Auth/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_auth/components/PleaseWait.dart';
import 'package:flutter_auth/components/alertbox.dart';
import 'package:provider/provider.dart';
class Body extends StatefulWidget{

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  String error = '';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "SIGNUP",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/pink-hope.svg",
              height: size.height * 0.095,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
               controller: emailController,
             
            ),
             RoundedInputField(
              hintText: "Your Name",
              onChanged: (value) {},
               controller: nameController,
             
            )
            ,
            RoundedPasswordField(
            controller: passwordController,
  
              onChanged: (value) {},
            ),
              error != '' ?AlertError(text: error.toUpperCase(),):SizedBox(height: 0,),
          
            RoundedButton(
              text: "SIGNUP",
              press: () {
                            setState((){
                      _isLoading= true;
                  });
      
                     context.read<AuthenticationService>().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    name: nameController.text.trim()
                  ).then((value) {
                    print(value);
                    if(value == "Signed up"){
                      Fluttertoast.showToast(msg: "Successfully Signed Up");
                                setState((){
                      _isLoading= false;
                  });
      
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                    }
                    else{
                      setState(() {
                        _isLoading = false;
                        error = value.toString();
                      });
                    }
                  });
            
              },
            ),
               _isLoading? PleaseWait():SizedBox(height: 0,),
        
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
