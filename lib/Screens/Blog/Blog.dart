import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Blog/CreateBlog.dart';
import 'package:flutter_auth/Screens/Blog/SinglePage.dart';
import 'package:flutter_auth/Screens/Blog/PostCellWidget.dart';
import 'package:flutter_auth/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';


class Post {
  final String title;
  final String image;
  final String author;
  final String date;

  Post({this.title, this.image, this.author, this.date});
}

class Blog extends StatelessWidget{
    final List blogData;
    Blog( this.blogData);
final data = [
    Post(
      image: 'assets/images/image_01.png',
      title: 'Finding your ikigai in your middle age',
      author: 'John Johny',
      date: '25 Mar 2020',
    ),
    Post(
      image: 'assets/images/image_04.jpg',
      title: 'How to Lead Before You Are in Charge',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
    Post(
      image: 'assets/images/image_03.jpg',
      title: 'How Minimalism Brought Me',
      author: 'John Johny',
      date: '15 Mar 2020',
    ),
    Post(
      image: 'assets/images/image_02.jpg',
      title: 'The Most Important Color In UI Design',
      author: 'John Johny',
      date: '11 Mar 2020',
    ),
  ];

  final itemCategory = ['Health & Well Being', 'Yoga', 'Fitness', 'Spirituality'];
                                   
  
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    renderCategory(category){
      print('object');
      print(blogData.where((element) => element['category'] == category).toList());
      return  blogData.where((element) => element['category'] == category).toList().length>0?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          SizedBox(height: 20,),
               blogData.where((element) => element['category'] == category).toList().length>0? Text(
                  category,
                   style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                      color: Color(0xff73313b),
                      
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  )),
                 textAlign: TextAlign.left,
                ):const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                  ListView.separated(
                  shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
               
                  itemCount: blogData.where((element) => element['category'] == category).length,
                  itemBuilder: (context, index) {
                    final post = blogData.where((element) => element['category'] == category).toList()[index];
                    return PostCellWidget(
                        title: post['title'],
                        image: post['imgUrl'],
                        author: "post.author",
                        date: post['timestamp'],
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PostDetailsPage(
                                title: post['title'],
                                image: post['imgUrl'],
                                author: "post.author",
                                date: post['timestamp'],
                                desc: post['desc'],
                      ),
                            ),
                          );
                        });
                  },
                  separatorBuilder: (context, index) => Divider(),
                )]
                ):SizedBox(height: 0,);
    }
    
    return SafeArea(
        child:
        Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            colors: [
              Color(0xfff1cfd5),
              Color(0xfff1cfd5),
                      
            ]
          )
        ),
        child:ListView(
        children:<Widget> [
          Column(
          
          children: [
             Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0,top: 20),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Text(
                'Blog',
                style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  fontSize: 25.0,
                  
                  fontWeight: FontWeight.bold,
                        color: kPrimaryColor
            
                )),
              ),
              //  SvgPicture.asset("assets/icons/pink-hope.svg",
              //   height: size.height *0.06,
              //  ),
           
              IconButton(onPressed:() {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
            
              }, icon: Icon(Icons.add,      color: Color(0xff73313b)
            ,size: 30,))
              ],
            )
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search for articles, author, and tags',
            //     filled: true,
            //     fillColor: Colors.grey[200],
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //       borderSide: BorderSide.none,
            //     ),
            //     prefixIcon: Icon(Icons.search),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
              Container(
                
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight:  Radius.circular(60))),
              width: double.infinity,
              child:   Padding(
              padding: EdgeInsets.only(left: 20, right: 20,top: 40,bottom: 50),
             child: Column(
            
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Latest Post',
                  style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  
                        color: Color(0xff73313b),
                        fontWeight: FontWeight.w400,
                    fontSize: 25,
                  )),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: blogData.length,
                  itemBuilder: (context, index) {
                    final post = blogData[index];
                    return PostCellWidget(
                        title: post['title'],
                        image: post['imgUrl'],
                        author: "post.author",
                        date: post['timestamp'],
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PostDetailsPage(
                                title: post['title'],
                                image: post['imgUrl'],
                                author: "post.author",
                                date: post['timestamp'],
                                desc: post['desc'],
                      ),
                            ),
                          );
                        });
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
                 ListView.separated(
                  shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
               
                  itemCount: itemCategory.length,
                  itemBuilder: (context, index) {
                    final post = itemCategory[index];
                    return renderCategory(post);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                  height: 0,
                ),
                ),
                const SizedBox(
                  height: 20,
                ),
               ],
            ))
            ),
          ],
        )
        ])
        ),
      );
    
  }
}