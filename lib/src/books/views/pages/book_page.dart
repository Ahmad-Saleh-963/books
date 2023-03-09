
import 'package:book_store/src/core/application/color_manager.dart';
import 'package:book_store/src/core/views/widgets/custom_button_widget.dart';
import 'package:book_store/src/core/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../core/application/constants.dart';
import '../../models/model_books.dart';



class BookPage extends StatefulWidget {
  const BookPage({required this.bookeModel});
  final BooksModel bookeModel;
  @override
  State<BookPage> createState() => _BookPageState(bookeModel: bookeModel);
}

class _BookPageState extends State<BookPage> {
   _BookPageState({required this.bookeModel});

  static String get route => "book";
  final BooksModel bookeModel;

  bool isLoad=false;
  addData()async{
    var responsd = await
    client
        .from("myBooks").insert(
        {
          "idk":bookeModel.id,
          "email": Constants.EMAIL
        }
    ).execute();

    if(responsd.error != null) {
      //showSnakBar("   لايتوفر اتصال بالانترنت");
      print("erorr");
      return [];
    }

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: AppColor.green,

        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomTextWidget(
          bookeModel.name ?? "",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColor.green,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Expanded(
            child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 9,
                child:  bookeModel.imageUrl.isEmpty ?
                Image.asset(
                  bookeModel.imageUrl,
                  fit: BoxFit.fitHeight,
                )
                    :
                Image.network(
                  bookeModel.imageUrl,
                  fit: BoxFit.fitHeight,
                )
            ),
          ),
          const SizedBox(height: 10,),

          Expanded(
              flex: 2,
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: const BoxDecoration(
                    color: Color(0xffE2E5EC),
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _getRowText(),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomTextWidget(
                                ": ${bookeModel.author}",
                                color: AppColor.green,
                                fontSize: 18,
                              ),
                              CustomTextWidget(
                                ": ${bookeModel.section}",
                                color: AppColor.green,
                                fontSize: 18,
                              ),
                              CustomTextWidget(
                                ": ${bookeModel.language}",
                                color: AppColor.green,
                                fontSize: 18,
                              ),
                              const CustomTextWidget("",
                                // ": ${bookeModel.releaseDate.year} - ${bookeModel.releaseDate.month} - ${bookeModel.releaseDate.day}",
                                color: AppColor.green,
                                fontSize: 18,
                              ),
                              CustomTextWidget(
                                ": ${bookeModel.pages.toString()}",
                                color: AppColor.green,
                                fontSize: 18,
                              ),
                              CustomTextWidget(
                                "${bookeModel.fileSize}",
                                color: AppColor.green,
                                fontSize: 18,
                              ),
                              CustomTextWidget(": ${bookeModel.price.toString()}",
                                color: AppColor.green,
                                fontSize: 18,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CustomButtonWidget(name: "شراء الكتاب",onPressed: () {

                        },),
                        CustomButtonWidget(name: "إضافة إلى السلة",
                          onPressed: () {
                          print("ok");
                          addData();
                        },),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Column _getRowText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const[
        CustomTextWidget(
          "المؤلف",
          fontSize: 18,
        ),
        CustomTextWidget(
          "القسم",
          fontSize: 18,
        ),
        CustomTextWidget(
          "اللغة",
          fontSize: 18,
        ),
        CustomTextWidget(
          "تاريخ الأصدار",
          fontSize: 18,
        ),
        CustomTextWidget(
          "الصفحات",
          fontSize: 18,
        ),
        CustomTextWidget(
          "حجم الملف",
          fontSize: 18,
        ),
        CustomTextWidget(
          "السعر",
          fontSize: 18,
        ),
      ],
    );
  }

}
