import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCellWidget extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String date;
  final Function onClick;
  PostCellWidget(
      {@required this.title,
      @required this.image,
      @required this.author,
      @required this.date,
      @required this.onClick});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: Row(
          children: [
            Container(
              width: 120,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                   style: GoogleFonts.poppins(textStyle:TextStyle(
                  fontSize: 15.0,
                  
                  fontWeight: FontWeight.w400,
                        color: Color(0xff73313b)
            
                ))
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$author, $date',
                    style: GoogleFonts.poppins(textStyle:TextStyle(
                  fontSize: 10.0,
                  
                  fontWeight: FontWeight.w100,
                        color: Color(0xff73313b)
            
                )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}