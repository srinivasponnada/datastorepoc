
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ServiceRequestDetails.dart';
import 'models/ServiceRequest.dart';

class ServiceRequestItem extends StatelessWidget {
  final double iconSize = 24.0;
  final ServiceRequest serviceRequest;

  ServiceRequestItem({required this.serviceRequest});

  @override
  Widget build(BuildContext context) {

    print('ServiceRequestItem.Widget');

    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
      ),
      elevation: 4.0,
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          /*leading: const CircleAvatar(
          backgroundImage:
          NetworkImage('https://learncodeonline.in/mascot.png'),
        ),*/
          /*leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.autorenew, color: Colors.white),
        ),*/
          title: Text(
            serviceRequest.customerLast ?? 'No description',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          subtitle: Text(
            serviceRequest.requestStatus.toString().split('.').last,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent, size: 30.0),
          onTap: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceRequestDetails(serviceRequest: serviceRequest)
                )
            );
          }
      ),
    );
  }
}