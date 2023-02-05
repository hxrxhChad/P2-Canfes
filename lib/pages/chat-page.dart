// ignore: duplicate_ignore
// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore, file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, unnecessary_string_escapes, sized_box_for_whitespace, unused_element, avoid_web_libraries_in_flutter, must_be_immutable, override_on_non_overriding_member, unnecessary_import
// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:canfes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ChatAppBar(),
          ),
          Expanded(
              flex: 5,
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.only(
                    // left: defaultPadding,
                    right: defaultPadding * 3,
                    top: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: Container(
                          constraints:
                              BoxConstraints(minHeight: 60, maxWidth: 300),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 111, 111, 213)
                                .withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding * 2),
                            child: Text(
                              "Hi",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 17, color: Colors.white),
                            ),
                          )),
                    ),
                    Container(
                        constraints:
                            BoxConstraints(minHeight: 60, maxWidth: 300),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 111, 111, 213)
                              .withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Text(
                            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontSize: 17, color: Colors.white),
                          ),
                        ))
                  ],
                ),
              )))
        ],
      ),
      bottomNavigationBar: ChatNavBar(),
    );
  }
}

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: defaultPadding * 2.7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/dash');
                      },
                      child: SvgPicture.asset(
                        "assets/svg/back.svg",
                        height: 28,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 25,
                    ),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sebesstian Rodges',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 17),
                        ),
                        Text(
                          "online",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.green),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/video-call.svg",
                      height: 28,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      width: defaultPadding / 2,
                    ),
                    SvgPicture.asset(
                      "assets/svg/call.svg",
                      height: 28,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatNavBar extends StatelessWidget {
  const ChatNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.14 / 1.8,
        width: MediaQuery.of(context).size.width * 0.84,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.06),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  cursorColor: Colors.black45,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 17),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your message...",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.black38, fontSize: 17)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * 0.7),
                    child: VerticalDivider(
                      color: Colors.black45,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/svg/send.svg",
                      color: Colors.black54,
                      height: 30,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
