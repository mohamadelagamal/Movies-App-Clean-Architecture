import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository _moviesRepository;

  GetTopRatedMoviesUseCase(this._moviesRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await _moviesRepository.getTopRatedMovies();
  }
}