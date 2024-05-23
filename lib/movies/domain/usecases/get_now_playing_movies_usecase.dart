import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {

  final BaseMoviesRepository _moviesRepository;

  GetNowPlayingMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await _moviesRepository.getNowPlayingMovies();
  }
}