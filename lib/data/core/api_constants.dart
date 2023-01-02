class ApiConstants {
  // To avoid create the class from outside make it private
  ApiConstants._();

  static const String apiKey = '4a07d45e054fe5dc7d49b33b3504e1e3';
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String trending = '/trending/movie/day';
  static const String popular = '/movie/popular';
  static const String comingSoon = '/movie/upcoming';
  static const String playingNow = '/movie/now_playing';
  static const int apiTimeOut = 60000;
}
