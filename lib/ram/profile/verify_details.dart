import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manav_s_application1/core/app_export.dart';
import 'package:manav_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:manav_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:manav_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:manav_s_application1/widgets/custom_button.dart';
import 'package:manav_s_application1/widgets/custom_drop_down.dart';
import 'package:manav_s_application1/widgets/custom_text_form_field.dart';
import 'package:manav_s_application1/widgets/rounded_text_files.dart';
// ignore_for_file: must_be_immutable

class VerifyDetails extends StatefulWidget {
  @override
  State<VerifyDetails> createState() => _VerifyDetailsState();
}

class _VerifyDetailsState extends State<VerifyDetails> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  List<String> dropdownItemList = ["male", "female", "other"];

  TextEditingController genderController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showError = false;
  String _selectedItem = 'Male';
  // String userFullName = "";
  // String userEmail = "";
  // String userPhone = "";
  // String userGender = "";
  // String userDOB = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    values();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    values();
    genderController.dispose();
    dobController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    values();
    return Scaffold(
        backgroundColor: ColorConstant.gray900,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
            height: getVerticalSize(76.00),
            leadingWidth: 29,
            leading: AppbarImage(
                height: getVerticalSize(15.00),
                width: getHorizontalSize(8.00),
                svgPath: ImageConstant.imgArrowleftYellow100,
                margin: getMargin(left: 17, top: 20, bottom: 20),
                onTap: () => onTapArrowleft(context)),
            title: AppbarTitle(
                text: "Verify Deatils",
                margin: getMargin(left: 24, top: 10))),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                  width: size.width * 1.2,
                  padding:
                      getPadding(left: 20, top: 20, right: 20, bottom: 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Please make sure the below information matches your bank account details to process the payments. You will not be able to change this information in future. This information will be securely stored by BhaktiYoga team to process all your future payments.",
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLoraRomanSemiBold16.copyWith(
                              height: getVerticalSize(1.70),
                            ),
                          ),
                        ),
                        // CustomTextFormField(
                        //     width: 345,
                        //     focusNode: FocusNode(),
                        //     controller: fullNameController,
                        //     hintText: "Fullname*"),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: RoundedTextFormField(
                            labelText: "Fullname*",
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
                          ),
                        ),
                        Divider(
                          height:
                              MediaQuery.of(context).size.height * 0.025,
                        ),
                        RoundedTextFormField(
                          labelText: "Email*",
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
                        ),
                        Divider(
                          height:
                              MediaQuery.of(context).size.height * 0.025,
                        ),
                        RoundedTextFormField(
                          labelText: "Phone*",
                          // validator: validator,
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your phone number";
                            } else if (value.length > 10) {
                              return "Please enter a valid phone number";
                            } else {
                              return null;
                            }
                          },
                        ),

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
                              MediaQuery.of(context).size.height * 0.025,
                        ),

                        RoundedTextFormField(
                          icon: Icon(Icons.calendar_month_outlined),
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
                          labelText: "DOB*",
                          controller: dobController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your date of birth";
                            }
                            return null;
                          },
                        ),

                        Container(
                            width: getHorizontalSize(349.00),
                            margin: getMargin(left: 4, top: 39),
                            padding: getPadding(all: 5),
                            decoration: AppDecoration.outlineLime900
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder29),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomButton(
                                      onTap: () {
                                        if (_formKey.currentState
                                                ?.validate() ??
                                            false) {
                                          update();
                                          Navigator.pushNamed(context,
                                              AppRoutes.blessingDetails);
                                        }
                                      },
                                      height: 48,
                                      width: 338,
                                      text: "Next",
                                      variant: ButtonVariant.OutlineLime900,
                                      shape: ButtonShape.CircleBorder24,
                                      padding: ButtonPadding.PaddingAll11,
                                      fontStyle: ButtonFontStyle
                                          .LoraRomanSemiBold18Yellow100)
                                ])),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.pushNamed(context, AppRoutes.signIn);
                        //   },
                        //   child: Padding(
                        //       padding: getPadding(top: 27, bottom: 5),
                        //       child: Text("Already have an account? Login",
                        //           overflow: TextOverflow.ellipsis,
                        //           textAlign: TextAlign.left,
                        //           style: AppStyle.txtLoraRomanSemiBold16
                        //               .copyWith(
                        //                   height: getVerticalSize(1.00)))),
                        // )
                      ])),
            )));
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }

  void values() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref = firestore.collection("Users").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        String fullname = (snapshot.data() as Map)['Fullname'];
        String email = (snapshot.data() as Map)['Email'];
        String phone = (snapshot.data() as Map)['Phone'];
        String gender = (snapshot.data() as Map)['Gender'];
        String dob = (snapshot.data() as Map)['DOB'];

        snapshot.reference.update({
          'Fullname': fullNameController.text,
          'Email': emailController.text,
          'Phone': phoneController.text,
          'Gender': genderController.text,
          'DOB': dobController.text,
        });
        // Add to the current value
        // print(currentValue);
        // Write the updated value back to the Firestore
        setState(() {
          fullNameController.text = fullname;
          emailController.text = email;
          phoneController.text = phone;
          // _selectedItem=gender;
          genderController.text = gender;
          dobController.text = dob;

          // subStringuserFullName = userFullName.substring(0, 1).toUpperCase();

          // typedram=currentValue;
          // typedramtoday=trt;
          // blessingsearnedtoday=bet;
        });
      });
    }
  }

  void update() {
    final firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get the current value
      DocumentReference ref = firestore.collection("Users").doc(user.email);
      ref.get().then((DocumentSnapshot snapshot) {
        snapshot.reference.update({
          'Fullname': fullNameController.text,
          'Email': emailController.text,
          'Phone': phoneController.text,
          'Gender': genderController.text,
          'DOB': dobController.text,
          'Verify Details': 1,
        });
      });
    }
  }
}
