import 'dart:async';

import 'package:datastorepoc/models/ModelProvider.dart';
import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'ServiceRequestDetails.dart';
import 'ServiceRequestList.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

import 'package:amplify_api/amplify_api.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:amplify_authenticator/amplify_authenticator.dart';

import 'package:amplify_storage_s3/amplify_storage_s3.dart';

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
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: GoogleFonts.poppins().fontFamily,
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

class CustomServiceRequestListView extends State with SingleTickerProviderStateMixin
{
  List<ServiceRequest> _srList = [];
  late final _tabController = TabController(length: 3, vsync: this);

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

    QueryPredicate predicate = ServiceRequest.REQUESTSTATUS.eq(Status.Accepted);

    _subscription = Amplify.DataStore.observeQuery(ServiceRequest.classType).listen((QuerySnapshot<ServiceRequest> snapshot) {
      setState(() {
        _srList = snapshot.items;
        print('@ _subscription : ${_srList.length}');
      });
    });

    /*Stream<SubscriptionEvent<ServiceRequest>> stream = Amplify.DataStore.observe(ServiceRequest.classType);
    stream.listen((event) {
      print('Received event of type ' + event.eventType.toString());
      print('Received post ' + event.item.toString());
    });*/

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

    // Add this line, to include Auth and Storage plugins.
    await Amplify.addPlugin(AmplifyStorageS3());

    try {
      await Amplify.configure(amplifyconfig);
    }
    on AmplifyAlreadyConfiguredException {
      print("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }

    //await Amplify.DataStore.save(sr1);

    try {
      _srList = await Amplify.DataStore.query(
          ServiceRequest.classType,
          where: ServiceRequest.REQUESTSTATUS.eq(Status.Rejected));
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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Service Requests'),
          bottom: TabBar(
            tabs: const <Widget>[
              Tab(
                // icon: Icon(Icons.radio_button_on, color: Colors.white),
                text: 'Assigned',
              ),
              Tab(
                // icon: Icon(Icons.check_box, color: Colors.white),
                text: 'Accepted',
              ),
              Tab(
                // icon: Icon(Icons.send, color: Colors.white),
                text: 'Completed',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ServiceRequestList(serviceRequest: _srList, status: Status.Accepted),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'ToDos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ],
          //currentIndex: _selectedIndex, //New
          //onTap: _onItemTapped,         //New
        ),
        /*drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),*/
      ),
    );
  }
}