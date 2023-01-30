// ignore: duplicate_ignore
// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore, file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, unnecessary_string_escapes, sized_box_for_whitespace, unused_element, avoid_web_libraries_in_flutter, must_be_immutable, override_on_non_overriding_member, unnecessary_import
// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:canfes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatUi extends StatelessWidget {
  const ChatUi({super.key});

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
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/back-svgrepo-com.svg",
                      height: 25,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/image/spong.jfif"),
                        ),
                        SizedBox(
                          width: defaultPadding / 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lalu Yadav",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Active 1 hour ago",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black45),
                            )
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                        "assets/svg/three-dots-line-svgrepo-com.svg",
                        height: 20),
                  ],
                )),
          )
        ])));
  }
}
