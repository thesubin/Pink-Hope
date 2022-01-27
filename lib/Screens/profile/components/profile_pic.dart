import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    Size size = MediaQuery.of(context).size;
 
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
        
          SvgPicture.asset("assets/icons/pink-hope.svg",
            height: size.height * 0.095,
            
          ),
          
          
        ],
      ),
    );
  }
}
