part of 'popular_movies_bloc.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;

  const PopularMoviesLoaded(this.movies);
}
class PopularMoviesError extends PopularMoviesState {
  final String error;

  const PopularMoviesError(this.error);
}
