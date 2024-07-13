import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepo>()])


void main() {
  late GetTrendingMovies usecase;
  late MockMovieRepo mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepo();
    usecase = GetTrendingMovies(mockMovieRepository);
  });

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

  test("should get trending movies from the repository", () async {
    // arrange
    when(mockMovieRepository.getTrendingMovies()).thenAnswer((_) async => tMoviesList);

    // act
    final result = await usecase;

    // assert
    expect(result, tMoviesList);
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
