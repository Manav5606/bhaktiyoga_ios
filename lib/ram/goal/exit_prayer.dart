import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:manav_s_application1/core/app_export.dart';
import 'package:manav_s_application1/ram/goal/write.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:volume_control/volume_control.dart';

// ignore_for_file: must_be_immutable
class ExitPrayer extends StatefulWidget {
  @override
  State<ExitPrayer> createState() => _ExitPrayerState();
}

class _ExitPrayerState extends State<ExitPrayer> {
  @override
  Widget build(BuildContext context) {  
    return Container(
      // width: 1000,
      padding: getPadding(
        left: 10,
        top: 23,
        right: 10,
        bottom: 23,
      ),
      decoration: AppDecoration.outlineYellow100b21.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder21,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: getHorizontalSize(
              284.00,
            ),
            margin: getMargin(
              top: 5,
            ),
            child: Text(
              "Do you want to end this prayer ? ",
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtLoraRomanSemiBold24,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 44,
              right: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                 Padding(
                   padding: const EdgeInsets.only(left:10.0),
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
                        26,
                      ),
                      topRight: Radius.circular(
                        26,
                      ),
                      bottomLeft: Radius.circular(
                        26,
                      ),
                      bottomRight: Radius.circular(
                        26,
                      ),
                    ),
                    child: Container(
                      width: getHorizontalSize(110),
                      padding: getPadding(
                        all: 3,
                      ),
                      decoration: AppDecoration.outline.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder21,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: getVerticalSize(35),
                            width: getHorizontalSize(
                              120.00,
                            ),
                            padding: getPadding(
                              left: 5,
                              top: 2,
                              right: 5,
                              bottom: 4,
                            ),
                            decoration: AppDecoration.fillYellow100.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder21,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 4,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Back to typing",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtLoraRomanSemiBold1284.copyWith(fontSize: 13),
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
                 ),
               
                 Padding(
                   padding: const EdgeInsets.only(right:12.0),
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
                        26,
                      ),
                      topRight: Radius.circular(
                        26,
                      ),
                      bottomLeft: Radius.circular(
                        26,
                      ),
                      bottomRight: Radius.circular(
                        26,
                      ),
                    ),
                    child: Container(
                      padding: getPadding(
                        all: 5,
                      ),
                      decoration: AppDecoration.outline.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder21,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: getHorizontalSize(
                              80.00,
                            ),
                            padding: getPadding(
                              left: 18,
                              top: 4,
                              right: 18,
                              bottom: 7,
                            ),
                            decoration: AppDecoration.fillLime900.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder21,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 4,
                                  ),
                                  child: GestureDetector(
                                    onTap: () async{
                                      // VolumeControl.setVolume(0.0);
                                      // Navigator.of(context).popUntil(ModalRoute.withName('/'));
                                      await AudioService().stop();
                                      await Future.delayed(Duration(milliseconds: 100));
                                      Navigator.of(context).pushNamed(AppRoutes.homeScreen);
                                    },
                                    child: Text(
                                      "Yes",
                                      // overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtLoraRomanSemiBold18,
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
                 ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
