import 'package:book_store/src/core/application/color_manager.dart';
import 'package:book_store/src/core/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyBookCartWidget extends StatelessWidget {
  const MyBookCartWidget(
      {super.key,
      required this.author,
      required this.imageUrl,
      required this.isLiked,
      required this.prise,
      required this.nameBook});
  final String nameBook;
  final String author;
  final double prise;
  final bool isLiked;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 9,
                        color: Colors.black)
                  ],
                  color: AppColor.green,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextWidget(
                      nameBook,
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextWidget(
                      author,
                      fontSize: 8,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 9,
                      child: imageUrl.isEmpty ?  Image.asset(imageUrl,
                          fit: BoxFit.fitHeight, width: 60, height: 90)
                          :
                      Image.network(imageUrl,
                          fit: BoxFit.fitHeight, width: 60, height: 90)
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextWidget(
                      "$prise \$",
                      color: Colors.white,
                    )
                    ,
                      const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        )
        // Align(
        //     alignment: Alignment.centerRight,
        //     child: Container(
        //       margin: EdgeInsets.only(right: 20,top: 20),
        //       height: 30,
        //       width: 30,
        //       alignment: Alignment.center,
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //         shape: BoxShape.circle,
        //       ),
        //       child:  Icon(Icons.heart_broken_rounded,color:isLiked? Colors.red:const Color(0xffBCBCB1),),
        //     )),
        //   Align(
        //   alignment: Alignment.bottomRight,
        //   child: SizedBox(
        //     height: 100,
        //     width: 200,
        //     child: Column(

        //       children: [
        //         CostomTextWidget(
        //           "nameBook",
        //           color: Colors.white,
        //         ),
        //         CostomTextWidget(

        //           "author",
        //           fontSize: 14,
        //           color: Colors.white,
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        //  Align(
        //   alignment: Alignment.topLeft,
        //   child: SizedBox(
        //     height: 200,
        //     child: Padding(
        //       padding: const EdgeInsets.only(top: 20,left: 20),
        //       child: Column(
        //         children: [

        //           Material(
        //             borderRadius: BorderRadius.circular(10),
        //             elevation: 9,
        //             child: Image.asset(
        //               imageUrl,
        //               fit: BoxFit.fitHeight,
        //               width: 70,
        //               height: 115,
        //             ),
        //           ),
        //           const SizedBox(height: 10,),
        //           CostomTextWidget(
        //             "$prise \$",
        //             color: Colors.white,
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
