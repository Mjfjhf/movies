import 'package:flutter/material.dart';
import '../../../../models/TopRatedRespons.dart';
import '../../../../shared/components/constant.dart';

class FiltredItem extends StatelessWidget {
  Results result;
  String? name;
  Image addList;
  FiltredItem({required this.result, required this.name, required this.addList});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding:const  EdgeInsets.only(bottom: 20,),
    margin:const  EdgeInsets.all(20),
    decoration: BoxDecoration(
      color:const  Color(0xff343534),
      borderRadius: BorderRadius.circular(12)
    ),
      child: Stack(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageBaseURL +
                  (result.backdropPath ?? 'assets/images/categoryImage.png'),
                  fit: BoxFit.fill,
                  
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
               const  Icon(
                  Icons.star,
                  color: Color(0xffFFBB3B),
                  size: 18,
                ),
               const  SizedBox(width: 8,),
                Text('${result.voteAverage}',style:const  TextStyle(
               color: Colors.white, fontSize: 14, decoration: TextDecoration.none),)
              ],
            ),
           const  SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(result.title ?? '',style:const  TextStyle(
                color: Colors.white, fontSize: 18, decoration: TextDecoration.none
              ),),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(result.releaseDate ?? '',style:const  TextStyle(
                color: Colors.white, fontSize: 14, decoration: TextDecoration.none,
              ),textAlign: TextAlign.end,),
            )
          ],
        ),
        Positioned(
           top: 0,
           left: 0,
           child: GestureDetector(
            onTap: () {

              // add to Watchlist
              print('hello word');
            },
            child: addList),),
        ],
      ),
    );
  }
}
//