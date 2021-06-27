import 'package:flutter/material.dart';
import 'package:star_vision_admin/main_page.dart';
import 'package:star_vision_admin/provider/public_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  firebase_core.Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    //RGB Color Code (0, 194, 162)
    50: Color.fromRGBO(188, 158, 87, .1),
    100: Color.fromRGBO(188, 158, 87,.2),
    200: Color.fromRGBO(188, 158, 87, .3),
    300: Color.fromRGBO(188, 158, 87, .4),
    400: Color.fromRGBO(188, 158, 87, .5),
    500: Color.fromRGBO(188, 158, 87, .6),
    600: Color.fromRGBO(188, 158, 87, .7),
    700: Color.fromRGBO(188, 158, 87, .8),
    800: Color.fromRGBO(188, 158, 87, .9),
    900: Color.fromRGBO(188, 158, 87, 1),
  };
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>PublicProvider())
      ],
      child: MaterialApp(
        title: 'Star Vision Dish',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.blueGrey.shade50,
          primarySwatch: MaterialColor(0xffBC9E57, color),
          canvasColor: Colors.transparent
        ),
        home: MainPage(),
      ),
    );
  }
}