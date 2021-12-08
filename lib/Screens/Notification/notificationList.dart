
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
              title: 'Notification Demo',
              subtitle: 'Thanks for downloading the Pink Hope app.',
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
