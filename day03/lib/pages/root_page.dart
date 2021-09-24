import 'package:day03/pages/buy_page.dart';
import 'package:day03/pages/home_page.dart';
import 'package:day03/pages/member_page.dart';
import 'package:flutter/material.dart';


class RootPage extends StatefulWidget {
  const RootPage({ Key? key }) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _index = 0;

  final List<Widget> _pages = [HomePage(),BuyPage(),MemberPage()];
  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(label: "首页",icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: "充值",icon: Icon(Icons.money)),
    BottomNavigationBarItem(label: "我的",icon: Icon(Icons.pregnant_woman)),
    ];
  


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   title: Text("切换页面"),
      // ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems,
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => {
          setState(() {
            _index = index;
          })
        },
      ),
    );
  }
}

