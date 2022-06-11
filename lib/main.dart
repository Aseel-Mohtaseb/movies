import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_project/watch-list-page.dart';
import 'package:movies_project/watch-list-search-page%20.dart';
import 'display-movies.dart';
import 'movies-genre-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SearchMovie(title: 'Search for a Movie'),
    );
  }
}

class SearchMovie extends StatefulWidget {
  SearchMovie({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Search for a Movie"),),
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
                    hintText: 'Enter Movie Title',
                    labelText: 'Enter Movie Title',

                  ),
                ),
              ),
            ),
            TextButton.icon(
                onPressed: (){
                  String movieName = searchController.text;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Display(movieName: movieName,),));
                  },
                icon: Icon(Icons.search),
                label: Text("search"),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/drawerImage.jpg"),
                          fit: BoxFit.cover
                        ),
                        gradient: LinearGradient(
                            colors: <Color> [Colors.pink.shade200, Colors.pink]
                        )
                    ),
                    child: Text("")
                ),
                buildMenuItem(
                    icon: Icon(Icons.watch_later),
                    title: "Watch List Page",
                    onClick: (){
                      selectItem(context, 0);
                    },
                ),
                buildMenuItem(
                    icon: Icon(Icons.movie),
                    title: "Movies Genre Page",
                    onClick: (){
                      selectItem(context, 1);
                    }
                ),
                buildMenuItem(
                    icon: Icon(Icons.search_off),
                    title: "Search Watch List Page",
                    onClick: (){
                      selectItem(context, 2);
                    }
                ),
              ],
            ),
          ),
        ),

      );
  }
  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold);

  buildMenuItem({required Icon icon, required String title, required Function onClick}){
    return ListTile(
      leading: icon,
      title: Text(title, style: boldTextStyle,),
      onTap: (){
        onClick();
      },
    );
  }

  selectItem(BuildContext context, int index){
    switch(index){
      case 0: Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WatchListPage())
      );
      break;
      case 1: Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MoviesGenrePage())
      );
      break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WatchListSearchPage())
        );
        break;
    }
  }
}



