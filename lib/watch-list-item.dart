import 'package:flutter/material.dart';
import 'package:movies_project/watch-list.dart';

class WatchListItem extends StatelessWidget{
  final WatchList watchList;

  const WatchListItem({required this.watchList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 120,
      child: Card(
        child: Row(
          children: [
            if(watchList.image == 'N/A')
              Image.asset('assets/images/default-image.jpg', width: 100,)
            else
              Image.network(watchList.image),
            Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(watchList.title, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(watchList.year),
                      Text(watchList.genre),
                      Text(watchList.imdbRating)

                    ],
                  ),

                )
            ),
            // Container(
            //     alignment: Alignment.centerRight,
            //     child: IconButton(
            //       onPressed: () {
            //         // fetchMovieDetails(movieId: movie.imdbID);
            //
            //         DatabaseProvider.db.insert(WatchList(
            //             title: movie.title,
            //             year: movie.year,
            //             imdbRating: imdbRating,
            //             image: movie.image,
            //             imdbID: movie.imdbID,
            //             genre: genre))
            //
            //       },
            //       icon: Icon(Icons.watch_later_outlined,),
            //       tooltip: "Add to watch list",
            //     )
            // ),

          ],
        ),
      ),
    );
  }

}