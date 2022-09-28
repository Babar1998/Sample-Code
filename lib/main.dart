import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        AppRoutes.home: (context) => Home(),
        AppRoutes.Page1: (context) => Page1(),
      },
      title: _title,
      // home: ,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("title")),
      body: const Center(
        child: MyStatelessWidget(),
      ),
    );
  }
}

var _color = Colors.black;
var _value = 0.0;

class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.Page1);
              },
              child: Text("Without Argument")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.Page1,
                    arguments: {"name": "lava", "body": "chi"});
              },
              child: Text("With Argument")),
        ],
      ),
    );
  }

  @override
  void initState() {}
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var arguments3 = ModalRoute.of(context)!.settings.arguments;

    var arguments2 =
    arguments3!=null? arguments3 as  Map<String, dynamic>:{};
    // {"name": "nodata", "body": "no data"};
    return Material(
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(arguments2["name"] ?? "No Data",
                  style: TextStyle(fontSize: 30)),
              Text(
                arguments2["body"] ?? "No Data",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppRoutes {
  static String failed = "/page2";
  static String Page1 = "/page1";
  static String home = "/";
}