// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
// ignore_for_file: file_names, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace, unnecessary_string_interpolations, must_be_immutable

import "dart:ui";

import "package:antdesign_icons/antdesign_icons.dart";
import "package:canfes/pages/dash-page.dart";
import "package:canfes/provider/auth-provider.dart";
import "package:canfes/widgets/widgets.dart";
import "package:country_picker/country_picker.dart";
import "package:fl_country_code_picker/fl_country_code_picker.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "package:canfes/auth/phone-auth.dart";
import "package:canfes/main.dart";
import "package:pinput/pin_put/pin_put.dart";
import "package:provider/provider.dart";

class OtpPage extends StatefulWidget {
  final String verificationId;
  const OtpPage({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Image.asset(
                "assets/image/neon.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 2,
                          horizontal: defaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/tree.svg",
                            height: 400,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Verify Otp",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Colors.white),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Text(
                                "Otp was sent to your number",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontSize: 16,
                                        color: Colors.white.withOpacity(0.95)),
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              PinPut(
                                onSubmit: (value) {
                                  setState(() {
                                    otpCode = value;
                                  });
                                },
                                fieldsCount: 6,
                                withCursor: true,
                                eachFieldWidth: 50,
                                eachFieldHeight: 50,
                                followingFieldDecoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.93),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                disabledDecoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.93),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                submittedFieldDecoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.93),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                selectedFieldDecoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.93),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: Colors.black87, fontSize: 20),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: GestureDetector(
                                  onTap: () {
                                    if (otpCode != null) {
                                      verifyOtp(context, otpCode!);
                                    } else {
                                      showSnackBar(
                                          context,
                                          "Enter 6 digit otp code",
                                          AntIcons.closeCircleFilled,
                                          Colors.red.shade500,
                                          Colors.white);
                                    }
                                  },
                                  child: Card(
                                    color: Colors.white.withOpacity(0.96),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Verify ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          AntIcons.arrowRightOutlined,
                                          color: Colors.black.withOpacity(0.8),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "Didn't recieve the code?  ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            color: Colors.white, fontSize: 17)),
                                TextSpan(
                                    text: "Request Again",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            color: Colors.white,
                                            fontSize: 17,
                                            decoration:
                                                TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PhoneAuth()));
                                      })
                              ])),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

//
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DashPage()),
                  (route) => false);
            }
          });
        });
  }
}
