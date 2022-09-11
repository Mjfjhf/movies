import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sending/home/home_screen.dart';
import 'package:sending/provid/my_provider.dart';

main(){
  runApp(ChangeNotifierProvider(
      create: (context){

        return MyProviderApp();
      },
      child: MyApp()));
}


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
        HomePage.routename : (context) => HomePage()
      },
      initialRoute: HomePage.routename,
      debugShowCheckedModeBanner: false,
    );
  }
}
