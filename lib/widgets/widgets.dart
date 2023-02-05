// ignore_for_file: deprecated_member_use

import 'package:canfes/main.dart';
import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String text,
  IconData icon,
  Color backgroundColor,
  Color color,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: backgroundColor,
    content: SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 17, color: color),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: color,
                ))
          ],
        ),
      ),
    ),
  ));
}


//"Sending otp to ${countryCode!.dialCode}-${phoneController.text.trim()}"