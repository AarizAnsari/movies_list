import 'package:flutter/material.dart';
import 'package:movies_list/list/listData.dart';

class MovieWidget extends StatelessWidget {

  final ListData movie;

  MovieWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15), ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(movie.url),
        ),
        title: Text(movie.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("Directed by "+ListData.fromSnapshot(movie).director,
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        trailing: IconButton(
            onPressed: null,
            icon: Icon(Icons.delete)),
      ),
    );
  }
}
