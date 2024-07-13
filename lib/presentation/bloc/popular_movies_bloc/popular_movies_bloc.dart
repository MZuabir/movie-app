import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc({required this.getPopularMovies})
      : super(PopularMoviesInitial()) {
    on<FetchPopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
          (failure) => emit(PopularMoviesError(failure.toString())),
          (movies) => emit(PopularMoviesLoaded(movies)));
    });
  }
}
