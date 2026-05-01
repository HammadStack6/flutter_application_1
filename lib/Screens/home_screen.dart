import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';
import 'cart_screen.dart';
import 'detail_screen.dart';
import 'orders_screen.dart';
import 'admin_screen.dart';
import 'package:flutter_application_1/data/food_data.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
class HomeScreen extends StatefulWidget {
  final bool isAdmin;

  const HomeScreen({super.key, required this.isAdmin});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Food> foods = foodList;
  String search = "";

  @override
  Widget build(BuildContext context) {
    var filtered = foods
        .where((f) => f.name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Cart',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.receipt_long),
            tooltip: 'Orders',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OrdersScreen()),
              );
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.admin_panel_settings),
          //   tooltip: 'Admin',
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (_) => const AdminScreen()),
          //     );
          //   },
          // ),
          if (widget.isAdmin)
  IconButton(
    icon: const Icon(Icons.admin_panel_settings),
    tooltip: 'Admin',
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AdminScreen()),
      );
    },
  ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() {
                  search = val;
                });
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final food = filtered[i];
                return ListTile(
                  title: Text(food.name),
                  subtitle: Text("\$${food.price}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(food: food),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}