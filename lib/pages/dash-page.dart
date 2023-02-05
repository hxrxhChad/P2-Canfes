// ignore: duplicate_ignore
// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore, file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, unnecessary_string_escapes, sized_box_for_whitespace, unused_element, avoid_web_libraries_in_flutter, must_be_immutable, override_on_non_overriding_member, unnecessary_import
// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:canfes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashPage extends StatelessWidget {
  const DashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Material(
        shape: CircleBorder(),
        elevation: 5,
        shadowColor: Colors.black54,
        child: CircleAvatar(
          radius: 45,
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            "assets/svg/add (1).svg",
            height: 50,
            color: Colors.black38,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                  top: defaultPadding * 3),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.14 / 2,
                    width: MediaQuery.of(context).size.width * 0.70,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Row(
                        children: [
                          Icon(
                            AntIcons.searchOutlined,
                            color: Colors.black38,
                            size: 20,
                          ),
                          SizedBox(
                            width: defaultPadding / 2,
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(
                                cursorColor: Colors.black38,
                                decoration: InputDecoration(
                                    hintText: "Search",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            color: Colors.black45,
                                            fontSize: 20),
                                    border: InputBorder.none)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.14 / 2,
                    width: MediaQuery.of(context).size.height * 0.14 / 2,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      icon: Icon(
                        AntIcons.filterOutlined,
                        color: Colors.black38,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    9,
                    (index) => Column(
                          children: [
                            SizedBox(
                              height: defaultPadding,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/chat');
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(15)),
                                padding: EdgeInsets.all(defaultPadding),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 30,
                                        ),
                                        SizedBox(
                                          width: defaultPadding,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sebesstian Rodges',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 17),
                                            ),
                                            Text(
                                              "Hi, there!",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: Colors.black38),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "09:34 PM",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: Colors.black38),
                                        ),
                                        SizedBox(
                                          height: defaultPadding,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: DashNavBar(),
    );
  }
}

class DashNavBar extends StatelessWidget {
  const DashNavBar({
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
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                AntIcons.globalOutlined,
                color: Colors.black38,
                size: 35,
              ),
            ),
            IconButton(
              icon: Icon(
                AntIcons.messageOutlined,
                color: Colors.black38,
                size: 35,
              ),
              onPressed: () {},
            ),
            SizedBox(width: defaultPadding / 40),
            IconButton(
              onPressed: () {},
              icon: Icon(
                AntIcons.phoneOutlined,
                color: Colors.black38,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                AntIcons.settingOutlined,
                color: Colors.black38,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
