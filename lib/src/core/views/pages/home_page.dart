import 'package:book_store/src/books/views/pages/bookes_page.dart';
import 'package:book_store/src/books/views/pages/my_bookes_page.dart';
import 'package:book_store/src/core/application/color_manager.dart';
import 'package:book_store/src/core/views/widgets/text_widget.dart';
import 'package:book_store/src/user_managment/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

int _conterPage = 1;
List<Widget> _pages = [
  const MyBookesPage(),
  const BookesPage(),
  const ProfilePage(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String get route => "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: AppColor.green,
        child: SalomonBottomBar(
            duration: const Duration(milliseconds: 300),
            itemPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            onTap: (i) => setState(() => _conterPage = i),
            currentIndex: _conterPage,
            items: [
              SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.payment,
                    color: Colors.white,
                  ),
                  selectedColor: const Color.fromARGB(255, 245, 255, 254),
                  title: const CustomTextWidget(
                    "السلة",
                    color: Colors.white,
                  )),
              SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.book,
                    color: Colors.white,
                  ),
                  selectedColor: const Color.fromARGB(255, 245, 255, 254),
                  title: const CustomTextWidget(
                    "الكتب",
                    color: Colors.white,
                  )),
              SalomonBottomBarItem(
                  unselectedColor: Colors.white,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  selectedColor: const Color.fromARGB(255, 245, 255, 254),
                  title: const CustomTextWidget(
                    "البروفايل",
                    color: Colors.white,
                  )),
            ]),
      ),
      body: _pages[_conterPage],
    );
  }
}
