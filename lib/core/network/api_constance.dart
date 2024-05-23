class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "03eb2319f90a1808130c89c87c6ae2f8";
  static const String nowPlayingMoviePath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviePath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviePath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String imagePath) => "$baseImageUrl$imagePath";
}
