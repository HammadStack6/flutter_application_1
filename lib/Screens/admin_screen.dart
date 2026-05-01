import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/food_data.dart';
import 'package:flutter_application_1/models/food.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  void addFood() {
    foodList.add(Food(
      name: "New Item",
      price: 10,
      description: "Test",
      category: "Fast Food",
      image: "",
    ));

    setState(() {});
  }

  void editFood(int index) {
    foodList[index].name = '${foodList[index].name} (Updated)';
    foodList[index].price += 1;

    setState(() {});
  }

  void deleteFood(int index) {
    foodList.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),

      floatingActionButton: FloatingActionButton(
        onPressed: addFood,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (_, i) {
          final food = foodList[i];

          return ListTile(
            title: Text(food.name),
            subtitle: Text("\$${food.price}"),

            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => editFood(i),
                ),

                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteFood(i),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}