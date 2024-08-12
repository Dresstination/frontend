// lib/fetcher.dart

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Fetcher {
  Future<String?> getOutfitId(String token, String content) async {
    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    print(headers);
    final Map<String, String> body = {
      'requirements': content,
    };

    try {
      final response = await http.post(
        Uri.parse("${dotenv.env['BASE_URL']}/outfits"),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['id'];
      } else {
        print('Request failed with status: ${response.statusCode}');

        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getOutfitsData(String token) async {
    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        Uri.parse("${dotenv.env['BASE_URL']}/outfits"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        // Convert the List<dynamic> to List<Map<String, dynamic>>
        return jsonResponse
            .map((data) => data as Map<String, dynamic>)
            .toList();
      } else {
        print('Request failed with status: ${response.statusCode}');

        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
    }
    return [];
  }

  Future<Map<String, dynamic>> getOutfitProductsDetails(
      String token, String outfitId) async {
    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(
        Uri.parse("${dotenv.env['BASE_URL']}/outfits/$outfitId"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Return the parsed JSON response as a Map<String, dynamic>
        return jsonResponse;

        // Convert the List<dynamic> to List<Map<String, dynamic>>
      } else {
        print('Request failed with status: ${response.statusCode}');

        return {};
      }
    } catch (e) {
      print('An error occurred: $e');
    }
    return {};
  }

  String formatTimestamp(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    DateFormat formatter = DateFormat('MMM d, yyyy');

    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
}
