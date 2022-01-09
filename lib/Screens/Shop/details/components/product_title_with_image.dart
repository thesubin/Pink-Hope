import 'package:flutter/material.dart';
import 'package:flutter_auth/models/Product.dart';

import '../../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: kPrimaryColor),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n",style: TextStyle(color: kPrimaryColor)),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
