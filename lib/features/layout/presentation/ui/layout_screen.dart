import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/patterned_scaffold.dart';
import '../../../home/presentation/ui/home_screen.dart';
import 'widgets/home_bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late final PageController _pageController;
  int currentPageIndex = 0;

  List<Widget> _tabs = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);

    _tabs = [
      const HomeScreen(),
      const Center(child: Text('Home Tab 2')),
      const Center(child: Text('Home Tab 3')),
      const Center(child: Text('Home Tab 4')),
      const Center(child: Text('Home Tab 5')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, results) async {
        if (_pageController.page != 0) {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );

          setState(() {
            currentPageIndex = 0;
          });
        }
      },
      child: PatternedScaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _tabs,
        ),
        bottomNavigationBar: CustomBottomNavBar(
          pageController: _pageController,
        ),
      ),
    );
  }
}
