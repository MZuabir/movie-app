// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:movie_app/core/server_exceptions.dart';
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});
  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "633084b069c0fb712132c1bc96c6a2e9";
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerExceptions();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async{
      final response =
        await client.get(Uri.parse("$BASE_URL/trending/movie/day?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerExceptions();
    }
  }
  
 

  @override
  Future<List<MovieModel>> searchMovies(String query)async {
     final response =
        await client.get(Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerExceptions();
    }
  }
}
