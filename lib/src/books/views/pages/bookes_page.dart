import 'package:book_store/src/books/views/components/last_books_component.dart';
import 'package:book_store/src/books/views/components/most_books_seales.dart';
import 'package:book_store/src/core/application/color_manager.dart';
import 'package:book_store/src/core/views/widgets/search_text_fild_widget.dart';
import 'package:book_store/src/core/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookesPage extends StatefulWidget {
  const BookesPage({super.key});

  @override
  State<BookesPage> createState() => _BookesPageState();
}

class _BookesPageState extends State<BookesPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();

  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              "متجر كتب",
              fontSize: 24,
              color: AppColor.green,
            ),
            const SizedBox(
              height: 10,
            ),
            SearchTextFild(
              textEditingController: _textEditingController,
              onChanged: (p0) {},
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TabBar(
                  controller: controller,
                  indicatorColor: AppColor.green,
                  tabs: const [
                    CustomTextWidget(
                      "أحدث الكتب",
                      fontSize: 16,
                      color: AppColor.green,
                    ),
                    CustomTextWidget(
                      fontSize: 16,
                      "الأكثر رواجاَ",
                      color: AppColor.green,
                    ),
                    CustomTextWidget(
                      fontSize: 16,
                      "الأكثر مبيعاَ",
                      color: AppColor.green,
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                color: const Color(0xffECF4F4),
                child: TabBarView(controller: controller, children: const [
                  LastBookesComponent(),
                  MostBookesSealesComponent(),
                  MostBookesSealesComponent()
                ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
