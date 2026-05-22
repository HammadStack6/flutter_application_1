
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'detail_screen.dart';
import 'orders_screen.dart';
import 'admin_screen.dart';

import 'package:flutter_application_1/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  final bool isAdmin;

  const HomeScreen({
    super.key,
    required this.isAdmin,
  });

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  List foods = [];

  String search = "";

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFoods();
  }

  void fetchFoods() async {

    final data =
        await ApiService.getFoods();

    setState(() {
      foods = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    var filtered = foods.where(
      (f) => f['name']
          .toLowerCase()
          .contains(
            search.toLowerCase(),
          ),
    ).toList();

    return Scaffold(

      appBar: AppBar(
        title: const Text("Menu"),

        actions: [

          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const CartScreen(),
                ),
              );
            },
          ),

          IconButton(
            icon: const Icon(
              Icons.receipt_long,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const OrdersScreen(),
                ),
              );
            },
          ),

          if (widget.isAdmin)
            IconButton(
              icon: const Icon(
                Icons.admin_panel_settings,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const AdminScreen(),
                  ),
                );
              },
            ),
        ],
      ),

      body: Column(
        children: [

          Padding(
            padding:
                const EdgeInsets.all(10),

            child: TextField(
              decoration:
                  const InputDecoration(
                hintText: "Search...",
                border:
                    OutlineInputBorder(),
              ),

              onChanged: (val) {
                setState(() {
                  search = val;
                });
              },
            ),
          ),

          isLoading
              ? const Expanded(
                  child: Center(
                    child:
                        CircularProgressIndicator(),
                  ),
                )

              : Expanded(
                  child:
                      ListView.builder(
                    itemCount:
                        filtered.length,

                    itemBuilder: (_, i) {

                      final food =
                          filtered[i];

                      return Card(

                        margin:
                            const EdgeInsets.all(
                                10),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  15),
                        ),

                        elevation: 5,

                        child: ListTile(

                          leading:
                              ClipRRect(
                            borderRadius:
                                BorderRadius.circular(
                                    10),

                            child:
                                Image.network(
                              food['image'],

                              width: 60,
                              height: 60,

                              fit:
                                  BoxFit.cover,
                            ),
                          ),

                          title: Text(
                            food['name'],

                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(
                            "\$${food['price']}",
                          ),

                          onTap: () {

                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (_) =>
                                    DetailScreen(
                                  food: food,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}