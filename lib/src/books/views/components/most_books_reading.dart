import 'package:book_store/src/books/controllers/bookes_controllers.dart';
import 'package:book_store/src/books/views/pages/book_page.dart';
import 'package:book_store/src/books/views/widgets/book_card_widget.dart';
import 'package:book_store/src/core/application/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../models/model_books.dart';

class MostBookesreadingComponent extends StatelessWidget {
  const MostBookesreadingComponent({super.key});

  Future<List<BooksModel>> getDataBooks()async{

    var responsd = await
    client
        .from("books")
        .select()
        .execute();

    if(responsd.error != null) {
      //showSnakBar("   لايتوفر اتصال بالانترنت");
      print("erorrrrrrrrrrrrrrrrrr");
      return [];
    }

    // print(responsd.data);

    List<BooksModel> data = [];
    for (int i = 0 ; i < responsd.data.length ; i ++ ){
      BooksModel a = BooksModel.fromeJson(responsd.data[i]);
      data.add(a);
    }


    return data ;

  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:getDataBooks(),// Future.delayed(const Duration(seconds: 1), () => true),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.green),
          );
        }
        if (snapshot.hasData) {
          List data  = snapshot.data as List;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
                crossAxisSpacing: 10, mainAxisSpacing: 20, crossAxisCount: 2),
            itemBuilder: (context, index) {
              final book = data[index];
              return BookeCard(
                onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookPage(bookeModel: data[index]),
                    ));
                  },
                  bookName: book.name ?? "",
                  imageUrl: book.imageUrl ?? "",
                  isLiked: true);
            },
          );
        } else {
          return const Center(
            child: Icon(Icons.error),
          );
        }
      },
    );
  }
}
