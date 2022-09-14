import 'package:flutter/material.dart';
import '../../../../models/TopRatedRespons.dart';
import '../../../../shared/components/constant.dart';

class FiltredItem extends StatelessWidget {
  Results results;
  String? name;
  Image playImage;
  FiltredItem(
      {required this.results, required this.name, required this.playImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageBaseURL +
                  ((results.backdropPath) ??
                      '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
              height: 80,
              width: 120,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            width: 180,
            child: Text(
              results.title ?? 'Film',
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: (){
              // click watch 
            },
            child: playImage)
        ],
      ),
    );
  }
}
//