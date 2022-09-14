import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sending/home/home_screen.dart';

import 'package:sending/modules/tabs_navBar/home/top_rated/topRated_movies_details.dart';
import 'package:sending/modules/tabs_navBar/browser/Screen/movies_filtred.dart';
import 'package:sending/provid/my_provider.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized(); //firebase
  await Firebase.initializeApp();
   // FirebaseFirestore.instance.disableNetwork();
 runApp(ChangeNotifierProvider(
      create: (context){

        return MyProviderApp();
      },
      child: MyApp()));




class MyApp extends StatelessWidget {


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

        MoviesFiltred.routeName: (context) => MoviesFiltred()

      },
      initialRoute: HomePage.routename,
      debugShowCheckedModeBanner: false,
    );
  }
}
