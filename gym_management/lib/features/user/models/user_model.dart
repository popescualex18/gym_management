import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gym_management/core/table_display.dart';
import 'package:gym_management/features/subscription/models/subscription_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(fromJson: true, toJson: true)
class UserModel with _$UserModel implements TableDisplay{
  UserModel._();
  factory UserModel({
    required String id,
    required String name,
    required String subscriptionId,
    required DateTime birthDate,
    required String email,
  }) = _UserModel;

  static List<String> get columns {
    return [
      'id', 'name', 'subscriptionId', 'birthDate', 'email'
    ];
  }
  // Optional: Add support for JSON serialization
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toTableData() => toJson();
}
List<UserModel> dummyUsers = List.generate(20, (index) {
  return UserModel(
    id: 'sub_00$index',
    name: 'User ${index + 1}',
    subscriptionId: dummySubscriptions[Random().nextInt(dummySubscriptions.length)].id,
    birthDate: DateTime.now(),
    email: "test@yahoo.com"// Prices increasing by 5 for each item
  );
});
