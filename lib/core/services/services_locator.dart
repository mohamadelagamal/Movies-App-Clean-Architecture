import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../movies/data/datasource/remote/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/bloc/movies_bloc.dart';

// Singleton instance of GetIt class
final serviceLocatorDirect = GetIt.instance;

class ServicesLocator {
  void init() {
    // Register all services here
    /// Bloc
    serviceLocatorDirect.registerFactory(() => MoviesBloc(serviceLocatorDirect(),serviceLocatorDirect(),serviceLocatorDirect()));

    /// Use Cases
    serviceLocatorDirect.registerLazySingleton(() => GetNowPlayingMoviesUseCase(serviceLocatorDirect()));
    serviceLocatorDirect.registerLazySingleton(() => GetTopRatedMoviesUseCase(serviceLocatorDirect()));
    serviceLocatorDirect.registerLazySingleton(() => GetPopularMoviesUseCase(serviceLocatorDirect()));

    /// Repository Singleton Pattern
    serviceLocatorDirect.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(serviceLocatorDirect()));

    /// DATA SOURCE Singleton Pattern (Remote)
    serviceLocatorDirect.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
