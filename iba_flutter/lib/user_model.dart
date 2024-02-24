import 'dart:convert';
import 'package:flutter/material.dart';
import 'Model/album.dart';
import 'package:http/http.dart' as http;

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<List<Album>> futureAlbumsList;

  Future<List<Album>> fetchAlbums() async {
    Uri urlObject = Uri.parse("https://jsonplaceholder.typicode.com/albums");

    final response = await http.get(urlObject);

    if (response.statusCode == 200){
      List<dynamic> parsedListJson = jsonDecode(response.body);

      List<Album> itemList = List<Album>.from(
        parsedListJson.map<Album> (
              (dynamic user) => Album.fromJson(user),
        ),
      );

      return itemList;
    } else{
      throw Exception('Failed to load Albums');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbumsList = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: futureAlbumsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        //child: Image.network('https://img.icons8.com/?size=96&id=7I3BjCqe9rjG&format=png'),
                      ),
                      //title: Text(index.toString()),
                      title: Text(snapshot.data?[index].title ?? ''),
                      //trailing: Icon(Icons.visibility),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container (
                              height: MediaQuery.of(context).size.width,
                              width: MediaQuery.of(context).size.width,
                              child: Center (
                                child: Text("Modal Bottom Sheet"),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
