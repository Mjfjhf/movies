import 'package:flutter/material.dart';

import '../../../../models/movies_respose.dart';
import '../../../../shared/network/api_manager.dart';

class FechPopularApi extends StatelessWidget {

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
          return Container(
            decoration: BoxDecoration(
               color: Color(0xff1A1A1A)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text("   New Relleases",style: TextStyle(
                  fontSize: 17,
                    fontWeight: FontWeight.w600,
                  color: Colors.white
                ),textAlign: TextAlign.start,),
                SizedBox(height: 7,),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listOfPopular.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            //todo : navigator to details
                            print("---------------$index");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                            child: Stack(
                              children: [
                                Image.network("https://image.tmdb.org/t/p/original/${listOfPopular[index].backdropPath}"
                                  ,height: 200,width: 100,fit: BoxFit.fitHeight,),
                                Icon(Icons.bookmark_add_rounded,size: 45,color: Colors.white,)
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
/// Color(0xff1A1A1A)