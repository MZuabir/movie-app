import 'package:dartz/dartz.dart';
import 'package:movie_app/core/server_failure.dart';
import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieRepo {
  Future<Either<Failure,List<Movie>>> getTrendingMovies();
  Future<Either<Failure,List<Movie>>> searchMovies(String query);
  Future<Either<Failure,List<Movie>>> getPopularMovies();
}
