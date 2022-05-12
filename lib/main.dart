import 'package:consume_api/services/remote_services.dart';
import 'package:flutter/material.dart';

import 'models/userPost.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  dynamic postData; // dynamic value to store the data from api
  getData() async {
    var apiResponse = await GetApiData.getPosts();
    postData = apiResponse;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<dynamic>(
        future: GetApiData.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.black,
                  height: 1,
                  thickness: 1,
                );
              },
              itemBuilder: (context, index) {
                final post =
                    postData[index]; // you can either use this (without model)

                // initializing the model
                PostModel postModel = PostModel(
                    // or use this (The model data)
                    userId: postData[index]['userId'],
                    id: postData[index]['id'],
                    title: postData[index]['title'],
                    body: postData[index]['body']);

                return ListTile(
                  title: Text(post["title"]), // this is without model
                  subtitle: Text(postModel
                      .body), // this is from the model, you can use any
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
