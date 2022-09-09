import 'package:flutter/material.dart';
import 'package:sending/modules/tabs_navBar/home/feach_top_rated.dart';
import 'package:sending/modules/tabs_navBar/home/fech_lates_movies.dart';
import 'package:sending/modules/tabs_navBar/home/fetch_popular_data.dart';
import 'package:sending/shared/network/api_manager.dart';

import '../../../models/movies_respose.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex:6,child: FechLatestApi()),
        Expanded(flex:3,child: FechPopularApi()),
        SizedBox(height: 7,),
        Expanded(flex:3,child: FeachTopRated()),
      ],
    );
  }
}
