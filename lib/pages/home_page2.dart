import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/photo_model.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<PhotoModel> photos = [];

  Future<List<PhotoModel>> getPhotoList() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var photo in data) {
        photos.add(PhotoModel.fromJson(photo));
      }
      return photos;
    }
    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getPhotoList(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: photos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              photos[index].title,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Text(
                              photos[index].id.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        );
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
