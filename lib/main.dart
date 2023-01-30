// ignore: duplicate_ignore
// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore
// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, unnecessary_string_escapes, sized_box_for_whitespace, unused_element, avoid_web_libraries_in_flutter, must_be_immutable, override_on_non_overriding_member, unnecessary_import
// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:canfes/chat-ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromARGB(255, 25, 25, 26);
const secondaryColor = Color.fromARGB(255, 77, 77, 79);
const bodyTextColor = Color.fromARGB(255, 33, 33, 34);
const bgColor = Color.fromARGB(255, 207, 207, 211);

const defaultPadding = 20.0;
const defaultDuration = Duration(seconds: 1);

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black)
            .copyWith(
              bodyText1: TextStyle(color: bodyTextColor),
              bodyText2: TextStyle(color: bodyTextColor),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: AppHome(),
      routes: {
        '/chat': (context) => ChatUi(),
        '/apphome': (context) => AppHome(),
      },
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: defaultPadding / 3,
            ),
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: defaultPadding * 2,
                    // ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/icons8-telegram-app.svg"),
                        Text(
                          "canfes",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 23),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black38)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                            "assets/svg/three-dots-line-svgrepo-com.svg",
                            height: 20,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2),
                      child: Divider(
                        color: secondaryColor.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      height: defaultPadding * 2,
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2.5),
                      child: Text("Status",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2),
                      child: Divider(
                        color: secondaryColor.withOpacity(0.5),
                      ),
                    ),
                    Container(
                        height: defaultPadding * 6,
                        padding: EdgeInsets.only(
                            top: defaultPadding / 2.5,
                            bottom: defaultPadding / 2.5),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                7,
                                (index) => Padding(
                                      padding:
                                          EdgeInsets.only(left: defaultPadding),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: (() {}),
                                            child: CircleAvatar(
                                              radius: 38,
                                              backgroundImage: AssetImage(
                                                  "assets/image/boy.jpg"),
                                            ),
                                          ),
                                          SizedBox(
                                            height: defaultPadding / 2,
                                          ),
                                          Text(
                                            "Adam",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(),
                                          )
                                        ],
                                      ),
                                    )),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2),
                      child: Divider(
                        color: secondaryColor.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      height: defaultPadding * 2,
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2.5),
                      child: Text("Messages",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                          textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2),
                      child: Divider(
                        color: secondaryColor.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: List.generate(
                            8,
                            (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(context, '/chat');
                                    });
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: defaultPadding),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onLongPress: () {},
                                                      child: CircleAvatar(
                                                        radius: 30,
                                                        backgroundImage: AssetImage(
                                                            "assets/image/spong.jfif"),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: defaultPadding / 2,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Lalu Yadav",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2!
                                                                  .copyWith(),
                                                        ),
                                                        Text(
                                                          "Hi!, how are you....",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .subtitle2!
                                                              .copyWith(
                                                                  color: Colors
                                                                      .black45),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 2),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 3,
                                                              horizontal: 4),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          color:
                                                              Colors.black45),
                                                      child: Text(
                                                        "26",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2!
                                                            .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          defaultPadding / 6,
                                                    ),
                                                    Text(
                                                      "1:05 pm",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 11),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: defaultPadding / 2),
                                          child: Divider(
                                            color:
                                                secondaryColor.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
