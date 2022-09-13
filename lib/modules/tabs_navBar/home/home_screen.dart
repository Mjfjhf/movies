import 'package:flutter/material.dart';
import 'package:sending/modules/tabs_navBar/home/screen/feach_top_rated.dart';
import 'package:sending/modules/tabs_navBar/home/screen/fech_lates_movies.dart';
import 'package:sending/modules/tabs_navBar/home/screen/fetch_popular_data.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // top Movies
        Expanded(
          flex:8,
          child: FechLatestApi()),
          // Relleases movies
        Expanded(
          flex:4,
          child: FechPopularApi()),
       
        const Expanded(
          flex:5,
          child: FeachTopRated()),
      ],
    );
  }
}
