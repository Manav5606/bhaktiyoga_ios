import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_animations/im_animations.dart';
import 'package:manav_s_application1/core/app_export.dart';
import 'package:manav_s_application1/widgets/custom_button.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:volume_control/volume_control.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  @override
  void initState() {
    VolumeControl.setVolume(0.5);
    super.initState();
    // User? user = FirebaseAuth.instance.currentUser;
    // createDatabase();
    _timer = Timer.periodic(Duration(seconds: 100), (Timer t) => values());
    verifyUserDeatils();
    values();
    createCollectionIfNotExists();
    createCollectionIfNotExistsBank();

    // Timer.periodic(Duration(seconds: 10), (Timer t) => retrieveLast24HoursCounter());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    
    super.dispose();
  }

  int typedram = 0;
  int typedramtoday = 0;
  int blessingsearnedtoday = 0;
  int verifyDetails = 0;

  @override
  Widget build(BuildContext context) {
    verifyUserDeatils();
    values();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray900,
        body: Container(
          width: size.width * 1.2,
          height: double.infinity,
          // height:, 
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  
                  height: getVerticalSize(
                    Get.height * 0.65 ,
                  ),
                  width: size.width * 1.2,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: size.width * 1.2,
                          height: size.height * 0.55,
                          padding: getPadding(
                            left: 62,
                            top: 21,
                            right: 62,
                            bottom: 21,
                          ),
                          decoration: AppDecoration.fillLime900.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderBR37,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ColorSonar(
                                // contentAreaColor: Colors.red,
                                innerWaveColor: Colors.redAccent,
                                middleWaveColor: Color.fromARGB(255, 255, 121, 111),
                                outerWaveColor: Color.fromARGB(255, 251, 166, 160),
                                contentAreaRadius: 80.0,
                                waveFall: 30.0,
                                // waveMotion: WaveMotion.synced,
                                duration: Duration(seconds: 6),
                                waveMotionEffect: Curves.easeOutSine,
    
                                child: Padding(
                                  padding: const EdgeInsets.only(top:48.0),
                                  child: CustomImageView(
                                    
                                    imagePath: ImageConstant.imgPngegg1,
                                    height: getSize(
                                      273.00,
                                    ),
                                    width: getSize(
                                      253.00,
                                    ),
                                    margin: getMargin(
                                      bottom: 120,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: getMargin(
                            left: 20,
                            right: 20,
                          ),
                          decoration: AppDecoration.fillYellow100.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder24,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 45,
                                ),
                                child: Text(
                                  "You typed",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtLoraRomanSemiBold10.copyWith(
                                    fontSize: 12,
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 6,
                                ),
                                child: Text(
                                  "$typedramtoday",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtLoraRomanSemiBold42.copyWith(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 2,
                                ),
                                child: Text(
                                  "Ram today",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style:
                                      AppStyle.txtLoraRomanSemiBold20.copyWith(
                                    height: getVerticalSize(
                                      1.00,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  353.00,
                                ),
                                margin: getMargin(
                                  top: 20,
                                ),
                                padding: getPadding(
                                  left: 66,
                                  top: 14,
                                  right: 66,
                                  bottom: 14,
                                ),
                                decoration: AppDecoration.fillLime900.copyWith(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(21),
                                        bottomRight: Radius.circular(21))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 3,
                                      ),
                                      child: Text(
                                        "$blessingsearnedtoday blessings earned today",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtLoraRomanSemiBold16
                                            .copyWith(
                                          height: getVerticalSize(
                                            1.00,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: getPadding(
                          left: 33,
                          top: 24,
                          right: 33,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.fillYellow100.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder14,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 3,
                              ),
                              child: Text(
                                "You typed Ram",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.txtLoraRomanSemiBold1284.copyWith(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                            ),
                            Container(height: 3,),
                            Padding(
                              padding: getPadding(
                                top: 1,
                              ),
                              child: Text(
                                "$typedram",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.txtLoraRomanSemiBold2568.copyWith(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        onTap: () {
                          if (verifyDetails == 0) {
                            Navigator.pushNamed(
                                context, AppRoutes.verifyDetails);
                          } else {
                            Navigator.pushNamed(
                                context, AppRoutes.blessingDetails);
                          }
                        },
                        height: 82,
                        width: 176,
                        text: "Get Paid",
                        margin: getMargin(
                          left: 18,
                        ),
                        variant: ButtonVariant.FillLime900,
                        // padding: ButtonPadding.PaddingT25,
                        fontStyle: ButtonFontStyle.LoraRomanSemiBold2468,
                        suffixWidget: Container(
                          margin: getMargin(
                            left: 10,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgVector,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: OutlineGradientButton(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(
                        1.00,
                      ),
                      top: getVerticalSize(
                        1.00,
                      ),
                      right: getHorizontalSize(
                        1.00,
                      ),
                      bottom: getVerticalSize(
                        1.00,
                      ),
                    ),
                    strokeWidth: getHorizontalSize(
                      1.00,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(
                        0.06,
                        0,
                      ),
                      end: Alignment(
                        1,
                        0.9,
                      ),
                      colors: [
                        ColorConstant.lime900,
                        ColorConstant.gray900,
                      ],
                    ),
                    corners: Corners(
                      topLeft: Radius.circular(
                        29,
                      ),
                      topRight: Radius.circular(
                        29,
                      ),
                      bottomLeft: Radius.circular(
                        29,
                      ),
                      bottomRight: Radius.circular(
                        29,
                      ),
                    ),
                    child: Container(
                      width: getHorizontalSize(
                        353.00,
                      ),
                      padding: getPadding(
                        all: 5,
                      ),
                      decoration: AppDecoration.outline.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder29,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomButton(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.chooseGoal);
                            },
                            height: 48,
                            width: 341,
                            text: "Start Typing “RAM”",
                            variant: ButtonVariant.OutlineYellow100,
                            shape: ButtonShape.CircleBorder24,
                            padding: ButtonPadding.PaddingAll11,
                            fontStyle:
                                ButtonFontStyle.LoraRomanSemiBold18Gray900,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: getMargin(
                    left: 20,
                    top: 20,
                    right: 25,
                    bottom: 5,
                  ),
                  padding: getPadding(
                    left: 15,
                    top: MediaQuery.of(context).size.height * 0.02,
                    right: 15,
                    bottom: 14,
                  ),
                  decoration: AppDecoration.outlineYellow100b2.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder21,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgGlobe,
                        height: getSize(
                          40.00,
                        ),
                        width: getSize(
                          40.00,
                        ),
                        margin: getMargin(
                          top: MediaQuery.of(context).size.height * 0.015,
                          bottom: 3,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 12,
                          top: MediaQuery.of(context).size.height * 0.015,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Invite your friend and earn",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLoraRomanMedium12.copyWith(
                                height: getVerticalSize(
                                  1.00,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 10,
                              ),
                              child: Text(
                                "10 Blessing",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLoraRomanMedium18.copyWith(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        height: 32,
                        width: 79,
                        text: "Get now",
                        margin: getMargin(
                          left: 10,
                          top: 5,
                          bottom: 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user = FirebaseAuth.instance.currentUser;

  Future<void> createDatabase() async {
    // CollectionReference usersCollection = _firestore.collection("bless");
    // CollectionReference ordersCollection = _firestore.collection("orders");

    // await usersCollection.get().then((querySnapshot) {
    //   if (querySnapshot.docs.isEmpty) {
    //     usersCollection.doc(user!.email).set({
    //       'Total Blessings Earned': 0,
    //       'Blessing Earned Today': 0,
    //       'Blessings in account': 0,
    //       'Typed Ram': 0,
    //       'Typed Ram Today': 0,
    //     });
    //     // usersCollection.doc("user2@email.com").set({
    //     //   "email": "user2@email.com",
    //     //   "name": "User 2",
    //     //   "age": 30,
    //     // });
    //   }
    // });
    await FirebaseFirestore.instance.collection('bless').doc(user!.email).set({
      'Total Blessings Earned': 0,
      'Blessing Earned Today': 0,
      'Blessings in account': 0,
      'Typed Ram': 0,
      'Typed Ram Today': 0,
    });
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createCollectionIfNotExists() async {
    DocumentReference document = firestore.collection("bless").doc(user!.email);
    DocumentSnapshot snapshot = await document.get();

    if (!snapshot.exists) {
      await firestore.collection("bless").doc(user!.email).set({
        'Total Blessings Earned': 0,
        'Blessing Earned Today': 0,
        'Blessings in account': 0,
        'Typed Ram': 0,
        'Typed Ram Today': 0,
      });
    }
  }
  Future<void> createCollectionIfNotExistsBank() async {
    DocumentReference document =
        firestore.collection("Bank Details").doc(user!.email);
    DocumentSnapshot snapshot = await document.get();

    if (!snapshot.exists) {
      await firestore.collection("Bank Details").doc(user!.email).set({
        'Bank Name': "",
        'IFSC Code': "",
        'Account Number': "",
        'PAN Card Number': "",
        'Confirm Details': 0,
      });
    }
  }

  

  void values() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference documentReference =
          firestore.collection("bless").doc(user.email);
      documentReference.get().then((DocumentSnapshot snapshot) {
        int currentValue = (snapshot.data() as Map)['Typed Ram'];
        int trt = (snapshot.data() as Map)['Typed Ram Today'];
        int bet = (snapshot.data() as Map)['Blessing Earned Today'];

        // Add to the current value
        // print(currentValue);
        // Write the updated value back to the Firestore
        setState(() {
          typedram = currentValue;
          typedramtoday = trt;
          blessingsearnedtoday = bet;
        });
      });
      
      
    }
  }

  void verifyUserDeatils() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref = firestore.collection("Users").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        int vd = (snapshot.data() as Map)['Verify Details'];
        setState(() {
          verifyDetails = vd;
        });
      });
    }
  }


}
