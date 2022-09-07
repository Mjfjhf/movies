import 'dart:convert';

import 'package:http/http.dart' as http;

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
}


