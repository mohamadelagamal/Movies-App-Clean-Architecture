import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {

  final BaseMoviesRepository _moviesRepository;

  GetPopularMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await _moviesRepository.getPopularMovies();
  }
}