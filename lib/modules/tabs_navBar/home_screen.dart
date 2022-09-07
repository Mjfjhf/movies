import 'package:flutter/material.dart';
import 'package:sending/shared/network/api_manager.dart';

import '../../models/movies_respose.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesResponse>(
        future: ApiManager.getMoviesPopular(),
        builder: (context,snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snap.hasError){
            print(snap.error);
            return AlertDialog(content: Text("there are some errors"),);
          }
          var listOfPopular= snap.data?.results??[];
          return ListView.builder(
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
              itemCount: listOfPopular.length,
              itemBuilder: (context,index){
                return Image.network("https://image.tmdb.org/t/p/original/${listOfPopular[index].backdropPath}"??''
                ,height: 300,width: 400,);
              });
        });
  }
}
