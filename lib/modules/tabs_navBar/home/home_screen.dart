import 'package:flutter/material.dart';
import 'package:sending/modules/tabs_navBar/home/top_rated/feach_top_rated.dart';
import 'package:sending/modules/tabs_navBar/home/latest_movies/fech_lates_movies.dart';
import 'package:sending/modules/tabs_navBar/home/popular_movies/fetch_popular_data.dart';
import 'package:sending/shared/network/api_manager.dart';

import '../../../models/movies_respose.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: FechLatestApi(),
        ),
        SizedBox(height: 10,),
        Expanded(child: FechPopularApi()),
        SizedBox(height: 5,),
        Expanded(child: FeachTopRated()
        ),
      ],
    );
  }
}
