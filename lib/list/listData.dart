

import 'package:movies_list/pages/addMovies.dart';

class ListData{
   String name='';
   String director='';
   String url='';

  ListData({name, director, url});
  Map <String,dynamic> toJson()=> {'name':name,'director':director,'url':url};

  ListData.fromSnapshot(snapshot):
       name = snapshot.data()['name'],
       director = snapshot.data()['director'],
        url = snapshot.data()['url'];

  static ListData fromJson(Map<String,dynamic> json) => ListData(
   name: json['name'],
    director: json['director'],
    url: json['url'],
  );
}

