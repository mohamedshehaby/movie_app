import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_app/presentation/views/search/search_movie_card.dart';

import '../../../common/strings_manager.dart';
import '../../../di/di.dart';
import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/app_error_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isNotEmpty) query = '';
        },
        icon: const Icon(Icons.clear),
        color: query.isEmpty ? Colors.white : AppColor.secondary,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton(
      color: Colors.white,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider<SearchMovieBloc>(
      create: (context) => instance(),
      child: Builder(builder: (context) {
        context.read<SearchMovieBloc>().add(SearchMovieNameChangedEvent(movieName: query));
        return BlocBuilder<SearchMovieBloc, SearchMovieState>(
          builder: (context, state) {
            if (state is SearchMovieLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SearchMovieFailureState) {
              return AppErrorWidget(
                onPressed: () => context
                    .read<SearchMovieBloc>()
                    .add(SearchMovieNameChangedEvent(movieName: query)),
                failure: state.failure,
              );
            } else if (state is SearchMovieLoadedState) {
              final movies = state.movies;
              if (movies.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s64.w),
                    child: const Text(
                      AppStrings.noMoviesSearched,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => SearchMovieCard(
                  movie: movies[index],
                ),
                itemCount: movies.length,
                scrollDirection: Axis.vertical,
              );
            }
            return const SizedBox.shrink();
          },
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}
