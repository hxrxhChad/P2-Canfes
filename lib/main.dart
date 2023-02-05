// ignore: duplicate_ignore
// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, duplicate_ignore
// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, unnecessary_string_escapes, sized_box_for_whitespace, unused_element, avoid_web_libraries_in_flutter, must_be_immutable, override_on_non_overriding_member, unnecessary_import
// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:canfes/auth/auth-core.dart';
import 'package:canfes/auth/otp-page.dart';
import 'package:canfes/auth/phone-auth.dart';
import 'package:canfes/pages/chat-page.dart';
import 'package:canfes/pages/dash-page.dart';
import 'package:canfes/provider/auth-provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

const primaryColor = Color.fromARGB(255, 25, 25, 26);
const secondaryColor = Color.fromARGB(255, 77, 77, 79);
const bodyTextColor = Color.fromARGB(255, 33, 33, 34);
const bgColor = Color.fromARGB(255, 207, 207, 211);

const defaultPadding = 20.0;
const defaultDuration = Duration(seconds: 1);

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black)
              .copyWith(
                bodyText1: TextStyle(color: bodyTextColor),
                bodyText2: TextStyle(color: bodyTextColor),
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: AuthCore(),
        routes: {
          '/chat': (context) => ChatPage(),
          '/dash': (context) => DashPage(),
          '/auth': (context) => PhoneAuth(),
          '/otp': (context) => OtpPage(
                verificationId: '',
              )
        },
      ),
    );
  }
}
