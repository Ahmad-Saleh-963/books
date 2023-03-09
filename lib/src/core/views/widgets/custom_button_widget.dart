import 'package:book_store/src/core/application/color_manager.dart';
import 'package:book_store/src/core/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';


class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, this.onPressed, required this.name});
final void Function()? onPressed;
 final String name;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        height: 60,
        decoration: BoxDecoration(
          color: AppColor.green,
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: TextButton(onPressed:onPressed , child:CustomTextWidget(name,color: Colors.white,fontSize: 16,)),
      ),
    );
  }
}