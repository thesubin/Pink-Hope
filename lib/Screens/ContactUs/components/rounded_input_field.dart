import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ContactUs/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedDoubleInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const RoundedDoubleInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          
          border: InputBorder.none,
        ),
      ),
    );
  }
}
