import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/usecases/search_movies.dart';

import 'get_trending_movies_test.mocks.dart';

void main() {
  late SearchMovies usecase;
  late MockMovieRepo mockMovieRepo;

  setUp(() {
    mockMovieRepo = MockMovieRepo();
    usecase = SearchMovies(mockMovieRepo);
  });
  final query = "Inception";
  final tMoviesList = [
    Movie(
      adult: true,
      backdropPath: "backdrop",
      genreIds: [],
      id: 1,
      originalLanguage: "en",
      originalTitle: "title",
      overview: "overview",
      popularity: 5,
      posterPath: "poster path",
      releaseDate: DateTime.now(),
      title: "title",
      video: true,
      voteAverage: 50,
      voteCount: 40,
    ),
    Movie(
      adult: true,
      backdropPath: "backdrop",
      genreIds: [],
      id: 1,
      originalLanguage: "en",
      originalTitle: "title",
      overview: "overview",
      popularity: 5,
      posterPath: "poster path",
      releaseDate: DateTime.now(),
      title: "title",
      video: true,
      voteAverage: 50,
      voteCount: 40,
    ),
  ];
  test("should get movies from the query from the repository", () async {
    //arrange
    when(mockMovieRepo.searchMovies(any)).thenAnswer((_) => tMoviesList);
    //act
    final result = await usecase(query);
    //assert
    expect(result, tMoviesList);
    verify(mockMovieRepo.searchMovies(query));
    verifyNoMoreInteractions(mockMovieRepo);
  });
}
