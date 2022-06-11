
import 'package:datastorepoc/style/card_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'JobContainer.dart';
import 'ServiceRequestDetails.dart';
import 'credit_card.dart';
import 'models/ServiceRequest.dart';

class ServiceRequestItem extends StatelessWidget {
  final double iconSize = 24.0;
  final ServiceRequest serviceRequest;

  ServiceRequestItem({required this.serviceRequest});

  @override
  Widget build(BuildContext context) {

    print('ServiceRequestItem.Widget');

    return Container(
      padding: EdgeInsets.fromLTRB(2, 8, 8, 8),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border(
          left: BorderSide(color: Colors.orange, width: 5),
        ),
        boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(3,2),
            blurRadius: 6.0,
            spreadRadius: 2
        )]
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 9),
          Expanded(
            child:
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  serviceRequest.serviceRequestID.toString(),
                    //style: Theme.of(context).textTheme.titleLarge
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on_outlined, size: 16),
                    SizedBox(width: 5),
                    Text(
                      "11900 Edgewater Dr",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 22),
                    Text(
                      "7.0 Miles",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Icon(Icons.watch_later_outlined, size: 14),
                    SizedBox(width: 9),
                    Text(
                      "04 May 2022",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 9),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              /*GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Icon(Icons.bookmark_border),
                ),
              ),*/
              SizedBox(height: 90),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServiceRequestDetails(serviceRequest: serviceRequest)
                      )
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    "Open",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.teal,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );

    /*return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
        side: BorderSide(
        color: Theme.of(context).colorScheme.outline,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(1)),
    ),
    child:
      Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 3))
          ],
        ),
        child: new Row(
        children: <Widget>[
          //leftSection,
          Container(
              child: new Column(
                children: <Widget>[
                  Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent, size: 20.0),
                  new Text("",
                    style: new TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 12.0),),
                ],
              ),
          ),
          //middleSection,
          Expanded(
            child: new Container(
              padding: new EdgeInsets.only(left: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Name",
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),),
                  new Text("Hi whatsp?", style:
                  new TextStyle(color: Colors.grey),),
                ],
              ),
            ),
          ),
          Expanded(
            child: new Container(
              padding: new EdgeInsets.only(left: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("Name",
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),),
                  new Text("Hi whatsp?", style:
                  new TextStyle(color: Colors.grey),),
                ],
              ),
            ),
          ),
          //rightSection
          Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text("9:50",
                  style: new TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 12.0),),
                new CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 10.0,
                  child: new Text("2",
                    style: new TextStyle(color: Colors.white,
                        fontSize: 12.0),),
                )
              ],
            ),
          ),
        ],
      ),
    ));*/

    /*return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 30,
                child: Center(
                  child: Text(
                    'service',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child:
                  //Image.asset('assets/images/illustrationhouse.png')
                  Image.asset(
                    'assets/images/illustrationhouse.png',
                    fit: BoxFit.fitHeight,
                    width: 30.0,
                    height: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 30,
                child: Center(
                  child: Text(
                    'AC Repair',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          */

    /*return Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('123 456',
                        *//**//*cardNumber == null || cardNumber!.isEmpty
                            ? mask
                            : cardNumber!,*//**//*
                        style: TextStyle(
                          package: 'awesome_card',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'MavenPro',
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            // textExpDate!,
                            '12 May 2002',
                            style: TextStyle(
                                package: 'awesome_card',
                                color: Colors.black,
                                fontFamily: 'MavenPro',
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            *//**//*cardExpiry == null || cardExpiry!.isEmpty
                                ? textExpiry!
                                : cardExpiry!,*//**//*
                            '12 May',
                            style: TextStyle(
                                package: 'awesome_card',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'MavenPro',
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 7, // 60% of space => (6/(6 + 4))
                            child: Text(
                              *//**//*cardHolderName == null || cardHolderName!.isEmpty
                                  ? textName!
                                  : cardHolderName!,*//**//*
                              'Dan Lee',
                              style: TextStyle(
                                package: 'awesome_card',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          *//**//*Expanded(
                              flex: 2, // 40% of space
                              child: cardTypeIcon != null
                                  ? cardTypeIcon!
                                  : SizedBox(
                                width: 10,
                              )),*//**//*
                        ],
                      ),
                    ]),
              ),
            ),
          ),*//*
        ],
      ),
    );*/

    /*return CreditCard(
        cardNumber: "5450 7879 4864 7854",
        cardExpiry: "10/25",
        cardHolderName: "Card Holder",
        cvv: "456",
        bankName: "Axis Bank",
        showBackSide: false,
        frontBackground: CardBackgrounds.black,
        backBackground: CardBackgrounds.white,
        showShadow: true,
        textExpDate: 'Exp. Date',
        textName: 'Name',
        textExpiry: 'MM/YY'
    );*/

    /*return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
      ),
      elevation: 4.0,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CreditCard(
                cardNumber: "5450 7879 4864 7854",
                cardExpiry: "10/25",
                cardHolderName: "Card Holder",
                cvv: "456",
                bankName: "Axis Bank",
                showBackSide: false,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
                textExpDate: 'Exp. Date',
                textName: 'Name',
                textExpiry: 'MM/YY'
            ),
            Container(
              child: ListTile(
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
                ),
            ),
          ]
      ),
      *//*child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
      ),*//*
    );*/

    /*return Center(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(1)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              // leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {*//* ... *//*},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {*//* ... *//*},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );*/

    /*return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
      ),
      elevation: 4.0,
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
    );*/
  }
}