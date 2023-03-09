import 'package:book_store/src/core/views/pages/home_page.dart';
import 'package:book_store/src/user_managment/Auth/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../main.dart';
import '../../core/application/constants.dart';
import '../wighet/custom_botton.dart';
import '../wighet/custom_faild.dart';
import '../wighet/custom_text.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  showSnakBar(String mss){
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
  Future<void> login()async {

    /// Validate
    if( email.text  == "" || email.text.isEmpty) {showSnakBar("         قم بادخال البريد اولا");return;}
    if( pass.text == "" || pass.text.isEmpty) {showSnakBar("         قم بادخال كلمة السر اولا");return;}
    if(!email.text.contains('@')){showSnakBar("         البريد الالكتروني غير صحيح");return;}
    if(pass.text.length < 6){showSnakBar("         كلمة السر غير صحيحة");return;}


    /// Sign In user with email and password
    final response = await client.auth.signIn(email : email.text,password:pass.text);

    if (response.error != null) {
      print(response.error!.message);
      // Error
     // Navigator.pop(context);
      if(response.error?.message == "Email not confirmed") {
        showSnakBar("  قم بتأكيد حسابك اولا لتتمكن من تسجيل الدخول");
        return;}
      else if(response.error?.message == "Failed host lookup: 'nxymjjgbbtsyvuqlnvuw.supabase.co") {
        showSnakBar("        ليس هناك اتصال بالانترنت");
        return;}
      else{showSnakBar(response.error!.message);return;}
    }

    Constants.EMAIL = email.text.toString();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("EMAIL",Constants.EMAIL);

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);

  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color.fromRGBO(10, 10, 10, 1),
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
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Lottie.asset("assets/images/login.json",height: height / 3.5, width: width,),
                    CustomText(txt: 'Email'),
                    CustomFaild(
                      hidPass: false,
                      prefixIcon: const Icon(Icons.mail, color: Colors.white),
                      textInputType: TextInputType.emailAddress,
                      suffixIcon: const Icon(Icons.visibility_off, color: Colors.white),
                      tc:email ,
                    ),
                    const SizedBox(height: 25),
                    CustomText(txt: 'Password'),
                    CustomFaild(
                      hidPass: true,
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      textInputType: TextInputType.visiblePassword,
                      suffixIcon: const Icon(Icons.visibility_off, color: Colors.white),
                      tc: pass,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      margin:const EdgeInsetsDirectional.only(end: 40),
                      child: RichText(
                        text:  TextSpan(
                          text:"Are have\'t account ? ",
                          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w300, fontFamily: 'Shantell',),
                          children: <TextSpan>[
                            TextSpan(text: 'Register', style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.w400, fontFamily: 'Shantell',),
                                recognizer: TapGestureRecognizer()..onTap = () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const Register()));}

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
                        CustomBotton(txt: "LogIn",onPress:login),
                        //Text("Create Account"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
