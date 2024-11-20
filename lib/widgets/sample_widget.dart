import 'package:flutter/material.dart';

class SampleWidget {
  Widget imageAndText(String imageAdd, String text) {
    return Column(
      children: [
        Image.asset(
          imageAdd,
          width: 70,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        )
      ],
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> scafoldFunction(
      String text, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
