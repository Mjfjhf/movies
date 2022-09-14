import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sending/home/home_screen.dart';
import 'package:sending/modules/tabs_navBar/home/top_rated/topRated_movies_details.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized(); //firebase
  await Firebase.initializeApp();
   // FirebaseFirestore.instance.disableNetwork();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.yellow
        )
      ),
      routes: {
        HomePage.routename : (context) => HomePage(),
        TopRatedDetails.routeName:(_)=>TopRatedDetails(),
      },
      initialRoute: HomePage.routename,
      debugShowCheckedModeBanner: false,
    );
  }
}
