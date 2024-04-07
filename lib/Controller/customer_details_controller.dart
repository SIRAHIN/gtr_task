import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:task_of_gtr/Models/customer_data_model.dart';

class CustomerDetailsController extends GetxController {
  RxList<CustomerList> customers = <CustomerList>[].obs;
  final _isLoading = false.obs;

  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  Future<void> fetchCustomers(String? token, {required int pageNo}) async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://www.pqstec.com/InvoiceApps/Values/GetCustomerList?searchquery&pageNo=$pageNo&pageSize=20&SortyBy=Balance",
        ),
        headers: {
          'Authorization': "Bearer $token", // Include  token here
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseData = json.decode(response.body);

        List data = responseData["CustomerList"];

        customers.addAll(data.map((e) => CustomerList.fromJson(e)).toList());

        log("data length : ${data.length}");
      } else {
        // Show error message
        Get.snackbar("Error", "Failed to fetch customers");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
