import 'package:flutter/material.dart';
import 'package:sending/models/TopRatedRespons.dart';
import '../../../../shared/components/constant.dart';


class PopularDataItem extends StatelessWidget {
  Results results ;
  PopularDataItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
      //  alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageBaseURL +
              ((results.backdropPath) ??
            '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
              height: 120,width: 80,fit: BoxFit.fitHeight,),
          ),
      Positioned(
        left: 0,
        right: 60,
        top: 0,
        bottom: 90,
        child: InkWell(
            onTap: (){
              //todo : add to fire base
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children:[
                Image.asset("assets/images/addToList.png",width: 35,height: 50,),
                // firebase Condition
                const Padding(
                  padding:  EdgeInsets.only(top: 3),
                  child: Icon(Icons.add, color: Colors.white,size: 16,),
                )

              ] ),),
      )
        ],
      ),
    );
  }
}