import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Homepage/homescreen.dart';
import 'package:flutter_auth/database/Database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter_auth/constants.dart';

import 'package:flutter_auth/components/rounded_button.dart';
class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc,category = 'Health & Well Being';
  Database db;
     
  File selectedImage;
  bool _isLoading = false;
  
  Future getImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image.path);
    });
  }

  uploadBlog() async {
    if (selectedImage != null) {
      setState(() {
        _isLoading = true;
      });

      /// uploading image to firebase storage
      final firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("blogImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final UploadTask task = firebaseStorageRef.putFile(selectedImage);

      var downloadUrl = await (await task).ref.getDownloadURL();
      print("this is url $downloadUrl");

      Map<String, String> blogMap = {
        "imgUrl": downloadUrl,
        "timestamp": DateTime.now().toString(),
        "title": title,
        "category":category,
        // "author": ,
        "desc": desc
      };
     db = Database();
     db.initiliase();
     db.addData(blogMap).then((value) {
            if(value){
                  Fluttertoast.showToast(msg: 'Succesfully Posted Your Story');
         
            }
            else{
                  Fluttertoast.showToast(msg: 'Something Went Wrong Please try again');
         
            }
           Navigator.push(context,
            MaterialPageRoute(builder: (context) => Home())
            );

            }
            );
       
     
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              floatingActionButton:  _isLoading?SizedBox(height: 0,):  FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () {
                uploadBlog();
              },
              child: Icon(Icons.save),
            )
        ,
      // appBar: AppBar(
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         "Flutter",
      //         style: TextStyle(fontSize: 22),
      //       ),
      //       Text(
      //         "Blog",
      //         style: TextStyle(fontSize: 22, color: Colors.blue),
      //       )
      //     ],
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   actions: <Widget>[
      //     GestureDetector(
      //       onTap: () {
      //         uploadBlog();
      //       },
      //       child: Container(
      //           padding: EdgeInsets.symmetric(horizontal: 16),
      //           child: Icon(Icons.file_upload)),
      //     )
      //   ],
      // ),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: selectedImage != null
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 40),
                              height: MediaQuery.of(context).size.height * .4,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.file(
                                  selectedImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              height: 170,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6)),
                              width: MediaQuery.of(context).size.width,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.black45,
                              ),
                            )),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        // TextField(
                        //   decoration: InputDecoration(hintText: "Author Name"),
                        //   onChanged: (val) {
                        //     authorName = val;
                        //   },
                        // ),
                        TextField(
                          decoration: InputDecoration(hintText: "Title"),
                          onChanged: (val) {
                            title = val;
                          },
                        )
                        ,DropdownButton(
                           elevation: 16,
                           isExpanded: true,
                          style: const TextStyle(color: Colors.black54),
                          value: category,
                          underline: Container(
                            height: 1,
                            color: Colors.grey,
                         
                          ),
                          onChanged: (val) {
                            category= val;
                          },
                          items: <String>['Health & Well Being', 'Yoga', 'Fitness', 'Spirituality']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                        ),
                        TextField(
                        
                          decoration: InputDecoration(hintText: "Desc",                      // Added this
                          ),
                          maxLines: 10,
                          onChanged: (val) {
                            desc = val;
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
              
            ),
    );
  }
}
