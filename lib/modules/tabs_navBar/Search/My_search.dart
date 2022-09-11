import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provid/my_provider.dart';


class Mysearchdlegate extends SearchDelegate{
  static const String routName = "search";
  static String? q ;
  List<String>resultSearch=[
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    //var provider=Provider.of<MyProviderApp>(context);
    // TODO: implement buildActions
    return [
      IconButton(onPressed: (){
        if(query.isEmpty){
          close(context, null);
        }
        else query='';

      }, icon: Icon(Icons.clear)),
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: ()=>close(context, null), icon: Icon(Icons.arrow_back));

  }

  @override
  Widget buildResults(BuildContext context) {
    var provider=Provider.of<MyProviderApp>(context);
    // TODO: implement buildResults
    return ListTile(
      title: Text(query),
      onTap: (){
        provider.search(query);
        Navigator.pop(context);

      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var provider=Provider.of<MyProviderApp>(context);
    // TODO: implement buildSuggestions
    List<String>suggest=resultSearch.where((resultSearch) {
      final result=resultSearch.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount:suggest.length ,
      itemBuilder: (context,index)
      {
        final Suggest =suggest[index];

        return ListTile(
          title: Text(Suggest),
          onTap: (){
            query=Suggest;
            provider.search(query);
            Navigator.pop(context);

          },
        );

      },

    );
  }


}
