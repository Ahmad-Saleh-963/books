import 'package:book_store/src/core/application/color_manager.dart';
import 'package:book_store/src/core/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: AppColor.green,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               
               Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: const Icon(Icons.person,color: AppColor.green,size: 90,),
              ),
               const CustomTextWidget(
                "عبدالكريم الخطيب",
                fontSize: 26,
                color: Colors.white,
              ),
              const SizedBox(height: 20,),
               const CustomTextWidget(
                "something@mail.com",
                fontSize: 12,
                color: Colors.white,
              )
            ],
          ),
        ),
        const ListTile(
          leading: Icon(
            Icons.circle,
            color: AppColor.green,
          ),
          title: CustomTextWidget("الأعدادات"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.green,
          ),
        ),
              const  Divider(),

        const ListTile(
          leading: Icon(
            Icons.question_mark,
            color: AppColor.green,
          ),
          
          title: CustomTextWidget("مركز المساعدة"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.green,
          ),
        ),
      const  Divider(),
        const ListTile(
          leading: Icon(
            Icons.info_sharp,
            color: AppColor.green,
          ),
          title: CustomTextWidget("حول البرنامج"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.green,
          ),
        ),
              const  Divider(),

        const ListTile(
          leading: Icon(
            Icons.exit_to_app_rounded,
            color: AppColor.green,
          ),
          title: CustomTextWidget("تسجيل الخروج"),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.green,
          ),
        ),
              const  Divider(),

      ],
    );
  }
}
