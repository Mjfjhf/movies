import 'package:flutter/material.dart';
import 'package:sending/models/TopRatedRespons.dart';
import 'package:sending/modules/tabs_navBar/home/Item/feach_top_rated_item.dart';
import 'package:sending/shared/network/api_manager.dart';

class FeachTopRated extends StatelessWidget {
  const FeachTopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image addToList = Image.asset( "assets/images/addToList.png", width: 35,height: 50,);
    return FutureBuilder<TopRatedRespons>(
      future: ApiManager.getMoviesTopRated(),
        builder:(context,snap){
          if(snap.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snap.hasError){
            return const  AlertDialog(
              content: Text("Error"),
            );
          }
          var listOfTopRated =snap.data!.results?? [];
          return Container(
           color : const  Color(0xff343534),
           padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const  Text(' Recomended', 
                      style: TextStyle(
                        fontSize: 16, 
                        fontWeight: FontWeight.w500,
                        color: Colors.white),),
                Expanded(
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal ,
                      itemCount: listOfTopRated.length,
                      itemBuilder:(context,index){
                        return  InkWell(
                          onTap: (){
                            //todo : navigator to details
                          },
                          child: FeachTopRatedItem(results: listOfTopRated[index],addToList: addToList),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
