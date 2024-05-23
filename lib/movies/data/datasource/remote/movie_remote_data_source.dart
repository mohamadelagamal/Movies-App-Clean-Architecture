import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

// contract class for remote data source
abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

// implementation of remote data source contract class for movie data
class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    // Fetch data from API
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      // use error message model
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      // use error message model
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviePath);
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      // use error message model
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
