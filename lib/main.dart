// ignore_for_file: depend_on_referenced_packages

import 'package:book_store/src/core/application/constants.dart';
import 'package:book_store/src/core/views/pages/home_page.dart';
import 'package:book_store/src/user_managment/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';

final client = SupabaseClient(Constants.url, Constants.key);


getEmail()async{

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Constants.EMAIL =  sharedPreferences.getString("EMAIL") ?? "";
  if(Constants.EMAIL.isEmpty || Constants.EMAIL == "" ){return false;}
  else{return true;}
}
bool isLogin = false;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  isLogin = await getEmail();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home: isLogin ?  const HomePage(): const Login(),
    );
  }
}
