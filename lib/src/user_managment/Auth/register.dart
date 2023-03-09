import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../../main.dart';
import '../../core/application/constants.dart';
import '../wighet/custom_botton.dart';
import '../wighet/custom_faild.dart';
import '../wighet/custom_text.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController repass = TextEditingController();
  final TextEditingController name = TextEditingController();
  showSnakBar(String mss){

    // final player = AudioCache();
    // player.play("erorr.mp3");
    var snackBar = SnackBar(
      elevation: 0.0,
      padding: const EdgeInsetsDirectional.all(5),
      margin: const EdgeInsetsDirectional.all(5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 1),
      content: AwesomeSnackbarContent(
        title: 'Oop !',
        message:"      $mss",
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }
  Future<void> register()async{
    if(name.text == "") {showSnakBar("قم بادخال الاسم");return;}
    if(email.text == "") {showSnakBar("    لايمكن للبريد ان يكون فارغا");return;}
    if(pass.text == "") {showSnakBar("لايمكن لكلمة المرور ان تكون فارغة");return;}
    if(!email.text.contains('@')){showSnakBar("   البريد الالكتروني غير صحيح ");return;}
    if(pass.text.length < 6){showSnakBar("   كلمة السر قصيرة جدا");return;}
    if(pass.text != repass.text ){showSnakBar("   كلمة السر غير مطابقة");return;}

    /// ok
    else {
      ///  loding.........
     // _showDialog("",true);

      // Sign up user with email and password
      final response = await client.auth.signUp(email.text, pass.text);
      if (response.error != null) {
      //  Navigator.pop(context);
        if (response.error?.message == "XMLHttpRequest error.")
        { showSnakBar("   تاكد من اتصالك بالانترنت ثم المحاولة");
          return;}
        else {
          showSnakBar(" هناك خطأ بتنسيق البريد الالكتروني");
          return;}
      }

      // Success
     // addData();
      Navigator.pop(context);
      /////////////////////////
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(10, 10, 10, 1),
        body: Stack(
          //alignment: Alignment.topLeft,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.fill,
                  )),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  head(),
                  const SizedBox(height: 45),
                  //   Lottie.asset("images/login.json",height: height / 3, width: width,),

                  CustomText(txt: 'Name'),
                  CustomFaild(
                    hidPass: false,
                    prefixIcon: const Icon(Icons.person, color: Colors.white),
                    textInputType: TextInputType.name,
                    suffixIcon:
                    const Icon(Icons.visibility_off, color: Colors.white),
                    tc: name,
                  ),

                  const SizedBox(height: 25),
                  CustomText(txt: 'Email'),
                  CustomFaild(
                    hidPass: false,
                    prefixIcon: const Icon(Icons.mail, color: Colors.white),
                    textInputType: TextInputType.emailAddress,
                    suffixIcon:
                    const Icon(Icons.visibility_off, color: Colors.white),
                    tc: email,
                  ),
                  const SizedBox(height: 25),

                  CustomText(txt: 'Password'),
                  CustomFaild(
                    hidPass: true,
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon:
                    const Icon(Icons.visibility_off, color: Colors.white),
                    tc: pass,
                  ),
                  const SizedBox(height: 25),

                  CustomText(txt: 'Re-Password'),
                  CustomFaild(
                    hidPass: true,
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon:
                    const Icon(Icons.visibility_off, color: Colors.white),
                    tc: repass,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    margin:const EdgeInsetsDirectional.only(end: 40),
                    child: RichText(
                      text:  TextSpan(
                        text:"Are you have account ? ",
                        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w300, fontFamily: 'Shantell',),
                        children: <TextSpan>[
                          TextSpan(text: 'Login', style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.w400, fontFamily: 'Shantell',),
                              recognizer: TapGestureRecognizer()..onTap = () {Navigator.pop(context);}

                          ),

                          // TextSpan(text: ' world!'),
                        ],
                      ),
                    ),
                  ),


                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomBotton(txt: "Create",onPress: register),
                      //Text("Create Account"),
                    ],
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget head() => Padding(
    padding: const EdgeInsets.only(
      bottom: 10.0,
      left: 20.0,
      right: 20.0,
    ),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70),
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(0, 150, 50, 40),
                  Color.fromRGBO(44, 235, 60, 92),
                ]),
          ),
        ),
        const Positioned(
          top: 14,
          child: Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Shantell',
              fontSize: 25,
            ),
          ),
        ),
      ],
    ),
  );
}

