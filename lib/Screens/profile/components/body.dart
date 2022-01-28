import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ContactUs/signup_screen.dart';
import 'package:flutter_auth/Screens/Supported/About.dart';
import 'package:flutter_auth/WebView/Donate.dart';
import 'package:flutter_auth/main.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:flutter_auth/Auth/auth_service.dart';

import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 60),
          // ProfileMenu(
          //   text: "My Account",
          //   icon: "assets/icons/User Icon.svg",
          //   press: () => {},
          // ),
        
          ProfileMenu(  
            text: "Get Support",
            icon: "assets/icons/support.svg",
            press: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return (Suppport());
                    },
                  ),
                );
            },
          ),
            ProfileMenu(
            text: "Contact US",
            icon: "assets/icons/Question mark.svg",
            press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return (ContactUsScreen());
                      return (WebSite(url: 'https://www.pinkhope.org.au/contact-us',));
              
                    },
                  ),
                );
            },
          ),
          ProfileMenu(  
            text: "Your Risk",
            icon: "assets/icons/risk.svg",
            press: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return (WebSite(url: 'https://www.pinkhope.org.au/your-risk/know-your-risk',));
                    },
                  ),
                );
            },
          ),
            ProfileMenu(  
            text: "Get Involved",
            icon: "assets/icons/getInvolved.svg",
            press: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return (WebSite(url: 'https://www.pinkhope.org.au/get-involved/give-funds',));
                    },
                  ),
                );
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
               context.read<AuthenticationService>().signOut().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return (MyApp());
                    },
                  ),
                )
 );
                    
            },
          ),
        ],
      ),
    );
  }
}
