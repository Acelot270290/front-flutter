import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screens/home_screen.dart'; // Importe a tela HomeScreen

class ApiService {
  final String baseUrl =
      "http://10.0.2.2:3000"; // Use 10.0.2.2 para emulador Android

  Future<void> login(
      String email, String password, BuildContext context) async {
    final url = Uri.parse('$baseUrl/auth/login');

    print('Tentando login com:');
    print('URL: $url');
    print('Email: $email');
    print('Password: $password');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Se o login for bem-sucedido, navegue para a tela HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      throw Exception('Failed to log in');
    }
  }
}
