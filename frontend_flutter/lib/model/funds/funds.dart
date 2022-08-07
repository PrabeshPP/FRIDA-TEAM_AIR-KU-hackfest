import 'package:json_annotation/json_annotation.dart';

part 'funds.g.dart';

@JsonSerializable()
class Funds {
  final String Title;
  final String Link;
  final String Location;
  @JsonKey(name: "Fund_Goal")
  final String fundGoal;
  @JsonKey(name: "Fund_Reached")
  final String fundReached;
  @JsonKey(name: "Last_Donation")
  final String lastDontaion;

  
  Funds(this.Title, this.Link, this.Location, this.fundGoal, this.fundReached, this.lastDontaion);
  factory Funds.fromJson(Map<String, dynamic> json) => _$FundsFromJson(json);

  
  Map<String, dynamic> toJson() => _$FundsToJson(this);
}
