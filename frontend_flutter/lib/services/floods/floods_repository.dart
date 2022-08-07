import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:frontend_flutter/model/floods/floods.dart';

class FloodsRepository {
  Future<List<Floods>> getEvents() async {
    final loadJsonFile = await rootBundle.loadString("Assets/Json/floods.json");
    final jsonDecodeFile = jsonDecode(loadJsonFile);
    var jsonFile = jsonDecodeFile["floods"];
    List<Floods> listFloods = List.from(jsonFile)
        .map<Floods>((data) => Floods.fromJson(data))
        .toList();
    return listFloods;
  }
}