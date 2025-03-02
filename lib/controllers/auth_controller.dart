import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_store_app/global_variables.dart';
import 'package:multi_store_app/models/user.dart';
import 'package:multi_store_app/services/handle_http_response.dart';

class AuthController {
  Future<void> signUpUsers({
    required BuildContext context,
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          state: '',
          city: '',
          locality: '',
          password: password);
      final response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(), headers: {'Content-Type': 'application/json'});
      handleResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account has been successfully created');
          });
    } catch (error) {}
  }
}
