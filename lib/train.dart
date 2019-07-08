import 'package:get_train_data_from_kapo_api/properties.dart';

class Train {
  final List<Properties> myData;

  Train({this.myData});

  factory Train.fromJson(Map<String, dynamic> json) {
    return new Train(
      myData:
          (json['data'] as List).map((e) => Properties.fromJson(e)).toList(),
    );
  }
}
