part of 'search_movies_bloc.dart';

sealed class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<Movie> movies;

  const SearchMoviesLoaded(this.movies);
}
class SearchMoviesError extends SearchMoviesState {
  final String error;

  const SearchMoviesError(this.error);
}
