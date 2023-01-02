import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/enums.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/views/home/tabs/tab_title_widget.dart';
import 'package:movie_app/presentation/widgets/app_error_widget.dart';

import '../../../../common/strings_manager.dart';
import '../../../resources/values_manager.dart';
import 'list_view_builder.dart';
import 'tabs.dart';

class TabbedWidget extends StatelessWidget {
  const TabbedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppPadding.p4.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              for (int i = 0; i < tabs.length; i++)
                BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
                  builder: (context, state) {
                    return TabTitleWidget(
                      isSelected: state.moviesType == tabs[i].moviesType,
                      title: tabs[i].title,
                      onTap: () => _onTitleTapped(context, tabs[i].moviesType),
                    );
                  },
                )
            ],
          ),
          BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
            builder: (context, state) {
              if (state is MovieTabbedLoadingState) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state is MovieTabbedChangedState) {
                final movies = state.movies;
                return (movies.isEmpty)
                    ? Expanded(
                        child: Center(
                          child: Text(
                            AppStrings.noMovies,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ).tr(),
                        ),
                      )
                    : Expanded(
                        child: ListViewBuilder(
                          movies: movies,
                        ),
                      );
              } else if (state is MovieTabbedFailureState) {
                return AppErrorWidget(
                  failure: state.failure,
                  onPressed: () => _onTitleTapped(context, state.moviesType),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }

  _onTitleTapped(BuildContext context, MoviesType type) {
    context.read<MovieTabbedBloc>().add(MovieTabbedChangedEvent(moviesType: type));
  }
}
