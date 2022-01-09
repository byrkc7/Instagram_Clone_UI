import 'package:flutter/material.dart';
import 'package:flutter_application_999/screen/actions.dart';
import 'package:flutter_application_999/screen/home.dart';
import 'package:flutter_application_999/screen/profil.dart';
import 'package:flutter_application_999/screen/search.dart';

void main() => runApp(const MyInstagramClone());

class MyInstagramClone extends StatelessWidget {
  const MyInstagramClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) => const HomePage(),
          "/search": (BuildContext context) => const SearchPage(),
          "/actions": (BuildContext context) => const ActionsPage(),
          "/profil": (BuildContext context) => const ProfilPage(),
        });
  }
}
