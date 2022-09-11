import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provid/my_provider.dart';
import 'My_search.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

var formKey = GlobalKey<FormState>();
var searchcontroller = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  late var provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProviderApp>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchcontroller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    hintText: 'Tell us about yourself',

                    //helperText: 'Keep it short, this is just a demo.',
                    prefixIcon:  Icon(
                      Icons.person,
                      color: Colors.yellow,
                    ),
                    prefixText: ' ',
                    suffixIcon: IconButton(
                        onPressed: () {
                          gitsearch();
                        },
                        icon:  Icon(
                          Icons.search,
                          color: Colors.yellow,
                        )),

                    fillColor: Colors.white,
                    labelText: 'Search',
                    focusColor: Color(0xFFFFFFFF),
                  ),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter Room Name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

   gitsearch() {

      provider.search(searchcontroller.text);
      print(searchcontroller.text);
     // Navigator.pushNamed(context, routeName)

  }
}
