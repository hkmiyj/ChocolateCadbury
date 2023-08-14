import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:mobile_frontend/configs/headers.dart';

import '../configs/host.dart';

class ChocolateController {
  static Future<List<dynamic>?> getChocolate() async {
    try {
      String? url = "$host/chocolate";
      Response response = await get(
        Uri.parse(url),
        headers: header(),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
