import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class AlertError extends StatelessWidget {
  final String text;
  final Color color, textColor;
  const AlertError({
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
        decoration: BoxDecoration(color:kPrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
        
        ),
            
      child:Padding(
        
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Row(
          children:[
            Icon(Icons.info,color: Colors.white,size: 18,)
            ,
            Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
                constraints: BoxConstraints( maxWidth: size.width * 0.6),
       
          child:  Text(text,style: TextStyle(fontSize: 10,color: Colors.white,height: 1.5 )),
        )]),
    )
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  
}
