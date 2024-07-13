import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;
  TrendingMoviesBloc({required this.getTrendingMovies})
      : super(TrendingMoviesInitial()) {
    on<TrendingMoviesEvent>((event, emit) async {
      emit(TrendingMoviesLoading());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold(
          (failure) => emit(TrendingMoviesError(failure.toString())),
          (movies) => emit(TrendingMoviesLoaded(movies)));
    });
  }
}
