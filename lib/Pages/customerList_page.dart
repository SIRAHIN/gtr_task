import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_gtr/Controller/customer_details_controller.dart';

import '../Widgets/infoText.dart';

class CustomerListPage extends StatefulWidget {
  final String? token;

  const CustomerListPage({super.key, this.token});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final _controller = Get.put(CustomerDetailsController());

  late ScrollController _scrollController;

  int _pageNo = 1;
  bool _isLoading = false;
  bool _isLoadingInitial = false;

  @override
  void initState() {
  // -- infinite scroll pagination for new customer list -- //
    _fetchCustomers(isLoadingInitial: true, pageNo: _pageNo);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _fetchCustomers(isLoadingInitial: false, pageNo: _pageNo);
      }
    });
    super.initState();
  }

  Future<void> _fetchCustomers(
      {required bool isLoadingInitial, required int pageNo}) async {
    if (isLoadingInitial) {
      setState(() {
        _isLoadingInitial = true;
      });
    } else {
      setState(() {
        _isLoading = true;
      });
    }

    await _controller.fetchCustomers(widget.token, pageNo: pageNo);

    setState(() {
      _pageNo = _pageNo + 1;
      _isLoading = false;
      _isLoadingInitial = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Customer Info List"),
      ),
      body: _isLoadingInitial
          ? const Center(child: CircularProgressIndicator())
          : Obx(() => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: _controller.customers.length,
                      itemBuilder: (context, index) {
                        final customer = _controller.customers[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black)),
                            child: ListTile(
                              isThreeLine: true,
                              textColor: Colors.black,
                              // -- Customer Image -- //
                              leading: CircleAvatar(
                                backgroundImage: customer.imagePath != null
                                    ? NetworkImage(
                                        "https://www.pqstec.com/InvoiceApps/${customer.imagePath}")
                                    : const NetworkImage(
                                        "https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061132_1280.png"),
                              ),
                              //-- Customer Name Section --
                              title: Text(
                                '${customer.name}',
                                style: TextStyle(fontSize: 22),
                              ),
                              //-- customer Details Information Section --
                              subtitle: InfoText(customer: customer),
                              onTap: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : const SizedBox.shrink(),
                ],
              )),
    );
  }
}
