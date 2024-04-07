import 'package:get/get.dart';

import 'package:task_of_gtr/Pages/customerList_page.dart';

import '../Pages/login_page.dart';
import 'route_names.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: loginPage, page: () =>  LoginPage()),
  GetPage(name: customerListPage, page: () =>  const CustomerListPage()),
]; 