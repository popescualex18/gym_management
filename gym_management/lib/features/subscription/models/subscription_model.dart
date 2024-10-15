import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

@freezed
class SubscriptionModel with _$SubscriptionModel {
  factory SubscriptionModel({
    required String id,
    required String name,
    required double price,
  }) = _SubscriptionModel;

  // Optional: Add support for JSON serialization
  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);
}
List<SubscriptionModel> dummySubscriptions = List.generate(10, (index) {
  return SubscriptionModel(
    id: 'sub_00$index',
    name: 'Plan ${index + 1}',
    price: 10.0 + index * 5,  // Prices increasing by 5 for each item
  );
});

