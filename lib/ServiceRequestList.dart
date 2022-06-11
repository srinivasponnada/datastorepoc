
import 'package:flutter/cupertino.dart';

import 'ServiceRequestItem.dart';
import 'models/ServiceRequest.dart';
import 'models/Status.dart';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class ServiceRequestList extends StatelessWidget {

  final List<ServiceRequest> serviceRequest;
  final Status status;

  List<ServiceRequest> _serviceRequests = [];

  ServiceRequestList({required this.serviceRequest, required this.status});

  @override
  Widget build(BuildContext context) {

    print('ServiceRequestList.Widget : Building ListView : ${serviceRequest.length}');

    return   serviceRequest.length >= 1
        ? ListView(
        padding: EdgeInsets.all(8),
        children: serviceRequest.map((serviceRequest) => ServiceRequestItem(serviceRequest: serviceRequest)).toList())
        : Center(child: Text('None!'));
  }
}

