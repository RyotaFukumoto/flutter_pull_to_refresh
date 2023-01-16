import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> cats = ["ひじき","つくし"];
  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        key: refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blue,
        strokeWidth: 4.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: ListView.builder(
          itemCount: cats.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(cats[index]),
            );
          },
        ),
      )
    );
  }
}
