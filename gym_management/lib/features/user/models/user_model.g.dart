// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      subscriptionId: json['subscriptionId'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      email: json['email'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subscriptionId': instance.subscriptionId,
      'birthDate': instance.birthDate.toIso8601String(),
      'email': instance.email,
    };
