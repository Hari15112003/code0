// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchPrediction(String incident) async {
  const url = 'http://192.168.21.112:50161/predict';
  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'incident': incident}),
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load prediction');
  }
}

void call({required String incident}) async {
  await fetchPrediction(incident).then((response) {
    String predictedSection = response['predicted_section'];
    String des = response['description'];
    print({predictedSection, des});
  }).catchError((error) {
    print("Error");
  });
}
