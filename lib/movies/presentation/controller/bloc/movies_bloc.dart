import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utills/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import '../events/movies_events.dart';
import '../state/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    // emit(MoviesState(nowPlayingMoviesRequestState: RequestState.loading));

    final result = await getNowPlayingMoviesUseCase.execute();
    //print(result);
    //emit(MoviesState(nowPlayingMoviesRequestState: RequestState.loaded));


    result.fold(
      (left) => emit(state.copyWith(
        nowPlayingMoviesRequestState: RequestState.error,
        nowPlayingMessage: left.message,
      )),
      (right) => emit(state.copyWith(
        nowPlayingMoviesRequestState: RequestState.loaded,
        nowPlayingMovies: right,
      )),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    //emit(const MoviesState(popularListRequestState: RequestState.loading));

    final result = await getPopularMoviesUseCase.execute();
    //print(result);
    // emit(const MoviesState(popularListRequestState: RequestState.loaded));

    result.fold(
      (left) => emit(state.copyWith(
        popularListRequestState: RequestState.error,
        popularListMessage: left.message,
      )),
      (right) => emit(state.copyWith(
        popularListRequestState: RequestState.loaded,
        popularList: right,
      )),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {

    final result = await getTopRatedMoviesUseCase.execute();

    result.fold(
      (left) => emit(state.copyWith(
        topRatedMoviesRequestState: RequestState.error,
        topRatedMessage: left.message,
      )),
      (right) => emit(state.copyWith(
        topRatedMoviesRequestState: RequestState.loaded,
        topRatedList: right,
      )),
    );
  }
}
