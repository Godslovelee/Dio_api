import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void diorequest() async {
    var dio = Dio();

    final xresponse = await dio.get('https://jsonplaceholder.typicode.com/posts');
    //print(xresponse.data);
    setState(() {
      title = xresponse.data.toString();
      isLoading = false;
    });
  }

  bool isLoading;
  String title = "Press the button";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: [
                if (isLoading)
                  CircularProgressIndicator()
                else
                  Text(
                    "Press to retry",
                    textAlign: TextAlign.center,
                  ),
                FloatingActionButton(
                    child: Text("Request for data"),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      diorequest();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
