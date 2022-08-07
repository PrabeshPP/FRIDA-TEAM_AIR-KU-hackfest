// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Funds _$FundsFromJson(Map<String, dynamic> json) => Funds(
      json['Title'] as String,
      json['Link'] as String,
      json['Location'] as String,
      json['Fund_Goal'] as String,
      json['Fund_Reached'] as String,
      json['Last_Donation'] as String,
    );

Map<String, dynamic> _$FundsToJson(Funds instance) => <String, dynamic>{
      'Title': instance.Title,
      'Link': instance.Link,
      'Location': instance.Location,
      'Fund_Goal': instance.fundGoal,
      'Fund_Reached': instance.fundReached,
      'Last_Donation': instance.lastDontaion,
    };
