import 'package:flutter/material.dart';
import 'package:sending/models/LatestResponse.dart';
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
            return Center(child: CircularProgressIndicator(),);
          }
          if(snap.hasError){
            print(snap.error);
            return AlertDialog(content: Text("Error"),);
          }
          var listOfLatest=snap.data;
          return InkWell(
            onTap: (){
              // todo : navigator to details
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network("https://image.tmdb.org/t/p/original/${listOfLatest!.backdropPath??
                            "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg"}",
                          height: 220,width: double.infinity,
                          ),
                        ),
                      ),
                        Positioned(child: Stack(
                          children: [
                            Image.network("https://image.tmdb.org/t/p/original/${listOfLatest.posterPath??
                                "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"}",width: 120,height: 170,fit: BoxFit.fill,),
                            IconButton( icon: addToWatchList(add),
                              onPressed: () {
                              // todo : add to watchlist in firebase
                                if(add){
                                  setState((){
                                    add=false;
                                  });
                                }else{
                                  setState((){
                                    add=true;
                                  });
                                }
                              },)
                          ],
                        ) ,top: 130),

                    ],
                  ),
                ),
                Text(listOfLatest.title??'',style: TextStyle(color: Colors.white),)
              ],
            ),
          );
        });
  }


  Widget addToWatchList(bool added){
    if(added){
      return Icon(Icons.bookmark_added,size: 55,color: Colors.white,);
    }else{
     return Icon(Icons.bookmark_add_rounded,size: 55,color: Colors.white,);
    }
  }
}
