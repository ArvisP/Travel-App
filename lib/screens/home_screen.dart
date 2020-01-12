import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:travel_app/screens/profile_screen.dart';
import 'package:travel_app/widgets/hotel_carousel.dart';

import "../widgets/destination_carousel.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIcon = 0;
  int _currentTabIndex = 1;
  bool _profileIsCollapsed = true;
  String profileImageURL =
      "https://i.ytimg.com/vi/7Xu_s1YJhyg/maxresdefault.jpg";

  String name = "Jane Doe";
  String location = "New York, NY";

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.bicycle,
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _buildIcon(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIcon = index;
          });
        },
        child: Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
            color: _selectedIcon == index
                ? Theme.of(context).primaryColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selectedIcon == index
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
        ));
  }
  _closeDrawer(){
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          key: _scaffoldKey,
          drawer: ProfileScreen(name: name, location: location, closeDrawer: _closeDrawer),
          body:
            SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      "What are you looking for?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _icons
                          .asMap()
                          .entries
                          .map((MapEntry map) => _buildIcon(map.key))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  DestinationCarousel(),
                  SizedBox(height: 20.0),
                  HotelCarousel(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentTabIndex,
              onTap: (int index) {
                setState(() {
                  _currentTabIndex = index;
                  if (index == 0) {
                    _profileIsCollapsed = !_profileIsCollapsed;
                    _scaffoldKey.currentState.openDrawer();
                  }
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage(profileImageURL),
                  ),
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 30.0),
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_drink, size: 30.0),
                  title: SizedBox.shrink(),
                ),
              ],
            ),
        ),
      ],
    );
  }

}
