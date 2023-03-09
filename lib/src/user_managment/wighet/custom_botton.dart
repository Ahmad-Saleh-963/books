




import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
     CustomBotton({required this.txt,required this.onPress});

    String txt ;
     Future<void>  Function() onPress;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(0, 150, 50, 40),
              Color.fromRGBO(0, 200, 60, 92),
            ]),
      ),
      child: MaterialButton(
        onPressed:(){onPress();},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        splashColor: const Color.fromRGBO(30, 30, 30, .51),
        child:  Text(
          txt,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Shantell',
          ),
        ),
      ),
    );

  }
}
