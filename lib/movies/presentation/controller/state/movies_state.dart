import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utills/enums.dart';

import '../../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  // MoviesState class is used to manage the state of the MoviesScreen.
  // It has three properties:
  // nowPlayingMovies: a list of Movie objects that represent the movies that are currently playing.
  final List<Movie> nowPlayingMovies;
  // nowPlayingMoviesRequestState: a RequestState enum that represents the state of the request to get the now playing movies.
  final RequestState nowPlayingMoviesRequestState;
  // message: a string that represents an error message if the request to get the now playing movies fails.
  final String nowPlayingMessage;

  // popular
  final List<Movie> popularList;
  final RequestState popularListRequestState;
  final String popularListMessage;

  // top rated
  final List<Movie> topRatedList;
  final RequestState topRatedListRequestState;
  final String topRatedListMessage;
  // The constructor initializes the properties with default values.
  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingMessage = '',
      this.nowPlayingMoviesRequestState = RequestState.loading
        /// Popular Movies
      ,this.popularList = const [],
      this.popularListMessage = '',
      this.popularListRequestState = RequestState.loading
        /// Top Rated
      ,this.topRatedList = const [],
      this.topRatedListMessage = '',
      this.topRatedListRequestState = RequestState.loading
      });

  // The copyWith method is used to create a new MoviesState object with updated values.
  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMoviesRequestState,
    String? nowPlayingMessage,
    /// Popular Movies
    List<Movie>? popularList,
    RequestState? popularListRequestState,
    String? popularListMessage,
    /// Top Rated
    List<Movie>? topRatedList,
    RequestState? topRatedMoviesRequestState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesRequestState: nowPlayingMoviesRequestState ?? this.nowPlayingMoviesRequestState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      /// Popular Movies
      popularList: popularList ?? this.popularList,
      popularListRequestState: popularListRequestState ?? this.popularListRequestState,
      popularListMessage: popularListMessage ?? this.popularListMessage
        /// Top Rated
      ,topRatedList: topRatedList ?? this.topRatedList,
      topRatedListRequestState: topRatedMoviesRequestState ?? this.topRatedListRequestState,
      topRatedListMessage: topRatedMessage ?? this.topRatedListMessage,
    );
  }
  // The copyWith method is used to create a new MoviesState object with updated values.
  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingMoviesRequestState,
        nowPlayingMessage,
    /// Popular Movies
    popularList,
    popularListRequestState,
    popularListMessage,
    /// Top Rated
    topRatedList,
    topRatedListRequestState,
    topRatedListMessage,

  ];
}
