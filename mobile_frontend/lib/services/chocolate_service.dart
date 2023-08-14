import 'dart:developer';

import 'package:flutter/material.dart';

import '../controller/chocolate_controller.dart';
import '../models/chocolate.dart';

class ChocolateService extends ChangeNotifier {
  List<Chocolate> chocolate = [];

  ChocolateService() {
    getAllChocolate();
  }

  Future<String?>? getAllChocolate() async {
    try {
      List<dynamic>? jsonData = await ChocolateController.getChocolate();
      if (jsonData != null) {
        chocolate = jsonData.map((json) => Chocolate.fromJson(json)).toList();
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  // Chocolate percentage

  List<Chocolate> getChocolatesForMonth(String month) {
    return chocolate
        .where((chocolate) =>
            _getMonthFromProductionDate(chocolate.productionDate) == month)
        .toList();
  }

  String _getMonthFromProductionDate(String productionDate) {
    final dateParts = productionDate.split("-");
    return dateParts[1];
  }

  // Top 5 chocolate
}
