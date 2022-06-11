
import 'dart:async';
import 'dart:ui';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ServiceRequestList.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'models/ServiceRequest.dart';

class ServiceRequestsView extends StatefulWidget
{
  const ServiceRequestsView({Key? key});
  @override
  _ServiceRequestsViewState createState() => _ServiceRequestsViewState();
}

class _ServiceRequestsViewState extends State<ServiceRequestsView> with SingleTickerProviderStateMixin
{
  bool _isLoading = true;
  List<ServiceRequest> _srList = [];

  List<ServiceRequest> _srAssignedList = [];
  List<ServiceRequest> _srAcceptedList = [];

  late final _tabController = TabController(length: 3, vsync: this);

  // Amplify Plugins
  final AmplifyDataStore _dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
  final AmplifyStorageS3 _storagePlugin = AmplifyStorageS3();

  // subscription to ServiceRequest model update events - to be initialized at runtime
  late StreamSubscription _subscription;

  @override
  void initState() {
    print('@ ServiceRequestsView.initState');
    _initializeApp();
    super.initState();
  }

  @override
  void dispose() {
    // cancel the subscription when the state is removed from the tree
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _initializeApp() async {

    print('@ ServiceRequestsView._initializeApp');

    if (!Amplify.isConfigured) {
      await _configureAmplify();
    }

    _subscription = Amplify.DataStore.observe(ServiceRequest.classType).listen((e) {
      _fetchServiceRequests();
    });

    await _fetchServiceRequests();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {

    print('@ ServiceRequestsView._configureAmplify');

    try {
      // add Amplify Plugins
      await Amplify.addPlugins(
          [_dataStorePlugin, _apiPlugin, _authPlugin, _storagePlugin]);
      await Amplify.configure(amplifyconfig);
    }
    catch (err) {
      debugPrint('@ Amplify configuration : $err');
    }
  }

  Future<void> _fetchServiceRequests() async {
    try {
      // query for all ServiceRequest entries by passing the ServiceRequest classType to
      // Amplify.DataStore.query()
      List<ServiceRequest> updatedServiceRequests = await Amplify.DataStore.query(ServiceRequest.classType);

      List<ServiceRequest> assignedServiceRequests = await Amplify.DataStore.query(
          ServiceRequest.classType,
          where: ServiceRequest.REQUESTSTATUS.eq(Status.Assigned)
      );

      List<ServiceRequest> acceptedServiceRequests = await Amplify.DataStore.query(
          ServiceRequest.classType,
          where: ServiceRequest.REQUESTSTATUS.eq(Status.Accepted)
      );

      // update the ui state to reflect fetched todos
      setState(() {
        _srList = updatedServiceRequests;
        _srAssignedList = assignedServiceRequests;
        _srAcceptedList = acceptedServiceRequests;
      });
    } catch (e) {
      print('An error occurred while querying Service Requests : $e');
    }
  }


  @override
  Widget build(BuildContext context) {

    print('ServiceRequestsView.build : ${_srList.length}');

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            child: Row(
                children: <Widget>[
                  Text(
                    ' InspectionPlus',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ),
          bottom: TabBar(
            tabs: const <Widget>[
              Tab(
                // icon: Icon(Icons.radio_button_on, color: Colors.white),
                text: 'ASSIGNED',
              ),
              Tab(
                // icon: Icon(Icons.check_box, color: Colors.white),
                text: 'ACTIVE',
              ),
              Tab(
                // icon: Icon(Icons.send, color: Colors.white),
                text: 'COMPLETED',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ServiceRequestList(serviceRequest: _srAssignedList, status: Status.Assigned),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ServiceRequestList(serviceRequest: _srAcceptedList, status: Status.Accepted),
            Text('Coming up!'),
          ],
        ),
        /*bottomNavigationBar: BottomNavigationBar(
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
        ),*/
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