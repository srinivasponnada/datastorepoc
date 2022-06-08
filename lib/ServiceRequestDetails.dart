import 'dart:async';

import 'package:datastorepoc/Inspection.dart';
import 'package:datastorepoc/models/ModelProvider.dart';
import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

import 'package:cool_stepper/cool_stepper.dart';

class ServiceRequestDetails extends StatefulWidget {

  ServiceRequest serviceRequest;

  ServiceRequestDetails({required this.serviceRequest});

  ServiceRequest get getserviceRequest {
    return serviceRequest;
  }

  // Creating the setter method
  // to set the input in Field/Property
  set setName(ServiceRequest serviceRequest) {
    serviceRequest = serviceRequest;
  }

  @override
  State<ServiceRequestDetails> createState() => _ServiceRequestDetailsState(serviceRequest: serviceRequest);
}

class _ServiceRequestDetailsState extends State<ServiceRequestDetails> {

  final _formKey = GlobalKey<FormState>();
  ServiceRequest serviceRequest;
  _ServiceRequestDetailsState({required this.serviceRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details of Service Request"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            moveToLastScreen();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child:

          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 15.0),
                child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: serviceRequest.id),
                    cursorColor: Colors.purple,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.purple),
                      labelText: 'Title',
                      // icon: Icon(Icons.title),
                    )),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 15.0),
                child: TextField(
                  cursorColor: Colors.purple,
                  controller: TextEditingController(text: serviceRequest.customerFirst),
                  // style: textStyle,

                  decoration: const InputDecoration(
                    labelText: 'Details',
                    // icon: Icon(Icons.details),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 15.0),
                child: TextField(
                  readOnly: true,
                  cursorColor: Colors.purple,
                  controller: TextEditingController(text: serviceRequest.requestStatus.toString().split('.').last),
                  // style: textStyle,

                  decoration: const InputDecoration(
                    labelText: 'Status',
                    // icon: Icon(Icons.details),
                  ),
                ),
              ),

              // Fourth Element
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            child: const Text(
                              'Reject',
                              textScaleFactor: 1.5,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                rejectServiceRequest(serviceRequest.id);
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                            ),
                          ),
                          ElevatedButton(
                            child: const Text(
                              'Start Inspection',
                              textScaleFactor: 1.5,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                startInspection(serviceRequest);
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void startInspection(ServiceRequest serviceRequest){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Inspection(serviceRequest: serviceRequest)
        )
    );
  }

  Future<void> acceptServiceRequest(String serviceRequestId) async{
    ServiceRequest updatedServiceRequest = (await Amplify.DataStore.query(ServiceRequest.classType,
        where: ServiceRequest.ID.eq(serviceRequestId)))[0];
    ServiceRequest newServiceRequest = updatedServiceRequest.copyWith(
        id: updatedServiceRequest.id,
        requestStatus: Status.Accepted);

    await Amplify.DataStore.save(newServiceRequest);
    Navigator.pop(context, true);
  }

  Future<void> rejectServiceRequest(String serviceRequestId) async{
    ServiceRequest updatedServiceRequest = (await Amplify.DataStore.query(ServiceRequest.classType,
        where: ServiceRequest.ID.eq(serviceRequestId)))[0];
    ServiceRequest newServiceRequest = updatedServiceRequest.copyWith(
        id: updatedServiceRequest.id,
        requestStatus: Status.Rejected);

    await Amplify.DataStore.save(newServiceRequest);
    Navigator.pop(context, true);
  }


}