import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Auth/auth_service.dart';
import 'package:flutter_auth/Screens/Homepage/homescreen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/WebView/Donate.dart';
import 'package:flutter_auth/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/database/Database.dart';

import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import 'package:flutter_auth/services/localnotification.dart';
import 'package:flutter_auth/database/Database.dart';

Future<void> backgroundHandler (RemoteMessage message) async{
    print(message.data.toString());
  if(message != null)
    {  Database db;
      db = Database();
      db.initiliase();
     db.create(message.notification.title, message.notification.body,message.notification.android.imageUrl,message.data['url']);
}

}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  
  // This widget is the root of your application.
  @override
    State<StatefulWidget> createState() => WrapperBody();

 }

class WrapperBody extends State<MyApp>{
  String notificationUrl ;
  Database db;
  @override
  void initState() {
    
    // TODO: implement initState

       super.initState();
      LocalNotificationService.initialize(context);
      db = Database();
      db.initiliase();
        db.create("message.notification.title", "message.notification.body","message.notification.android.imageUrl","message.data['url']");

    
    FirebaseMessaging.onMessage.listen((message) {
      if(message != null)
         LocalNotificationService.display(message);
        db.create(message.notification.title, message.notification.body,message.notification.android.imageUrl,message.data['url']);

    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message!= null){
        
        final linkUrl = message.data['url'].toString();
        developer.log('log me', name: message.data.toString());

            print(linkUrl ); 
            
           setState(() {
            notificationUrl = linkUrl;
         
          });
         
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {

        final linkUrl = message.data['url'].toString();
         developer.log('log me', name: message.data['url'].toString());
       
        if(linkUrl != null){
          setState(() {
            notificationUrl = linkUrl;
         
          });
            
        }
    });
  }
 
 @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
       initialData: null, )
      
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pink Hope',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        
      ),
      home: WillPopScope( onWillPop: () async{
          
          if(notificationUrl != null){
            setState(() {
              notificationUrl = null;
            });
          return false;
          }
          else return true;

      },child:AuthenticationWrapper(notificationUrl)),
    ),
    );
  
  }

}
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper(this.notificationUrl);

  final String notificationUrl;
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(notificationUrl != null){
      return WebSite(url: notificationUrl);
    }
    else if (firebaseUser != null) {
      return Home();
    }
    return LoginScreen();
  }
}