import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../providers/theme/theme_provider.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final size = MediaQuery.of(context).size;

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 50, 20, 0),
              child: IconButton(
                onPressed: () {
                  ref.read(themeNotifierProvider.notifier).toggleDarkmode();
                },
                icon: Image.asset(
                  'assets/icon/moon.png',
                  color: Colors.white,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
              child: Text(
                'Hello, what do you want to watch?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
              child: CustomAppbar(),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(38, 47, 60, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Titles(
                        title: 'RECOMMENDED FOR YOU',
                        subtitle: 'See All',
                      ),
                      MovieHorizontalListview(
                          movies: nowPlayingMovies,
                          loadNextPage: () => ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage()),
                      const Titles(
                          title: 'TOP RATED',
                          subtitle: 'See All',
                          mainAlignment: MainAxisAlignment.spaceBetween),
                      MovieHorizontalListview(
                          movies: topRatedMovies,
                          loadNextPage: () => ref
                              .read(topRatedMoviesProvider.notifier)
                              .loadNextPage()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }, childCount: 1)),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}

class Titles extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final MainAxisAlignment? mainAlignment;

  const Titles({super.key, this.title, this.subtitle, this.mainAlignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        TextButton(
          child: Text(
            subtitle ?? '',
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
