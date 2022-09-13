import 'package:flutter/material.dart';
import '../../../../models/TopRatedRespons.dart';
import '../../../../shared/components/constant.dart';

class FeachTopRatedItem extends StatelessWidget {
  Results results;
  Image addToList ;
  FeachTopRatedItem({required this.results, required this.addToList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [ 
            ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageBaseURL +
                  ((results.backdropPath) ??
                      '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
              height: 100,
              width: 80,
              fit: BoxFit.fitHeight,
            ),
          ),
            Positioned(
             child: GestureDetector(
              onTap: () {

                // add to Watchlist
                
              },
              child: addToList),)
          ],
        ),
      ),
    );
  }
}
