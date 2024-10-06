import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class CustomElevatedButtom extends StatelessWidget {
  CustomElevatedButtom({required this.text, this.onPressed});

  String text;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                padding: EdgeInsets.all(18),
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text ,
                style: TextStyle(color: kWhiteColor,fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
