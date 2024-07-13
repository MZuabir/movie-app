import 'package:dartz/dartz.dart';
import 'package:movie_app/core/server_failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';

class GetPopularMovies {
  final MovieRepo movieRepo;

  GetPopularMovies(this.movieRepo);

  Future<Either<Failure,List<Movie>>> call() {
    return movieRepo.getPopularMovies();
  }
}
