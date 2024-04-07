import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_gtr/Controller/auth_controller.dart';

import '../widgets/customebtn.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    AssetImage("assets/background_img/design_background.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Welcome Back! ",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurpleAccent.withOpacity(0.5),
                  ),
                  height: height * .4,
                  width: width * .9,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // -- TextField for Email --
                        TextField(
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                          controller: emailController,
                          decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black),
                              contentPadding: EdgeInsets.all(0)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // -- TextField for Password --
                        TextField(
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                          controller: passwordController,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black),
                              contentPadding: EdgeInsets.all(0)),
                        ),
                        const SizedBox(height: 20.0),

                        //-- login Btn section --
                        CustomeBtn(
                            authController: _authController,
                            emailController: emailController,
                            passwordController: passwordController,
                            height: height),

                        // -- Footer Section --
                        const Text("Don't have any account? Registor")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
