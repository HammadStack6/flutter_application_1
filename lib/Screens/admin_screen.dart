import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() =>
      _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  List foods = [];
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

  void addFood() async {

    await ApiService.addFood({
      "name": "Chef Special",
      "price": 10,
      "description": "Test",
      "category": "Fast Food",
      "image":
          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd"
    });

    fetchFoods();
  }

  void deleteFood(int id) async {
    await ApiService.deleteFood(id);
    fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),

      floatingActionButton:
          FloatingActionButton(
        onPressed: addFood,
        child: const Icon(Icons.add),
      ),

      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: foods.length,
              itemBuilder: (_, i) {

                final food = foods[i];

                return ListTile(
                  title: Text(food['name']),
                  subtitle:
                      Text("\$${food['price']}"),

                  trailing: IconButton(
                    icon:
                        const Icon(Icons.delete),

                    onPressed: () {
                      deleteFood(food['id']);
                    },
                  ),
                );
              },
            ),
    );
  }
}