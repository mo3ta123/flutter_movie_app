import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/services/api.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:badges/badges.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> popularList = [];
  List<dynamic> topRatedList = [];
  int _numberOfFavourites = 0;
  @override
  void initState() {
    super.initState();
    Api.fetchTopRated().then(
      (value) {
        setState(() => topRatedList = value);
      },
    );
    Api.fetchPopular().then(
      (value) {
        setState(() => popularList = value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          'Egy Dead',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 187, 187, 187),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 187, 187, 187),
            ),
            onPressed: () {},
          ),
          Badge(
            badgeColor: Colors.pink,
            position: const BadgePosition(start: 20, bottom: 30),
            badgeContent: Text(
              _numberOfFavourites.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                onPressed: () {}),
          ),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Color.fromARGB(255, 48, 48, 48),
      ),
      backgroundColor: Color.fromARGB(255, 66, 66, 66),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselSlider.builder(
            itemCount: topRatedList.length,
            itemBuilder: (context, index, realIndex) {
              return topRatedList[index];
            },
            options: CarouselOptions(
              autoPlay: true,
              height: 300,
              enlargeCenterPage: true,
            ),
          ),
          Expanded(
            child: MasonryGridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(12),
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 12,
              itemCount: popularList.length,
              itemBuilder: (context, index) {
                return popularList[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
