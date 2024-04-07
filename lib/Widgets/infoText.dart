import 'package:flutter/widgets.dart';

import '../Models/customer_data_model.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.customer,
  });

  final CustomerList customer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9.0),
      child: Text(
        "Phone Number - ${customer.phone ?? 'unknown'} \nEmail - ${customer.email ?? 'unknown'} \nPrimaryAddress - ${customer.primaryAddress ?? 'unknown'} \nSecoundaryAddress - ${customer.secoundaryAddress ?? 'unknown'}  \nNotes - ${customer.notes ?? 'unknown'} \nPhone - ${customer.phone ?? 'unknown'}   \nLast Transaction - ${customer.lastTransactionDate ?? 'unknown'} ",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
