import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    this.labelText,
    this.hintText,
    // required this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.emailAddress,
  });

  String? labelText;
  String? hintText;

  // IconData prefixIcon;
  IconData? suffixIcon;
  bool isPassword = false;
  TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  void Function(String)? onFieldSubmitted;
  TextInputType keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      cursorColor: kPrimaryColor,
      // cursorErrorColor: kPrimaryColor,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      obscureText: widget.isPassword ? showPassword : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: kPrimaryColor.withOpacity(.1),
        contentPadding: EdgeInsets.all(20),
        // prefixIcon: Icon(
        //   widget.prefixIcon,
        //   // color: kPrimaryColor,
        // ),
        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor.withOpacity(.5),
                  ),
                ),
              )
            : const SizedBox(),
        labelText: widget.labelText,
        // labelStyle: TextStyle(  color: kPrimaryColor.withOpacity(.5)),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: kPrimaryColor.withOpacity(.5),
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
      ),
    );
  }
}
