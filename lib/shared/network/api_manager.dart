import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sending/models/LatestResponse.dart';
import 'package:sending/models/TopRatedRespons.dart';
import 'package:sending/modules/tabs_navBar/home/similar/simillar_response.dart';
import 'package:sending/modules/tabs_navBar/home/top_rated/top_rated_details_response.dart';

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

  // static Future<SimillarResponse> getMoviesSimillar()async{
  //   var uri= Uri.https("api.themoviedb.org", "/3/movie/${278}/similar",{
  //     "api_key" : "8447f6d466cb085704029ad005725822",
  //
  //   });
  //   var getdta=await http.get(uri);
  //   try{
  //     var bodyString= getdta.body;
  //     var json= jsonEncode(bodyString);
  //     var res= SimillarResponse.fromJson(json);
  //     return res;
  //   }catch (e){
  //     print('****************$e');
  //     throw e;
  //   }
  //
  // }

  static Future<TopRatedDetailsResponse> getTopRatedDetails(int id)async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/${id}",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= TopRatedDetailsResponse.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }


  }
  static Future<SimillarResponse> getMoviesSimilar(int id)async{
    var uri= Uri.https("api.themoviedb.org", "/3/movie/${id}/similar",{
      "api_key" : "8447f6d466cb085704029ad005725822"
    });
    var getdta=await http.get(uri);
    try{
      var bodyString= getdta.body;
      var json= jsonDecode(bodyString);
      var res= SimillarResponse.fromJson(json);
      return res;
    }catch (e){
      throw e;
    }

  }
}


