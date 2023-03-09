import 'package:book_store/src/core/application/color_manager.dart';
import 'package:flutter/material.dart';


class SearchTextFild extends StatelessWidget {
  const SearchTextFild({super.key,this.onChanged,this.textEditingController});
 final TextEditingController? textEditingController;
 final  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      
      onChanged:onChanged ,
      decoration: InputDecoration(
        
                filled: true,
                fillColor:const Color(0xffE2E5EC),
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none),
                 hintText: "أبحث الآن",
        hintStyle:Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: "booksStroeFonts",color: AppColor.green),
       
               
                prefixIcon: 
                Container(
                  margin: const EdgeInsets.only(left: 10),
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.green.withOpacity(0.5)
          ),
       child: const Icon(Icons.search,color: Colors.white,size: 30.0,),

                ),
          
      
      // decoration: InputDecoration(
      //   fillColor: AppColor.green.withOpacity(0.5),

      //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      //   hintText: "البحث",
      //   hintStyle:Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: "booksStroeFonts"),
      //   prefix: Container(
      //     height: 50,
      //     width: 50,
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: AppColor.green.withOpacity(0.5)
      //     ),
      //     child: const Icon(Icons.search,color: Colors.white,size: 30.0,),
      //   ),
        
      ),
   
    );
  }
}
