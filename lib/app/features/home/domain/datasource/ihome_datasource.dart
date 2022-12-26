import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';

abstract class HomeDatasoucerImpl {
  Future<List<HomeEntity>> getResumoPrato();
}
