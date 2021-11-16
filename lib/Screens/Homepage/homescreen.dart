import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Homepage/CardScroll.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'data.dart';
class Home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int _selectedIndex = 0;
  var currentPage = images.length - 1.0;

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
     
 PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.pink,
              Colors.white
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
                children:<Widget>[Text(
                'PINK HOPE',
                style: TextStyle(
                  fontSize: 20.0,
                  
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              IconButton(onPressed:() {}, icon: Icon(Icons.search_rounded,color: Colors.white,size: 30,))
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
                  
                  style: GoogleFonts.poppins(textStyle:TextStyle(
                  fontSize: 55.0,
                  
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent
                )))),
                  SvgPicture.asset(
                 "assets/icons/login.svg",
                 height: size.height * 0.35,
                 ),
                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,top: 40),
                    child: Text("Pink Hope is a preventative health hub that provides our community with the necessary tools to asses manage and reduce their risk of breast and ovarian cancer.",
                  textAlign: TextAlign.justify,
                    style: GoogleFonts.dancingScript(textStyle:TextStyle(
                    fontSize: 22.0,
                    
                    fontWeight: FontWeight.w400,
                     color: Colors.pinkAccent
                ))) ,),
                      Padding(
                      
                    padding: EdgeInsets.only(top:40),
                    child: Text("PERSONAL STORIES",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(textStyle:TextStyle(
                  fontSize: 25.0,
                  
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )))),
                
                    SizedBox(height: 20.0),
                                  Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
         
                ],),
              ),
         
            ),
            ],
        ),
    )),
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
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}