import 'package:dartz/dartz.dart';
import 'package:movie_app/core/server_failure.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';

class GetTrendingMovies {
  final MovieRepo movieRepo;

  GetTrendingMovies(this.movieRepo);
  Future<Either<Failure,List<Movie>>> call() async{
    return  movieRepo.getTrendingMovies();
  }
}
