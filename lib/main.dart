import 'dart:async';

import 'package:datastorepoc/models/ModelProvider.dart';
import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

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

    ServiceRequest sr1 = new ServiceRequest(customerFirst: 'Mervin', customerLast: 'Huges');
    // Add the following lines to your app initialization to add the DataStore plugin

    AmplifyDataStore datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    Amplify.addPlugin(datastorePlugin);

    try {
      await Amplify.configure(amplifyconfig);
    }
    on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }

    await Amplify.DataStore.save(sr1);

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
        title: Text('JSON ListView in Flutter'),
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
        leading: const CircleAvatar(
          backgroundImage:
          NetworkImage('https://learncodeonline.in/mascot.png'),
        ),
        title: Text(
          serviceRequest.customerLast ?? 'No description',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        subtitle: Text(
          serviceRequest.customerLast ?? 'No description',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
