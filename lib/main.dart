import 'dart:async';

import 'package:datastorepoc/models/ModelProvider.dart';
import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'ServiceRequestDetails.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

import 'package:amplify_api/amplify_api.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:amplify_authenticator/amplify_authenticator.dart';

void main() {
  print('@ main');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {

    print('@ MyApp.Widget');

    /*return Authenticator(
        child: MaterialApp(
          builder: Authenticator.builder(),
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.purple),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ThemeData(
              primarySwatch: Colors.purple,
            ).colorScheme,
          ),
          home: Scaffold(
              body: Center(child: ServiceRequestListView()),
          )
        ),
    );*/

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ThemeData(
            primarySwatch: Colors.purple,
          ).colorScheme,
        ),
      home:
        Scaffold(
            body: Center(child: ServiceRequestListView()),
        )
    );
  }
}

class ServiceRequestListView extends StatefulWidget
{
  CustomServiceRequestListView createState() => CustomServiceRequestListView();
}

class CustomServiceRequestListView extends State
{
  List<ServiceRequest> _srList = [];

// subscription of Todo QuerySnapshots - to be initialized at runtime
  late StreamSubscription<QuerySnapshot<ServiceRequest>> _subscription;

  @override
  void initState() {

    print('@ CustomServiceRequestListView.initState');

    _initializeApp();
    super.initState();
  }

  Future<void> _initializeApp() async {

    print('@ CustomServiceRequestListView._initializeApp');

    await _configureAmplify();

    _subscription = Amplify.DataStore.observeQuery(ServiceRequest.classType).listen((QuerySnapshot<ServiceRequest> snapshot) {
      setState(() {
        _srList = snapshot.items;
        print('@ _subscription : ${_srList.length}');
      });
    });
  }

  Future<void> _configureAmplify() async {

    print('@ CustomServiceRequestListView._configureAmplify');

    //ServiceRequest sr1 = new ServiceRequest(customerFirst: 'Charlie', customerLast: 'Din', requestStatus: Status.Assigned);
    // Add the following lines to your app initialization to add the DataStore plugin

    AmplifyDataStore datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    Amplify.addPlugin(datastorePlugin);
    await Amplify.addPlugin(AmplifyAPI());

    // Add the following line to add Auth plugin to your app.
    await Amplify.addPlugin(AmplifyAuthCognito());

    try {
      await Amplify.configure(amplifyconfig);
    }
    on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }

    //await Amplify.DataStore.save(sr1);

    try {
      _srList = await Amplify.DataStore.query(ServiceRequest.classType);
      print('@ _configureAmplify : ${_srList.length}');
    }
    on DataStoreException catch (e) {
      print('Query failed: $e');
    }

    print('@ _configureAmplify : ${_srList.length}');
  }

  @override
  Widget build(BuildContext context) {

    print('CustomServiceRequestListView.build : Building UI : ${_srList.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Service Requests'),
      ),
      body: ServiceRequestList(serviceRequest: _srList)
      );
  }
}

class ServiceRequestList extends StatelessWidget {
  final List<ServiceRequest> serviceRequest;

  ServiceRequestList({required this.serviceRequest});

  @override
  Widget build(BuildContext context) {

    print('ServiceRequestList.Widget : Building ListView : ${serviceRequest.length}');

    return serviceRequest.length >= 1
        ? ListView(
        padding: EdgeInsets.all(8),
        children: serviceRequest.map((serviceRequest) => ServiceRequestItem(serviceRequest: serviceRequest)).toList())
        : Center(child: Text('Tap button below to add a todo!'));
  }
}

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

class DetailPage extends StatelessWidget {

  final ServiceRequest serviceRequest;

  DetailPage({required this.serviceRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>
        [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(40.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
            child: Center(
              child: Text(serviceRequest.id),
            ),
          ),
          Positioned(
            left: 8.0,
            top: 60.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}



