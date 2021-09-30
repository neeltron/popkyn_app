import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://popkyn.com/onboarding%203.png',
  'https://popkyn.com/onboarding%202.png',
  'https://popkyn.com/onboarding%201.png',
];

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
        scaffoldBackgroundColor: const Color(0x00000000),
        primaryColor: const Color(0xFFFFFFFF),
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VolunteerRoute()),
          );
    },
    child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'POPKYN', style: TextStyle(color: Colors.white, fontSize: 40,)
            ),
          ],
        ),
      ),
    )
    );
  }
}

class VolunteerRoute extends StatelessWidget {
  const VolunteerRoute({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 0.9,
              enlargeCenterPage: false,
              // enableInfiniteScroll: false,
            ),
            items: imgList
                .map((item) => Container(
              child: Center(
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                    height: height,
                  )),
            ))
                .toList(),
          );
        },
      ),
    );
  }
}
