import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String date;
    final String desc;
  List months =
['Jan', 'Feb', 'Mar', 'Apr', 'May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  PostDetailsPage(
      {@required this.title,
      @required this.image,
      @required this.author,
      @required this.date,
      
      @required this.desc
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   iconTheme: IconThemeData(
      //     color: Colors.black,
      //   ),
      //   actions: [
      //     // Padding(
      //     //   padding: const EdgeInsets.all(8.0),
      //     //   child: ClipRRect(
      //     //     borderRadius: BorderRadius.circular(8),
      //     //     child: Container(
      //     //       color: Colors.grey[200],
      //     //       child: IconButton(
      //     //         icon: Icon(
      //     //           Icons.bookmark_outline,
      //     //           size: 20,
      //     //         ),
      //     //         color: Colors.grey,
      //     //         onPressed: () {},
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //     // Padding(
      //     //   padding: const EdgeInsets.all(8.0),
      //     //   child: ClipRRect(
      //     //     borderRadius: BorderRadius.circular(8),
      //     //     child: Container(
      //     //       color: Colors.grey[200],
      //     //       child: IconButton(
      //     //         icon: Icon(
      //     //           Icons.favorite_outline,
      //     //           size: 20,
      //     //         ),
      //     //         color: Colors.grey,
      //     //         onPressed: () {},
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //     // Padding(
      //     //   padding: const EdgeInsets.all(8.0),
      //     //   child: ClipRRect(
      //     //     borderRadius: BorderRadius.circular(8),
      //     //     child: Container(
      //     //       color: Colors.grey[200],
      //     //       child: IconButton(
      //     //         icon: Icon(
      //     //           Icons.share_outlined,
      //     //           size: 20,
      //     //         ),
      //     //         color: Colors.grey,
      //     //         onPressed: () {},
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //   ],
      // ),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(32),
      //     topRight: Radius.circular(32),
      //   ),
      //   child: BottomAppBar(
      //     elevation: 0,
      //     child: Container(
      //       padding: const EdgeInsets.all(20),
      //       height: 65,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           IconButton(
      //               icon: Icon(
      //                 Icons.headset,
      //                 color: Colors.grey,
      //               ),
      //               onPressed: () {}),
      //           IconButton(
      //               icon: Icon(
      //                 Icons.wb_sunny_outlined,
      //                 color: Colors.grey,
      //               ),
      //               onPressed: () {}),
      //           IconButton(
      //               icon: Icon(
      //                 Icons.nights_stay_outlined,
      //                 color: Colors.grey,
      //               ),
      //               onPressed: () {}),
      //           IconButton(
      //               icon: Icon(
      //                 Icons.format_size_outlined,
      //                 color: Colors.grey,
      //               ),
      //               onPressed: () {}),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ListView(
            children: [
              Text(
                title,
                style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  color: kPrimaryColor,
                  fontSize: 42,
                ),)
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('$author, ',style: TextStyle(color: kPrimaryColor),),
                  Text(
                   DateTime.parse(date.toString()).toLocal().day.toString() +' ' + months[DateTime.parse(date.toString()).toLocal().month.toInt() - 1] + ' ' + DateTime.parse(date.toString()).toLocal().year.toString(),
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              // Wrap(
              //   alignment: WrapAlignment.start,
              //   crossAxisAlignment: WrapCrossAlignment.center,
              //   spacing: 16,
              //   children: [
              //     Wrap(
              //       crossAxisAlignment: WrapCrossAlignment.center,
              //       spacing: 4,
              //       children: [
              //         Icon(
              //           Icons.remove_red_eye_outlined,
              //           color: Colors.grey,
              //           size: 18,
              //         ),
              //         Text(
              //           '6.5K Views',
              //           style: TextStyle(
              //             color: Colors.grey,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w100,
              //           ),
              //         )
              //       ],
              //     ),
              //     Wrap(
              //       crossAxisAlignment: WrapCrossAlignment.center,
              //       spacing: 4,
              //       children: [
              //         Icon(
              //           Icons.favorite,
              //           color: Colors.grey,
              //           size: 18,
              //         ),
              //         Text(
              //           '106 Likes',
              //           style: TextStyle(
              //             color: Colors.grey,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w100,
              //           ),
              //         )
              //       ],
              //     ),
              //     Wrap(
              //       crossAxisAlignment: WrapCrossAlignment.center,
              //       spacing: 4,
              //       children: [
              //         Icon(
              //           Icons.bookmark,
              //           color: Colors.grey,
              //           size: 18,
              //         ),
              //         Text(
              //           '55 Saves',
              //           style: TextStyle(
              //             color: Colors.grey,
              //             fontSize: 14,
              //             fontWeight: FontWeight.w100,
              //           ),
              //         )
              //       ],
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(image),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text:   desc.substring(0,1),
                        style: GoogleFonts.notoSerif(
                            color: kPrimaryColor, fontSize: 32)),
                    TextSpan(
                      text:
                          desc.substring(1,desc.length),
                      style: GoogleFonts.mulish(
                        color: kPrimaryColor,
                        fontSize: 18,
                        height: 1.7,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}