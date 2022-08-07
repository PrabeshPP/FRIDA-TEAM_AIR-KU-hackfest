import 'package:json_annotation/json_annotation.dart';

part 'floods.g.dart';

@JsonSerializable()
class Floods {
  final String riverName;
  final String message;
  final double waterLevel;

  Floods(this.riverName, this.message, this.waterLevel); 
 


  factory Floods.fromJson(Map<String, dynamic> json) => _$FloodsFromJson(json);
  Map<String, dynamic> toJson() => _$FloodsToJson(this);
}
