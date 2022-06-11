import 'dart:async';

import 'package:datastorepoc/models/ModelProvider.dart';
import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import 'ServiceRequestDetails.dart';
import 'ServiceRequestList.dart';
import 'ServiceRequestsView.dart';
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
        title: 'Inspections Simplified',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home:
        Scaffold(
            body: Center(child: ServiceRequestsView()),
        )
    );
  }
}