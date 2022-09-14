import 'package:flutter/material.dart';
import 'package:sending/models/LatestResponse.dart';
import 'package:sending/modules/tabs_navBar/home/Item/feach_lates_movies_item.dart';
import 'package:sending/shared/network/api_manager.dart';

class FechLatestApi extends StatefulWidget {
  @override
  State<FechLatestApi> createState() => _FechLatestApiState();
}

class _FechLatestApiState extends State<FechLatestApi> {
  bool add=false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatestMovie>(
        future: ApiManager.getMovieslatest(),
        builder:(context,snap){
          if(snap.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snap.hasError){
           
            return const  AlertDialog(content: Text('Error'),);
          }
          var listOfLatest=snap.data;
          return InkWell(
            onTap: (){
              // todo : navigator to details
            },
            child: FeachLatesMoviesItem(latestMovie: listOfLatest),
          );
        });
  }


  
}
