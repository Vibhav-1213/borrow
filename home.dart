import 'package:borrow/Borrow_Page.dart';
import 'package:borrow/Post_Page.dart';
import 'package:flutter/material.dart';
import 'menu_dashboard_layout.dart';
class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) :super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}
  class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

    late Animation <Offset> _slideAnimation1;
  late AnimationController _controller;

    int index = 0;
    final screens = [
      MenuDashboardPage(),
      PostPage(),
      BorrowPage(),
    ];

    @override

    void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _slideAnimation1 = Tween<Offset>(begin: Offset(0,0),end: Offset(0,-1) ).animate(_controller);  
    }

    @override

    void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

    @override
    Widget build(BuildContext context) {
      return SlideTransition(
        position: _slideAnimation1,
        child: Scaffold(
          body: screens[index],
          backgroundColor: Colors.black,
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: const Color.fromARGB(255, 2, 52, 92),
              labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500,
                color: Colors.white,
              ),),
            ),
            child: NavigationBar(
              height: 70,
              selectedIndex: index,
              onDestinationSelected: (index) => 
              setState(() => this.index = index),
              backgroundColor: Colors.black,
              destinations: [
                NavigationDestination(
                  icon: Image.asset('images/lend.png',height: 25,width: 25,), 
                  label: 'Lend',),
                NavigationDestination(
                  icon: Image.asset('images/post_add.png',height: 25,width: 25,), 
                  label: 'Add',),
                NavigationDestination(
                  icon: Image.asset('images/borrow1.png',height: 27,width: 27,), 
                  label: 'Borrow'),
              ],
            ),
          ),
        ),
      );
    }
  }
