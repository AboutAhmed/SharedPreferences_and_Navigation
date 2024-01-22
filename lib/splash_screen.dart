import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_and_navigation/Home_screen.dart';
import 'package:shared_preferences_and_navigation/Login_screen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}


class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Islogin();
  }

  Islogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool Islogin = sp.getBool('Islogin') ?? false;

    if(Islogin){
      Timer(const Duration(seconds: 3),(){
        Navigator.push(context,
        MaterialPageRoute(builder:(context)=> const Login_screen()));
      });
    }
    else{
      Timer(const Duration(seconds: 3),(){
        Navigator.push(context,
            MaterialPageRoute(builder:(context)=> const Home_screen()));
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fill,
        image: AssetImage('assets/2.jpg'),
      ),
    );
  }
}
