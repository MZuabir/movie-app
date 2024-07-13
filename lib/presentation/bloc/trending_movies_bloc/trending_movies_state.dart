part of 'trending_movies_bloc.dart';

sealed class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();

  @override
  List<Object> get props => [];
}

class TrendingMoviesInitial extends TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<Movie> movies;

  const TrendingMoviesLoaded(this.movies);
}
class TrendingMoviesError extends TrendingMoviesState {
  final String error;

  const TrendingMoviesError(this.error);
}
