import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{
  // MoviesEvent class is used to manage the events that are triggered in the MoviesScreen.
  MoviesEvent();
  // The get props method is used to compare MoviesEvent objects.
  @override
  List<Object> get props => [];
}
// The getNowPlayingMovies class is used to trigger the event to get the now playing movies.
class GetNowPlayingMoviesEvent extends MoviesEvent{

}
// The getPopularMovies class is used to trigger the event to get the popular movies.
class GetPopularMoviesEvent extends MoviesEvent{

}
// The getTopRatedMovies class is used to trigger the event to get the top rated movies.
class GetTopRatedMoviesEvent extends MoviesEvent{

}