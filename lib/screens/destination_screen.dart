import "package:flutter/material.dart";
import 'package:travel_app/models/activity_model.dart';

import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/widgets/activity_listitem.dart';
import 'package:travel_app/widgets/destination_header.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  State<StatefulWidget> createState() {
    return _DestinationScreenState();
  }
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          DestinationHeader(destination: widget.destination),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination.activities[index];
                  return ActivityListItem(activity: activity);
                }),
          ),
        ],
      ),
    );
  }
}
