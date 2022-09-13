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
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              //height: 55,
                              margin: EdgeInsets.only(top: 8,left: 10),
                              child: Image.network("https://image.tmdb.org/t/p/original/${listOfLatest.posterPath??
                                  "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"}",width: 120,height: 170,fit: BoxFit.fill,),
                            ),
                            Positioned(
                              top: 0,left:0,
                              child: IconButton( icon: addToWatchList(add),
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
                                },),
                            )
                          ],
                        ) ,top: 130),

                    ],
                  ),
                ),
                Text(listOfLatest.title??'',style: TextStyle(color: Colors.white),),
                Text(listOfLatest.releaseDate??'')
              ],
            ),
          );
        });
  }


  Widget addToWatchList(bool added){
    if(added){
      return Image.asset("assets/images/bookmark.png",width: 30,height: 50,);
    }else{
     return Image.asset("assets/images/addList.png",width: 35,height: 50,);
    }
  }
}
