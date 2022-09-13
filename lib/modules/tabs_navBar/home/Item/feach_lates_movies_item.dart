import 'package:flutter/material.dart';
import 'package:sending/models/LatestResponse.dart';
import '../../../../shared/components/constant.dart';

class FeachLatesMoviesItem extends StatefulWidget {
  LatestMovie? latestMovie;
  
  FeachLatesMoviesItem(
      {required this.latestMovie,});

  @override
  State<FeachLatesMoviesItem> createState() => _FeachLatesMoviesItemState();
}

class _FeachLatesMoviesItemState extends State<FeachLatesMoviesItem> {
  bool add = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Image.network(
          imageBaseURL +
              ((widget.latestMovie?.posterPath) ??
                  '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          
        ),
        Positioned(
          left: 10,
          top: 80,
          child: Stack(
            children: [
              Image.network(
                imageBaseURL +
                    ((widget.latestMovie?.posterPath) ??
                        '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                width: 120,
                height: 180,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset('assets/images/addToList.png'),
                ),
              
            ],
          ),
        ),
        Positioned(
          left: 160,
          top: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.latestMovie?.originalTitle ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    widget.latestMovie?.releaseDate ?? '2018',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ))
      ],
    );
  }
}
