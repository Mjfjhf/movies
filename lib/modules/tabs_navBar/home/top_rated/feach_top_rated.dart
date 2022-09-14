import 'package:flutter/material.dart';
import 'package:sending/models/TopRatedRespons.dart';
import 'package:sending/modules/tabs_navBar/home/top_rated/top_rated_item.dart';
import 'package:sending/shared/network/api_manager.dart';

class FeachTopRated extends StatefulWidget {
  const FeachTopRated({Key? key}) : super(key: key);

  @override
  State<FeachTopRated> createState() => _FeachTopRatedState();
}

class _FeachTopRatedState extends State<FeachTopRated> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedRespons>(
      future: ApiManager.getMoviesTopRated(),
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return AlertDialog(
              content: Text("Error"),
            );
          }
          var listOfTopRated=snapshot.data?.results??[];
          return
            ListView.builder(
                // scrollDirection:Axis.horizontal ,
                itemCount: listOfTopRated.length,
                itemBuilder: (_,index){
                  return TopRatedItem(listOfTopRated[index]);
                }
            );
        }
        );
  }
}
