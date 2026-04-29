import 'package:flutter/material.dart';
import '../models/food.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Food> foods = [
    Food(name: "Burger", price: 5, description: "Tasty burger", category: "Fast Food"),
    Food(name: "Pizza", price: 8, description: "Cheesy pizza", category: "Fast Food"),
    Food(name: "Coke", price: 2, description: "Cold drink", category: "Drinks"),
  ];

  String search = "";

  @override
  Widget build(BuildContext context) {
    var filtered = foods
        .where((f) => f.name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
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