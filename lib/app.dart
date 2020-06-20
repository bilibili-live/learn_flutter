import 'package:flutter/material.dart';
import 'package:learn_flutter/views/abouts.dart';
import 'package:learn_flutter/views/home.dart';
import 'package:learn_flutter/views/product.dart';
import 'package:learn_flutter/views/lists.dart';

import 'config/const.dart';

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ApplicationState();
  }

}

class ApplicationState extends State<Application> {

  List<Widget> PageViews = [
    HomeViews(),
    ProductViews(),
    ListDemoViews(),
    AboutDemoViews(),
  ];

  int _currentIndex = 3;

  Widget _currentPage() {
    return PageViews[_currentIndex];
  }

  void changeBottomBar(int index) {
    if ((index + 1) > PageViews.length) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstKey.title),
        elevation: 8,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          changeBottomBar(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('产品'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('列表展示'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('关于我们'),
          ),
        ]
      ),
      body: _currentPage()
    );
  }

}