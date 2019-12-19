import 'package:better_me/pages/subject_view_page.dart';
import 'package:better_me/pages/get_user_info.dart';
import 'package:flutter/material.dart';


//import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        
      ),
      home:GetUserInfo(),
    );
  }
}
