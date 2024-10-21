import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gym_management/core/table_display.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';



@Freezed(fromJson: true, toJson: true)
class SubscriptionModel with _$SubscriptionModel implements TableDisplay{
  SubscriptionModel._();
  factory SubscriptionModel({
    required String id,
    required String name,
    required double price,
  }) = _SubscriptionModel;

  static List<String> get columns {
    return [
      'id', 'name', 'price'
    ];
  }
  // Optional: Add support for JSON serialization
  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);

  @override
  Map<String, dynamic> toTableData() => toJson();
}
List<SubscriptionModel> dummySubscriptions = List.generate(20, (index) {
  return SubscriptionModel(
    id: 'sub_00$index',
    name: 'Plan ${index + 1}',
    price: 10.0 + index * 5,  // Prices increasing by 5 for each item
  );
});

