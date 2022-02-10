import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_list/list/listData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_list/services/authentication.dart';

class AddMovies extends StatefulWidget {
  const AddMovies({Key? key}) : super(key: key);

  @override
  _AddMoviesState createState() => _AddMoviesState();
}

String name='';
String direct='';
String url='';
ListData _listData= ListData();

class _AddMoviesState extends State<AddMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Movie"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
          child: Column(
            children: [
              TextFormField(
              onChanged: (val){
                setState(() {
                 name=val;
                });
              },
              showCursor: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),

                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: "Movies",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                  fontSize: 18,
                )
              ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val){
                  setState(() {
                    direct=val;
                  });
                },
                showCursor: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),

                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "Director",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                      fontSize: 18,
                    )
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val){
                  setState(() {
                    url=val;
                  });
                },
                showCursor: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),

                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "Poster Url",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[800],
                      fontSize: 18,
                    )
                ),
              ),
              SizedBox(height: 40),
              TextButton(onPressed: ()async{
                setState(() {});
                _listData.name = name;
                _listData.director=direct;
                _listData.url=url;

              await  FirebaseFirestore.instance.collection("users").doc(GoogleSignIn().currentUser?.id).collection("data").add(_listData.toJson());
              },
                  child: Text("Add",
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                  ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
