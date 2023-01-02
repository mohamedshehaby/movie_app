import 'package:movie_app/common/enums.dart';
import 'package:movie_app/common/strings_manager.dart';

class Tab {
  final MoviesType moviesType;
  final String title;

  const Tab({
    required this.moviesType,
    required this.title,
  });
}

List<Tab> tabs = const [
  Tab(moviesType: MoviesType.popular, title: AppStrings.popular),
  Tab(moviesType: MoviesType.playingNow, title: AppStrings.playingNow),
  Tab(moviesType: MoviesType.comingSoon, title: AppStrings.comingSoon)
];
