// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Floods _$FloodsFromJson(Map<String, dynamic> json) => Floods(
      json['riverName'] as String,
      json['message'] as String,
      (json['waterLevel'] as num).toDouble(),
    );

Map<String, dynamic> _$FloodsToJson(Floods instance) => <String, dynamic>{
      'riverName': instance.riverName,
      'message': instance.message,
      'waterLevel': instance.waterLevel,
    };
