import 'dart:convert';
import 'package:http/http.dart' as http;
import '../components/carousel_tile.dart';
import '/components/movie_tile.dart';
import 'package:flutter/material.dart';

class Api {
  static const _imageUrlHeader = "https://image.tmdb.org/t/p/w500/";

  static Future<List<MovieTile>> fetchPopular() async {
    List<MovieTile> list = [];
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=e304808cb17a2b16cdbb66a01589d260'),
      );
      final json = jsonDecode(response.body);
      (json['results'] as List<dynamic>).forEach((element) {
        list.add(
          MovieTile(
            image: _imageUrlHeader + element["poster_path"],
            title: element["title"],
            overview: element['overview'],
            rating: element['vote_average'] / 1,
            releaseDate: element['release_date'],
          ),
        );
      });
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<MovieSliderTile>> fetchTopRated() async {
    List<MovieSliderTile> list = [];
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/top_rated?api_key=e304808cb17a2b16cdbb66a01589d260'),
      );
      final json = jsonDecode(response.body);
      (json['results'] as List<dynamic>).forEach((element) {
        list.add(
          MovieSliderTile(
            image: _imageUrlHeader + element["poster_path"],
            title: element["title"],
            overview: element['overview'],
            rating: element['vote_average'] / 1,
            releaseDate: element['release_date'],
          ),
        );
      });
      return list;
    } catch (e) {
      return [];
    }
  }
}
