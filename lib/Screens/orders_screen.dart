import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/order_data.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),

      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (_, i) {
          final order = orderList[i];

          return ListTile(
            title: Text(order.itemName),
            subtitle: Text(formatDate(order.date)),
          );
        },
      ),
    );
  }
}