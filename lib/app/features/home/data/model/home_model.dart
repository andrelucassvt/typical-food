import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required String image,
    required String name,
    required String description,
  }) : super(
          image: image,
          name: name,
          description: description,
        );

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  static List<HomeModel>? fromJsonList(List list) {
    return list.map((map) => HomeModel.fromJson(map)).toList();
  }
}
