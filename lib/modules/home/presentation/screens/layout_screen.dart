import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injector.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../bloc/home_bloc.dart';
import 'home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  List pages = [
    BlocProvider.value(
      value: serviceLocator<HomeBloc>(),
      child: const HomeScreen(),
    ),
    const Center(
      child: BigTextWidget('screen 2'),
    ),
    const Center(
      child: BigTextWidget('screen 3'),
    ),
    const Center(
      child: BigTextWidget('screen 4'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(() {
          _selectedIndex = index;
        }),
        controller: _pageController,
        children: [...pages],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => _onItemTapped(index),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Cart'),
          ),
          FlashyTabBarItem(
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
