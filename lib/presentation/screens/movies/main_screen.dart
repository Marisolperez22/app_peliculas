import 'package:flutter/material.dart';

import '../../views/movies/home_view.dart';

class MainScreen extends StatefulWidget {
  static const name = 'main-screen';
  final int pageIndex;

  const MainScreen({super.key, required this.pageIndex});

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

//* Este Mixin es necesario para mantener el estado en el PageView
class _HomeScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    const Color backgroundColor = Color.fromRGBO(92, 134, 174, 1);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
