import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_project/watch-list-search-result-page.dart';

class WatchListSearchPage extends StatefulWidget {
  const WatchListSearchPage({Key? key}) : super(key: key);

  @override
  _WatchListSearchPageState createState() => _WatchListSearchPageState();
}

class _WatchListSearchPageState extends State<WatchListSearchPage> {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search in your watch list"),),
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 245,
              child:  TextField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(),
                  hintText: 'Enter something to search',
                  // labelText: 'Enter something to search',
                ),
              ),
            ),


          ),
          TextButton.icon(
            onPressed: (){
              String movie = searchController.text;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WatchListSearchResultPage(movie),));
            },
            icon: Icon(Icons.search),
            label: Text("search"),
          ),

        ],
      ),

    );
  }
}
