import 'package:flutter/material.dart';


class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({
    Key key, this.title, this.child, this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Color(0xFF303030))),
      centerTitle: true,
      backgroundColor: Colors.white,
      
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Color(0xFF303030)),
      leading: child,
      actions: action,
    );
  }
}