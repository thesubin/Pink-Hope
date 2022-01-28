import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class PleaseWait extends StatelessWidget {
  final String text;
  final Color color, textColor;
  const PleaseWait({
    Key key,
    this.text,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
        decoration: BoxDecoration(color:Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
        
        ),
            
      child:Padding(
        
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            CircularProgressIndicator(strokeWidth: 1,color: kPrimaryColor,)
            ,
            Container(
                constraints: BoxConstraints( maxWidth: size.width * 0.6),
                margin: EdgeInsets.symmetric(horizontal: 10),
          child:  Text('Please Wait..',style: TextStyle(fontSize: 10,color: Colors.grey,height: 1.5 )),
        )]),
    )
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  
}
