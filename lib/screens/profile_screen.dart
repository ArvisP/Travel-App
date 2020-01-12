import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String location;
  final Function closeDrawer;
  int _selectedIndex = 0;
  final _options = [
    {"item": "Dashboard", "icon": Icons.dashboard},
    {"item": "Messages", "icon": Icons.mail},
    {"item": "My Trips", "icon": Icons.airplanemode_active},
    {"item": "Upcoming Events", "icon": Icons.event},
    {"item": "Settings", "icon": Icons.settings},
  ];

  ProfileScreen({this.name, this.location, this.closeDrawer});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Theme.of(context).primaryColor,
        child:
          menu(),
    );
  }

  selectedOption(int index) {
    if (index == _selectedIndex) {
      return;
    }
  }

  Widget menu() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                  onTap: closeDrawer,
                  child:
                      Icon(Icons.exit_to_app, size: 35.0, color: Colors.white)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 75.0,
                  backgroundImage: NetworkImage(
                      "https://i.ytimg.com/vi/7Xu_s1YJhyg/maxresdefault.jpg"),
                ),
                SizedBox(height: 10),
                Text(name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800)),
                Text(location,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w100)),
                SizedBox(height: 40.0),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.dashboard, size: 30.0, color: Colors.white70),
              Text(
                "  Dashboard",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(height: 26.0),
          Row(
            children: <Widget>[
              Icon(Icons.mail, size: 20.0, color: Colors.white70),
              Text(
                "  Messages",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(height: 26.0),
          Row(
            children: <Widget>[
              Icon(Icons.airplanemode_active,
                  size: 20.0, color: Colors.white70),
              Text(
                "  My Trips",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(height: 26.0),
          Row(
            children: <Widget>[
              Icon(Icons.event, size: 20.0, color: Colors.white70),
              Text(
                "  Upcoming Events",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(height: 26.0),
          Row(
            children: <Widget>[
              Icon(Icons.settings, size: 20.0, color: Colors.white70),
              Text(
                "  Settings",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}
