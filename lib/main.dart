import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  List<String> countries = [
    "Indonesia",
    "USA",
    "United Kingdom",
    "China",
    "Russia",
    "Brazil",
    "India",
    "Pakistan",
    "Nepal",
    "Bangladesh",
    "Sri Lanka",
    "Japan",
    "South Korea",
    "Mongolia"
  ];

  @override
  void initState() {
    scrollController.addListener(() {
      double showoffset = 10.0;

      if (scrollController.offset > showoffset) {
        showbtn = true;
        setState(() {});
      } else {
        showbtn = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Scroll Back to Top"),
            backgroundColor: Colors.orangeAccent),
        floatingActionButton: AnimatedOpacity(
          duration: const Duration(milliseconds: 1000),
          opacity: showbtn ? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {
              scrollController.animateTo(0, duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn
              );
            },
            backgroundColor: Colors.orangeAccent,
            child: const Icon(Icons.arrow_upward, color: Colors.white,),
          ),
        ),
        body: SingleChildScrollView(
            controller: scrollController, //set controller
            child: Column(
              children: countries.map((country) {
            return Card(
                child: ListTile(
                    title: Text(country)));
              }).toList(),
            )));
  }
}
