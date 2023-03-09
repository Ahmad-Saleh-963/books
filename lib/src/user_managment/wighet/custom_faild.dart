


import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class CustomFaild extends StatelessWidget {
   CustomFaild({super.key, required this.suffixIcon,required this.textInputType,required this.prefixIcon,required this.hidPass,required this.tc});

 bool hidPass;
 final  Icon suffixIcon ;
 final Icon  prefixIcon;
 final TextInputType  textInputType ;
 final TextEditingController  tc ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 20,start: 20),
      child:  TextFormField(
        keyboardType: textInputType,
        style: const TextStyle(color: Colors.white),
        // controller: pass,
         obscureText:hidPass,
        controller: tc,
        validator: (String? value) {
          if (value != null && value.isEmpty) {return "please Enter value";}return null;},
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2.5,
              color: Colors.white70,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: GradientOutlineInputBorder(
            width: 3.0,
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.green,
                  Colors.green,
                ]),
          ),
          prefixIcon:  prefixIcon,
          suffixIcon : !hidPass ? null : IconButton(onPressed: (){}, icon: suffixIcon),
          filled: true,
          fillColor: const Color.fromRGBO(30, 30, 30, .51),
        ),
      ),
    );
  }
}
