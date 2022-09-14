import 'package:flutter/material.dart';
import 'package:sending/models/TopRatedRespons.dart';
import 'package:sending/models/task_model.dart';
import 'package:sending/modules/tabs_navBar/home/similar/simillar_response.dart';
import 'package:sending/shared/network/utils/add_task_to_firebase.dart';
import '../similar/fetch_similar_data.dart';

class TopRatedDetails extends StatelessWidget {
 static const String routeName='Top_Detail';

  // Results results;
  // TopRatedDetails(this.results);
 @override
  Widget build(BuildContext context) {
   var results=ModalRoute.of(context)!.settings.arguments as Results;
   TaskModel tas=TaskModel(
        title: results.title!,
        id: results.id!,
     image: results.backdropPath!,
     date: results.releaseDate!,

   );
   // var id=results.genreIds;
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
            color: Color(0xff1A1A1A)
        ),
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20,),
              Text(results.title??'',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),textAlign: TextAlign.center,),
              SizedBox(height: 5,),

              InkWell(
                onTap: (){

                  print('********************************${tas.title}');
                  addTaskFromFireBase(tas).then((value) {
                    print('********************************${tas.id}');
                  }).catchError((e) {
                    print('error firebase***************** $e');
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network("https://image.tmdb.org/t/p/original/${results.backdropPath}"
                      ,height: MediaQuery.of(context).size.height*.3,
                       width: double.infinity,
                      ),
                    Center(
                      child: Icon(Icons.ondemand_video_sharp,
                        size: 45,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),

              Text(results.title??'',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                ),textAlign: TextAlign.start,),
              SizedBox(height: 8,),
              Text(results.releaseDate!,style: TextStyle(
                  fontSize: 14,
                   color: Colors.white,
                fontWeight: FontWeight.w200
              )),
              SizedBox(height: 8,),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.network("https://image.tmdb.org/t/p/original/${results.posterPath}"
                        ,height: MediaQuery.of(context).size.height*.22,
                        width: MediaQuery.of(context).size.width*.35,
                        alignment: Alignment.centerLeft,

                      ),
                      Icon(Icons.bookmark_add,
                        size: 35,color: Colors.white70,

                      )
                    ],
                  ),
                  
                  Expanded(
                      child: Column(
                        children: [
                          Text(
                              results.overview!,
                            style: TextStyle(fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              SizedBox(width: 5,),
                              Text('${results.voteAverage!}',style:
                              TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),

                            ],
                          ),

                        ],
                      ),

                  )
                ],
              ),
              Text("   More Like This",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              ),textAlign: TextAlign.start,),

              Expanded(
                  child: FetchSimilar(results.id??0),
          ),
          ]
        ),
      ) ,
      )
    );


  }
}
