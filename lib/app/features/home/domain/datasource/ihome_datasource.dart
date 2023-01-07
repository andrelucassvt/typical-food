import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';

abstract class HomeDataSourceImpl {
  Future<List<HomeEntity>> getResumoPrato(String nameCollerction);
}
