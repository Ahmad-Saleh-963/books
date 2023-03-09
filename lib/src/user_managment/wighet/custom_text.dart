
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
      CustomText({super.key, required this.txt});

      String txt ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 8.0),
      child: Text(
        txt,
        style: const TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontFamily: 'Shantell',
        ),
      ),
    );
  }
}
