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
        "Phone Number - ${customer.phone ?? '-!-'} \nEmail - ${customer.email ?? '-!-'} \nPrimaryAddress - ${customer.primaryAddress ?? '-!-'} \nSecoundaryAddress - ${customer.secoundaryAddress ?? '-!-'}  \nNotes - ${customer.notes ?? '-!-'} \nPhone - ${customer.phone ?? '-!-'}   \nLast Transaction - ${customer.lastTransactionDate ?? '-!-'} ",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
