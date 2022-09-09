import 'package:flutter/material.dart';
import 'package:sending/models/TopRatedRespons.dart';
import 'package:sending/shared/network/api_manager.dart';

class FeachTopRated extends StatelessWidget {
  const FeachTopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedRespons>(
      future: ApiManager.getMoviesTopRated(),
        builder:(context,snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snap.hasError){
            return AlertDialog(
              content: Text("Error"),
            );
          }
          var listOfTopRated=snap.data!.results??[];
          return ListView.builder(
            scrollDirection:Axis.horizontal ,
              itemCount: listOfTopRated.length,
              itemBuilder:(context,index){
                return  InkWell(
                  onTap: (){
                    //todo : navigator to details
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                    child: Stack(
                      children: [
                        Image.network("https://image.tmdb.org/t/p/original/${listOfTopRated[index].backdropPath}"??''
                          ,height: 150,width: 100,fit: BoxFit.fitHeight,),
                        Icon(Icons.bookmark_add_rounded,size: 55,color: Colors.white,)
                      ],
                    ),
                  ),
                );
              });
        });
  }
}