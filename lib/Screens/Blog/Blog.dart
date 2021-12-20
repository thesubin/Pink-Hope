import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Blog/SinglePage.dart';
import 'package:flutter_auth/Screens/Blog/PostCellWidget.dart';
import 'package:google_fonts/google_fonts.dart';


class Post {
  final String title;
  final String image;
  final String author;
  final String date;

  Post({this.title, this.image, this.author, this.date});
}

class Blog extends StatelessWidget{
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
  @override
  Widget build(BuildContext context){
    return SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your daily read',
                  style: GoogleFonts.mulish(textStyle:TextStyle(
                  
                        color: Color(0xff73313b),
                        fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final post = data[index];
                    return PostCellWidget(
                        title: post.title,
                        image: post.image,
                        author: post.author,
                        date: post.date,
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PostDetailsPage(
                                title: post.title,
                                image: post.image,
                                author: post.author,
                                date: post.date,
                              ),
                            ),
                          );
                        });
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Writing Contest',
                   style: GoogleFonts.mulish(textStyle:TextStyle(
                      color: Color(0xff73313b),
                      
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
                 textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/image_02.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/image_02.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/image_03.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    
  }
}