import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_list/main.dart';



GoogleSignIn _googleSignIn = GoogleSignIn();

String user='';
String userName='';

SignIn()async{
  await _googleSignIn.signIn();
  user = _googleSignIn.currentUser!.id;
  userName= _googleSignIn.currentUser!.displayName.toString();
}

SignOut()async{
  await _googleSignIn.signOut();
  user = '';
  userName = '';
  main();
}

Future<bool> isSignedIn() {
 return _googleSignIn.isSignedIn();
}

Currentuser(){
  return user;
}
