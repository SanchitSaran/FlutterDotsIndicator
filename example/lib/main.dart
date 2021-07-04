import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:dot_indication_flutter/dot_indication_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List listDot = ['1', '2', '3', '4'];

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.bounceIn;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 450,
                child: PageView.builder(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  allowImplicitScrolling: true,
                  onPageChanged: (int page) {
                    setState(() {
                      selectedIndex = page;
                    });
                  },
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                          placeholder: AssetImage('assets/exercise1.jpg'),
                          image: AssetImage(img[index]['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: new Center(
                  child: new DotsIndicator(
                    color: Color(0XFFe6bc5f),
                    materialType: MaterialType.circle,
                    controller: _pageController,
                    itemCount: listDot.length,
                    onPageSelected: (int page) {
                      _pageController.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<dynamic> img = [
  {'image': 'assets/exercise1.jpg'},
  {'image': 'assets/exercise2.jpg'},
  {'image': 'assets/exercise3.jpg'},
  {'image': 'assets/exercise4.jpg'},
];
