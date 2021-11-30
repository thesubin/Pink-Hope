import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin,vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Pink Hope",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "Who we Are",
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
        ],
      ),
    );
  }
}
