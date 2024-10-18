import 'dart:convert';
import 'dart:developer';

import 'package:payment_app/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService{
  Future<List<UserModel>> fetchUser()async{
    Future.delayed(const Duration(seconds: 2));

      try {
      // Make HTTP GET request
      final response = await http.get(Uri.parse('https://randomuser.me/api/?results=100&gender=male'));

      if (response.statusCode == 200) {
        // Decode the response body
        final data = jsonDecode(response.body);

        // Map the results to a list of UserModel instances
        List<UserModel> users = (data['results'] as List)
            .map((userJson) => UserModel.fromJson(userJson))
            .toList();
        
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      log('Error fetching users: $e');
      rethrow; 
    }
  }
}