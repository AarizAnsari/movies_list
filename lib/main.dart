import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_list/pages/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_list/services/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    if(Currentuser()==''){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AlertDialog(
          actions: [
            ListTile(
              title: Text("Sign In with Google",
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              leading: SizedBox(
                height: 30,
                width: 30,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcjNFjFl7Mm6ZFieOn_C1rDq9VyBOlqdZFHWT8x3Yjev9R8wOXL6HrI1cPrBm70YBDRuc&usqp=CAU"),
              ),
              onTap: ()async{
                await SignIn();
                setState(() {
                print(Currentuser());
                });
              },
            ),
          ],
        ),
      );}
      else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    }

   }
}
