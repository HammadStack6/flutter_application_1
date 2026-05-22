// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {

//   static const String baseUrl = "http://10.0.2.2:3000";
// //static const String baseUrl = "http://192.168.1.5:3000";
//   static Future<List<dynamic>> getFoods() async {

//     final response = await http.get(
//       Uri.parse("$baseUrl/foods"),
//     );

//     return jsonDecode(response.body);
//   }

// }

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {

//   static const String baseUrl =
//       "http://10.0.2.2:3000";

//   static Future<List<dynamic>> getFoods() async {

//     try {

//       final response = await http.get(
//         Uri.parse("$baseUrl/foods"),
//       );

//       if (response.statusCode == 200) {

//         return jsonDecode(response.body);

//       } else {

//         throw Exception(
//           "Failed to load foods: ${response.statusCode}",
//         );
//       }

//     } catch (e) {

//       throw Exception(
//         "Server error: $e",
//       );
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  // static const String baseUrl =
  //     "http://10.0.2.2:3000";

  static const String baseUrl = "http://localhost:3000";

  // GET FOODS
  static Future<List<dynamic>> getFoods() async {

    final res = await http.get(
      Uri.parse("$baseUrl/foods"),
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception("Failed to load foods");
    }
  }

  // ADD FOOD
  static Future<void> addFood(
      Map<String, dynamic> food) async {

    await http.post(
      Uri.parse("$baseUrl/foods"),
      headers: {
        "Content-Type":
            "application/json",
      },
      body: jsonEncode(food),
    );
  }

  // DELETE FOOD
  static Future<void> deleteFood(
      int id) async {

    await http.delete(
      Uri.parse("$baseUrl/foods/$id"),
    );
  }
}