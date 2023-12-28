import 'package:flutter/material.dart';
import 'constants.dart';


class CardContent extends StatelessWidget {
  CardContent({required this.iconModel,required this.textContent});

  final IconData iconModel;
  final String textContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconModel,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textContent,
          style:kLabelTextStyle
          ),

      ],
    );
  }
}