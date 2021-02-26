import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:covid/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class ControllerPage extends StatefulWidget {
  @override
  _ControllerPageState createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    HomePage(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  getGradient(Color color) {
    return LinearGradient(
        colors: [color.withOpacity(0.5), color.withOpacity(0.1)],
        stops: [0.0, 0.7]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Theme.of(context).backgroundColor,
        hasNotch: true,
        opacity: .2,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        elevation: 10,
        items: <BubbleBottomBarItem>[
          bottomNavBarItem(Icons.home, "Home", context),
        ],
      ),
    );
  }
}