import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:frontend_flutter/model/funds/funds.dart';

class FundsRepository {
  Future<List<Funds>> getEvents() async {
    final loadJsonFile = await rootBundle.loadString("Assets/Json/fund.json");
    final jsonDecodeFile = jsonDecode(loadJsonFile);
    var jsonFile = jsonDecodeFile["funds"];
    List<Funds> listFloods = List.from(jsonFile)
        .map<Funds>((data) => Funds.fromJson(data))
        .toList();
    return listFloods;
  }
}