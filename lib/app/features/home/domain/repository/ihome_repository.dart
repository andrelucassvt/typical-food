import 'package:dartz/dartz.dart';
import 'package:typical_food/app/common/error/failure.dart';
import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';

abstract class HomeRepositoryImpl {
  Future<Either<Failure, List<HomeEntity>>> getResumoPrato(
      String nameCollerction);
}
