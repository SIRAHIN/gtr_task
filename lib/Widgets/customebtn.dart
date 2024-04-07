import 'package:flutter/material.dart';

import '../Controller/auth_controller.dart';

class CustomeBtn extends StatelessWidget {
  const CustomeBtn({
    super.key,
    required AuthController authController,
    required this.emailController,
    required this.passwordController,
    required this.height,
  }) : _authController = authController;

  final AuthController _authController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return _authController.login(
            emailController.text.trim(), passwordController.text.trim());
      },
      child: Container(
        height: height * .06,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
