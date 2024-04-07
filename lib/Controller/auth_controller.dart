import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_of_gtr/Models/auth_model.dart';
import '../Pages/customerList_page.dart';

class AuthController extends GetxController {
  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Requird Field Empty", "Email or Password field is empty");
    } else if (!email.endsWith("@gmail.com")) {
      Get.snackbar("Invalid Email", "Email address is invalid");
    } else {
      final response = await http.get(Uri.parse(
          "https://www.pqstec.com/InvoiceApps/Values/LogIn?UserName=$email&Password=$password&ComId=1"));
      final Map<String, dynamic> responseData = json.decode(response.body);
      AuthModel authModel = AuthModel.fromJson(responseData);
      if (authModel.email == "admin@gmail.com") {
        // Handle successful login
        // Navigate to CustomerListPage or any other page
        print("it is from auth controller ${authModel.token}");
        Get.offAll(CustomerListPage(
          token: authModel.token,
        ));
      } else {
        // Showing error message
        Get.snackbar("Error", "Wrong Email or Password");
      }
    }
  }
}
