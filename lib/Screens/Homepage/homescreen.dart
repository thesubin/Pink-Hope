import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/About/About.dart';
import 'package:flutter_auth/Screens/Blog/Blog.dart';
import 'package:flutter_auth/Screens/Blog/CreateBlog.dart';
import 'package:flutter_auth/Screens/Donate/Donate.dart';
import 'package:flutter_auth/Screens/Homepage/CardScroll.dart';
import 'package:flutter_auth/Screens/Notification/notificationList.dart';
import 'package:flutter_auth/Screens/profile/profile_screen.dart';
import 'package:flutter_auth/WebView/Donate.dart';
import 'package:flutter_auth/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'data.dart';
import 'package:flutter_auth/database/Database.dart';

import 'dart:math';
import 'package:flutter_auth/Screens/Blog/SinglePage.dart';
import 'package:flutter_auth/Screens/Shop/home/home_screen.dart';
class Home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int _selectedIndex = 0;
  List blogData = [];
 
  var currentPage = 0.0;
  Database db;
  void initialize(){
    db = Database();
    db.initiliase();
    db.getBlogs().then((value) => setState(() {
        blogData= value;
        currentPage= value.length - 1.0;
        print('Asd State');
        print(value);

        }));

  }
  @override
  void initState(){
    super.initState();
    initialize();
  }
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     
 PageController controller = PageController(initialPage: blogData.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    Size size = MediaQuery.of(context).size;
      Widget  HomeTab( List dataBlog){
        
        print(dataBlog);
     
      return  Container(
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
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
              Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
              //     Text(
              //   'PINK HOPE',
              //   style: TextStyle(
              //     fontSize: 20.0,
                  
              //     fontWeight: FontWeight.bold,
              //           color: Colors.white
            
              //   ),
              // ),
               SvgPicture.asset("assets/icons/pink-hope.svg",
                height: size.height *0.06,
               ),
           
              IconButton(onPressed:() {
                      Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WebSite(url: 'https://www.pinkhope.org.au/shop',)));
              }, icon: Icon(Icons.shopping_bag_outlined,      color: Color(0xff73313b)
            ,size: 30,))
              ],
            )
            ),
            SizedBox(height: 35.0),
            
              Container(
              
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight:  Radius.circular(60))),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("What is Pink Hope?",
                  
                  style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  fontSize: 45.0,
                  
                  fontWeight: FontWeight.w400,
                        color: Color(0xff73313b)
            
                )))
                ),
                  Image.asset(
                 "assets/images/home.jpg",
                 height: size.height * 0.30,
                 
                 fit: BoxFit.cover,
                 ),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,top: 40),
                    child: Text("Pink Hope is a preventative health hub that provides our community with the necessary tools to asses manage and reduce their risk of breast and ovarian cancer.",
                  textAlign: TextAlign.justify,
                    style: GoogleFonts.mulish(textStyle:TextStyle(
                    fontSize: 21.0,
                    
                    fontWeight: FontWeight.w100,
                          color: Color(0xff73313b)
            
                ))) ,),
                      Padding(
                      
                    padding: EdgeInsets.only(top:40),
                    child: Text("PERSONAL STORIES",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.abrilFatface(textStyle:TextStyle(
                  fontSize: 25.0,
                  
                  fontWeight: FontWeight.bold,
                   color: Color(0xff73313b)

                )))),
                
                    SizedBox(height: 20.0),
                                  Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage,blogData),
                  Positioned.fill(
                    child: GestureDetector(
                       onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => PostDetailsPage(
                                        title: blogData[currentPage.toInt()]['title'],
                                        image: blogData[currentPage.toInt()]['imgUrl'],
                                        author: blogData[currentPage.toInt()]['author'],
                                        date: blogData[currentPage.toInt()]['timestamp'],
                                        desc: blogData[currentPage.toInt()]['desc'] ,
                                      ),
                                    ),
                                  );
                                },
                      child:PageView.builder(
                      itemCount: blogData.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    )),
                  )
                ],
              ),
               Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
                ],),
              ),
         
            ),
            ],
        ),
    );
    }

    final List _children= [HomeTab(blogData),About(),Donate(),WebSite(url:"https://www.pinkhope.org.au/join-an-event"),Blog(blogData),ProfileScreen()]; //We Have defined the bottom Nav Here
    
    return Scaffold(
      body: SafeArea(
        child:_children[_currentTab]
       ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: kPrimaryColor,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30.0,
             color: kPrimaryColor,
             
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard ,
              size: 30.0,
             color: kPrimaryColor,
             
            ),
            title: SizedBox.shrink(),
          ),
 
           BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: kPrimaryColor,
             
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),

           BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: kPrimaryColor,
             
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: kPrimaryColor,
             
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          )
        
        ],
      ),
    );
  }
}