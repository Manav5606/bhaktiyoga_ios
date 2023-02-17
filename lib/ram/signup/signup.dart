import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:manav_s_application1/core/app_export.dart';
import 'package:manav_s_application1/ram/splash/home_splash.dart';
import 'package:manav_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:manav_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:manav_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:manav_s_application1/widgets/custom_button.dart';
import 'package:manav_s_application1/widgets/custom_drop_down.dart';
import 'package:manav_s_application1/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/rounded_text_files.dart';
import '../login/login.dart';

// ignore_for_file: must_be_immutable

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  List<String> dropdownItemList = ["male", "female", "other"];

  TextEditingController phoneController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showError = false;
  bool _isEmailValid = false;
  String? _email;
  String _selectedItem = 'Male';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeSplash()));
        FocusScope.of(context).unfocus();
        return false;
      },
      child: Scaffold(
          backgroundColor: ColorConstant.gray900,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
              height: getVerticalSize(96.00),
              leadingWidth: 29,
              leading: AppbarImage(
                  height: getVerticalSize(55.00),
                  width: getHorizontalSize(20.00),
                  svgPath: ImageConstant.imgArrowleftYellow100,
                  margin: getMargin(left: 21, top: 57, bottom: 23),
                  onTap: () => onTapArrowleft(context)),
              title: AppbarTitle(
                  text: "Create Account",
                  margin: getMargin(left: 24, top: 38))),
          body: Form(
              key: _formKey,
              child: Container(
                  width: size.width * 1.2,
                  height: size.height * 1.2,
                  padding:
                      getPadding(left: 20, top: 0, right: 20, bottom: 30),
                  child: SingleChildScrollView(
                    // keyboardDismissBehavior: K,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: TextFormField(
                              // labelText: "Fullname*",
                              // validator: validator,
                              controller: fullNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    _showError = true;
                                  });
                                  return 'Please enter some text';
                                }
                                setState(() {
                                  _showError = false;
                                });
                                return null;

                                // return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Full Name*",
                                labelStyle: TextStyle(
                                  color: ColorConstant.red200,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: _isEmailValid
                                        ? ColorConstant.red200
                                        : Colors.red,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35.0),
                                  borderSide: BorderSide(
                                    color: ColorConstant.red200,
                                    // width: 2.0,
                                  ),
                                ),
                              ),
                              style: TextStyle(color: ColorConstant.red200),
                            ),
                          ),
                          Divider(
                            height:
                                MediaQuery.of(context).size.height * 0.020,
                          ),
                          TextFormField(
                            // : "Email*",
                            // validator: validator,
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              } else if (!value.contains("@")) {
                                return "Please enter a valid email";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              _email = value;
                              _isEmailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(_email!);
                            },
                            decoration: InputDecoration(
                              labelText: "Email*",
                              labelStyle: TextStyle(
                                color: ColorConstant.red200,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? ColorConstant.red200
                                      : Colors.red,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: ColorConstant.red200,
                                  // width: 2.0,
                                ),
                              ),
                            ),
                            style: TextStyle(color: ColorConstant.red200),
                          ),
                          Divider(
                            height:
                                MediaQuery.of(context).size.height * 0.020,
                          ),
                          TextFormField(
                            // labelText: "Phone*",
                            // validator: validator,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your phone number";
                              } else if (value.length != 10) {
                                return "Please enter a valid phone number of 10 digits";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Phone*",
                              labelStyle: TextStyle(
                                color: ColorConstant.red200,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? ColorConstant.red200
                                      : Colors.red,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: ColorConstant.red200,
                                  // width: 2.0,
                                ),
                              ),
                            ),
                            style: TextStyle(color: ColorConstant.red200),
                          ),
                          // CustomDropDown(
                          //     width: 345,
                          //     focusNode: FocusNode(),
                          //     icon: Container(
                          //         margin: getMargin(left: 50, right: 17),
                          //         child: CustomImageView(
                          //             svgPath: ImageConstant.imgArrowdown)),
                          //     hintText: "Gender*",
                          //     margin: getMargin(top: 24),
                          //     items: dropdownItemList,
                          //     onChanged: (value) {
                          //       genderController.text = value;
                          //       if (genderController.text.isEmpty) {
                          //         return "Please select the gender";
                          //       }
                          //     }

                          //     ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Container(
                              width: size.width * 1.2,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                border:
                                    Border.all(color: ColorConstant.red200),
                                // color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 15.0,top: 2),
                                child: DropdownButtonFormField<String>(
                                  
                                  decoration: InputDecoration(border: InputBorder.none),
                                  // underline: Container(height: 0.0),
                                  value: _selectedItem,
                                  items: <String>['Male', 'Female', 'Other']
                                      .map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(
                                        value,
                                        style: TextStyle(
                                            color: ColorConstant.red200),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedItem = newValue!;
                                      genderController.text = _selectedItem;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please select a gender';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height:
                                MediaQuery.of(context).size.height * 0.020,
                          ),
                          TextFormField(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(200),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  dobController.text =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate)
                                          .toString();
                                });
                              }
                            },
                            // labelText: "DOB*",
                            controller: dobController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your date of birth";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon:
                                  Icon(Icons.calendar_month_outlined),
                              labelText: "DOB*",
                              labelStyle: TextStyle(
                                color: ColorConstant.red200,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? ColorConstant.red200
                                      : Colors.red,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: ColorConstant.red200,
                                  // width: 2.0,
                                ),
                              ),
                            ),
                            style: TextStyle(color: ColorConstant.red200),
                          ),
                          Divider(
                            height:
                                MediaQuery.of(context).size.height * 0.020,
                          ),
                          TextFormField(
                            // labelText: "Password*",
                            // validator: validator,
                            controller: passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Password*",
                              labelStyle: TextStyle(
                                color: ColorConstant.red200,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? ColorConstant.red200
                                      : Colors.red,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: ColorConstant.red200,
                                  // width: 2.0,
                                ),
                              ),
                            ),
                            style: TextStyle(color: ColorConstant.red200),
                          ),
                          Divider(
                            height:
                                MediaQuery.of(context).size.height * 0.020,
                          ),
                          TextFormField(
                            // validator: validator,
                            controller: passwordConfirmController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please confirm your password";
                              } else if (value != passwordController.text) {
                                return "Passwords do not match";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Confirm password*",
                              labelStyle: TextStyle(
                                color: ColorConstant.red200,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? ColorConstant.red200
                                      : Colors.red,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide: BorderSide(
                                  color: ColorConstant.red200,
                                  // width: 2.0,
                                ),
                              ),
                            ),
                            style: TextStyle(color: ColorConstant.red200),
                          ),
                          Container(
                              width: getHorizontalSize(349.00),
                              margin: getMargin(left: 4, top: 19),
                              padding: getPadding(all: 5),
                              decoration: AppDecoration.outlineLime900
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder29),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    CustomButton(
                                        onTap: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            registerUser();
                                          }
                                          // blessingsDetails();
                                        },
                                        height: 48,
                                        width: 338,
                                        text: "Create Account",
                                        variant:
                                            ButtonVariant.OutlineLime900,
                                        shape: ButtonShape.CircleBorder24,
                                        padding: ButtonPadding.PaddingAll11,
                                        fontStyle: ButtonFontStyle
                                            .LoraRomanSemiBold18Yellow100)
                                  ])),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.signIn);
                            },
                            child: Padding(
                                padding: getPadding(top: 17, bottom: 5),
                                child: Text(
                                    "Already have an account? Login",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLoraRomanSemiBold16
                                        .copyWith(
                                            height:
                                                getVerticalSize(1.00)))),
                          )
                        ]),
                  )))),
    );
  }

  onTapArrowleft(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeSplash()));
    FocusScope.of(context).unfocus();
  }

  Future registerUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await FirebaseAuth.instance.currentUser;

    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((signedInUser) => {
                FirebaseFirestore.instance
                    .collection("Users")
                    .doc(signedInUser.user!.email)
                    .set({
                  'Fullname': fullNameController.text,
                  'Email': emailController.text,
                  'Phone': phoneController.text,
                  'Gender': 'Male',
                  'DOB': dobController.text,
                  'Passowrd': passwordController.text,
                  'Verify Details': 0,
                  'Withdraw': 0,
                }).then((signedInUser) => {
                          // FirebaseFirestore.instance.collection("Blessings").doc(user!.email).set({
                          // 'Total Blessings Earned':0,
                          // 'Blessings Earned today':0,
                          // 'Blessings in account':0,
                          // 'Typed Ram':0,
                          // 'Typed Ram Today':0,
                          // }),
                          print("Success"),
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn())),
                          Fluttertoast.showToast(msg: "Success")
                        })
              });
    } catch (e) {
      print(e);
    }
  }

// Future blessingsDetails()async{
//   FirebaseAuth auth = FirebaseAuth.instance;
//   User? user = await FirebaseAuth.instance.currentUser;

//   try {
//     // await auth.createUserWithEmailAndPassword(email: emailController.text, password: phoneController.text).then((signedInUser) => {
//       FirebaseFirestore.instance.collection("Blessings").doc(user!.email).set({
//         'Total Blessings Earned':0,
//         'Blessings Earned today':0,
//         'Blessings in account':0,
//         'Typed Ram':0,
//         'Typed Ram Today':0,

//       }).then((signedInUser) => {
//         print("hello"),
//         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn())),
//        Fluttertoast.showToast(msg: "hello")
//       });
//     // });
//   } catch (e) {
//     print(e);
//   }
// }

}
