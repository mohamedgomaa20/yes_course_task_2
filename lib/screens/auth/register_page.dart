import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../app_colors/app_colors.dart';

import '../../constants.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController userNameCon = TextEditingController();
  TextEditingController contactNumberCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController passwordConfirmCon = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40),
                  Image.asset(
                    kLogo2,
                    height: 70,
                    color: kPrimaryColor,
                  ),
                  Gap(15),
                  Text(
                    "Sign in up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(15),
                  Text(
                    "if you already have an account register",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Gap(5),
                  Row(
                    children: [
                      Text(
                        "You can",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Gap(10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login here !",
                          style: TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  const Gap(15),
                  CustomTextFormField(
                    hintText: "Enter Email",
                    // prefixIcon: Icons.email_outlined,
                    controller: emailCon,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email.';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                  const Gap(18),
                  CustomTextFormField(
                    hintText: "Create User name",
                    controller: userNameCon,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your user name.';
                      }
                      return null;
                    },
                  ),
                  const Gap(18),
                  CustomTextFormField(
                    hintText: "Contact number",
                    controller: contactNumberCon,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your user name.';
                      }
                      return null;
                    },
                  ),
                  Gap(18),
                  CustomTextFormField(
                    hintText: "Password",
                    controller: passwordCon,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      }
                      return null;
                    },
                  ),
                  Gap(18),
                  CustomTextFormField(
                    hintText: "Confirm Password",
                    controller: passwordConfirmCon,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      }else if(passwordCon.text!=passwordConfirmCon.text){
                        return 'Please enter correct password.';
                      }
                      return null;
                    },
                  ),
                  Gap(15),
                  CustomElevatedButtom(
                    text: "Login",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                      }
                    },
                  ),
                  Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  Gap(35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage("assets/Facebook-Logo.png"),
                          height: 35),
                      Gap(23),
                      Image(
                          image: AssetImage("assets/apple_logo.png"),
                          height: 35),
                      Gap(20),
                      Image(image: AssetImage("assets/google.png"), height: 35),
                    ],
                  ),
                  Gap(55),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
