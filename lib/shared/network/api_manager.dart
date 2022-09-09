import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sending/models/LatestResponse.dart';
import 'package:sending/models/TopRatedRespons.dart';

import '../../models/movies_respose.dart';

class ApiManager{
  static Future<MoviesResponse> getMoviesPopular()async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/popular",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= MoviesResponse.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }

  }
  static Future<LatestMovie> getMovieslatest()async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/latest",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= LatestMovie.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }

  }
  static Future<TopRatedRespons> getMoviesTopRated()async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/top_rated",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= TopRatedRespons.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }

  }
}

