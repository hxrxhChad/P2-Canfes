// ignore_for_file: file_names, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace, unnecessary_string_interpolations, must_be_immutable, unused_local_variable, unnecessary_brace_in_string_interps

import "dart:ui";

import "package:antdesign_icons/antdesign_icons.dart";
import "package:canfes/auth/otp-page.dart";
import "package:canfes/main.dart";
import "package:canfes/provider/auth-provider.dart";
import "package:country_picker/country_picker.dart";
import "package:fl_country_code_picker/fl_country_code_picker.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:provider/provider.dart";

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  // final countryPicker = const FlCountryCodePicker();
  late FlCountryCodePicker countryPicker;
  final TextEditingController phoneController = TextEditingController();
  CountryCode? countryCode;

  @override
  void initState() {
    final favouriteCountries = ["IN"];
    countryPicker = FlCountryCodePicker(
      favorites: favouriteCountries,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
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
          Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 2, horizontal: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/Nature.svg",
                      height: 400,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter your phone",
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
                          "You will receive a 6-digit code for phone number verification",
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
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.12,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultPadding),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                child: countryCode != null
                                                    ? countryCode!.flagImage
                                                    : null),
                                            SizedBox(
                                              width: defaultPadding,
                                            ),
                                            Text(
                                              countryCode?.name ??
                                                  "Select a country",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            AntIcons.downOutlined,
                                            color: Colors.black87,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            final code = await countryPicker
                                                .showPicker(context: context);
                                            setState(() {
                                              countryCode = code;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black54,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultPadding),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          countryCode?.dialCode ?? "+1",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                  fontSize: 20,
                                                  color: Colors.black87),
                                          textAlign: TextAlign.center,
                                        ),
                                        VerticalDivider(
                                          color: Colors.black54,
                                        ),
                                        SizedBox(
                                          width: defaultPadding / 2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4.0),
                                          child: SizedBox(
                                            width: 200,
                                            child: TextFormField(
                                              controller: phoneController,
                                              onChanged: (value) {
                                                setState(() {
                                                  phoneController.text = value;
                                                });
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      color: Colors.black87),
                                              showCursor: false,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixIcon: phoneController
                                                              .text.length >
                                                          9
                                                      ? Icon(
                                                          Icons.done,
                                                          color: Colors.green,
                                                        )
                                                      : null),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: GestureDetector(
                            onTap: () {
                              if (countryCode != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: SizedBox(
                                      height: 40,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: defaultPadding),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Sending otp to ${countryCode!.dialCode}-${phoneController.text.trim()}",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      fontSize: 17,
                                                      color: Colors.black87),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  AntIcons.checkCircleFilled,
                                                  color: Colors.black54,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtpPage(
                                              verificationId: '',
                                            )));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.red.shade500,
                                        content: SizedBox(
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: defaultPadding),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Please enter a phone number",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          fontSize: 17,
                                                          color: Colors.white),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      AntIcons
                                                          .closeCircleFilled,
                                                      color: Colors.white,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        )));
                              }
                            },
                            child: GestureDetector(
                              onTap: () => sendPhoneNumber(),
                              child: Card(
                                color: Colors.white.withOpacity(0.96),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Continue ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color:
                                                  Colors.black.withOpacity(0.7),
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
                        ),
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

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "${countryCode!.dialCode}$phoneNumber");
  }
}
