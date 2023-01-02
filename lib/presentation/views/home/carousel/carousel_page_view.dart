import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import 'animated_carousel_card_widget.dart';

class CarouselPageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const CarouselPageView({super.key, required this.initialPage, required this.movies});

  @override
  State<CarouselPageView> createState() => _CarouselPageViewState();
}

class _CarouselPageViewState extends State<CarouselPageView> {
  late final PageController _pageController = PageController(
    viewportFraction: .7,
    initialPage: widget.initialPage,
  );

  late final Timer _timer;

  int _currentPage = 0;
  bool end = false;
  @override
  void initState() {
    super.initState();

    // To add the backdrop image to the first movie at the slider
    context.read<MovieBackdropBloc>().add(MovieBackdropChangedEvent(movie: widget.movies[0]));

    // To make slider slide automatically forward and reverse
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (!end) {
        _currentPage = (_pageController.page! + 1).toInt();
        if (_currentPage == widget.movies.length) {
          end = true;
        }
      } else {
        _currentPage = (_pageController.page! - 1).toInt();
        if (_currentPage == 0) {
          end = false;
        }
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (i) {
        context.read<MovieBackdropBloc>().add(MovieBackdropChangedEvent(movie: widget.movies[i]));
      },
      itemCount: widget.movies.length,
      controller: _pageController,
      itemBuilder: (ctx, i) {
        final movie = widget.movies[i];
        return AnimatedCarouselCardWidget(
          movieId: movie.id,
          posterPath: movie.posterPath,
          index: i,
          pageController: _pageController,
        );
      },
    );
  }
}
