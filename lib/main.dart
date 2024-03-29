import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/data/tables/movie_table.dart';
import 'package:movie_app/di/di.dart' as di;
import 'package:movie_app/presentation/blocs/simple_bloc_oberserver.dart';
import 'package:movie_app/presentation/views/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();
  Hive.registerAdapter(MovieTableAdapter());

  await di.init();

  Bloc.observer = SimpleBlocObserver();

  runApp(const App());
}
