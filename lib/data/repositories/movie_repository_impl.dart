import 'package:dartz/dartz.dart';
import 'package:movie_app/core/server_exceptions.dart';
import 'package:movie_app/core/server_failure.dart';
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repo.dart';

class MovieRepositoryImpl implements MovieRepo {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModels =
          await movieRemoteDataSource.getPopularMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModels =
          await movieRemoteDataSource.getTrendingMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final List<MovieModel> movieModels =
          await movieRemoteDataSource.searchMovies(query);
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerExceptions {
      return Left(ServerFailure());
    }
  }
}
