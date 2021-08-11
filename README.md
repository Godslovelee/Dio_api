
# using_dio_for_http_request

# Implementation
```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^3.0.9
  connectivity: ^0.4.8+2
```

# UI

```dart
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
```



A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
