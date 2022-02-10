import 'package:flutter/material.dart';
import 'package:movies_list/main.dart';
import 'package:movies_list/pages/addMovies.dart';
import 'package:movies_list/services/movieList.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_list/services/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Text(userName,
          style: TextStyle(
            fontSize: 14,
          ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        title: Text("Movie List"),
        centerTitle: true,
        elevation: 5,
        actions: [
          IconButton(onPressed:()async{
          await  SignOut();
            setState(() {
          });
          } ,
              icon: Icon(Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
     body: MoviesList(),
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.deepPurple,
       onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=> AddMovies()));
       },
       child: Text("Add"),
     ),
    );
  }
}


