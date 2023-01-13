import 'package:hive/hive.dart';
import 'package:movie_app/data/tables/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);
  Future<List<MovieTable>> getMovies();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkIfMovieFavourite(int movieId);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  @override
  Future<bool> checkIfMovieFavourite(int movieId) async {
    final movieBox = await Hive.openBox<MovieTable>('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox<MovieTable>('movieBox');
    return movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getMovies() async {
    final movieBox = await Hive.openBox<MovieTable>('movieBox');
    return movieBox.values.toList();
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox<MovieTable>('movieBox');
    return movieBox.put(movieTable.id, movieTable);
  }
}
