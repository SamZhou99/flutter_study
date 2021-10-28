import 'package:day03/pages/home_page_01.dart';
import 'package:day03/pages/home_page_02.dart';
import 'package:day03/pages/home_page_03.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var tabs = [
    Tab(text: '推荐'),
    Tab(text: '热门'),
    Tab(text: '附近'),
  ];
  var tabViews = [
    Center(child: HomePage01()),
    Center(child: HomePage02()),
    Center(child: HomePage03()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("HomePage"),
            bottom: TabBar(
              tabs: tabs,
              controller: _tabController,
            )),
        body: TabBarView(controller: _tabController, children: tabViews));
  }
}
