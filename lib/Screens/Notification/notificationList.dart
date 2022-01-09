
import 'package:flutter/material.dart';
import 'components/defaultAppBar.dart';
import 'components/notificationTiles.dart';
import 'notificationPage.dart';

class NotificationList extends StatefulWidget {
  NotificationList({Key key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(top: 20),
          itemCount: 12,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: 'ROCKWEAR & PINK HOPE PILATES SESSION',
              subtitle: 'Join Rockwear and Pink Hope for an online Pilates session to raise funds for #breastcancerawareness month.',
              enable: true,
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage())),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
