// @dart=2.9
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manav_s_application1/ram/goal/newWrite.dart';
import 'package:manav_s_application1/routes/app_routes.dart';

User user = FirebaseAuth.instance.currentUser;
// Future<void> startTimer() async {
//   const fiveMinutes = Duration(hours: 24);
//   Timer.periodic(fiveMinutes, (timer) async {
//     // Get a reference to the document
//     final docRef = FirebaseFirestore.instance.collection('bless').doc(user!.email);

//     // Update the document with the new value
//     await docRef.update({ 'Typed Ram Today': 0 });
//   });
// }

 Timer _timer;
void startTimer() {
  final now = DateTime.now().toUtc().add(Duration(hours: 5, minutes: 30));
  final midnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0, 0, 0)
      .toUtc()
      .add(Duration(hours: 5, minutes: 30));
  final difference = midnight.difference(now);
  _timer = Timer(difference, () async {
    // Get a reference to the document
    final docRef =
        FirebaseFirestore.instance.collection('bless').doc(user.email);

    // Update the document with the new value
    await docRef.update({
      'Typed Ram Today': 0,
      'Blessing Earned Today': 0,
    });
    startTimer();
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  FirebaseAuth.instance.signInAnonymously();
  await Firebase.initializeApp();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]).then((_) {
//     startTimer();
//     runApp( MyApp());
//   });
  // runApp(MyApp());
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
        // const CustomPlugin(),
      ],
      builder: (context) => MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'manav_s_application1',
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      // home: newWrite(),
    );  
  }
}


/*
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
  }
} */


//textformfield

// TextFormField(
          //  controller: frameThirtyThreeController,
          //  keyboardType: TextInputType.name,
          //  textCapitalization: TextCapitalization.words,
          //  textInputAction: TextInputAction.next,
          //  decoration:InputDecoration(labelText: 'Student Name'),),