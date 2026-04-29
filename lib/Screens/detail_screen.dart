import 'package:flutter/material.dart';
import '../models/food.dart';

class DetailScreen extends StatelessWidget {
  final Food food;

  const DetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(food.name, style: const TextStyle(fontSize: 24)),
            Text("Price: \$${food.price}"),
            Text("Category: ${food.category}"),
            const SizedBox(height: 10),
            Text(food.description),
          ],
        ),
      ),
    );
  }
}