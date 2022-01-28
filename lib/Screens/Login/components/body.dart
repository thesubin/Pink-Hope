import 'package:flutter/material.dart';
import 'package:flutter_auth/Auth/auth_service.dart';
import 'package:flutter_auth/Screens/Homepage/homescreen.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/PleaseWait.dart';
import 'package:flutter_auth/components/alertbox.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/main.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
class Body extends StatefulWidget{

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  
  bool _Error =false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "LOGIN",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/pink-hope.svg",
              height: size.height * 0.095,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              controller: emailController,
              onChanged: (value) {},
             
            ),
            RoundedPasswordField(
              controller: passwordController,
          
              onChanged: (value) {},
            ),
            _Error?AlertError(text: "Incorrect Email or Password",):SizedBox(height: 0,),
            RoundedButton(
              text: "LOGIN",
              press: () {
                  setState((){
                      _isLoading= true;
                  });
                 context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ).then((value){
                    if(value=="Signed in"){

                  setState((){
                      _isLoading= false;
                  });
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
                );

                    }else{
                      setState(() {
                        _Error = true;
                        _isLoading = false;
                      });
                    }
                  });
              },
            ),
           _isLoading? PleaseWait():SizedBox(height: 0,),
            
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
