import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_list/list/listData.dart';
import 'package:movies_list/pages/movieWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {


List datalist=[];

  @override
 Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Colors.black,
            ],
          )
      ),
      child: ListView.builder(
            itemBuilder: (context, index){
              return Text("$index");
            },
            itemCount: datalist.length),
    );
  }
  Future getMovieList()async{
    var data1 = await FirebaseFirestore.instance.collection('users').doc(GoogleSignIn().currentUser?.id).collection('data').orderBy('name',descending: true).get();


    setState(() {
      datalist = List.from(data1.docs.map((e) => ListData.fromSnapshot(e)));
    });
  }
}
