import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/About/components/mission.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Stack(
              children: <Widget>[

                Container(
                  height: 300,
                  child: Column(
                  children: [
                    Expanded(child: Image.asset('assets/images/background.jpg',fit: BoxFit.cover,),)
                  ],
                )),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.25),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44),
                      topRight: Radius.circular(44),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Description(),
                      Mission()
                    ],
                  ),
                ),
                ProductTitleWithImage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
