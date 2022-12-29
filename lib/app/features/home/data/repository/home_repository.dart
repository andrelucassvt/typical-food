import 'package:typical_food/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:typical_food/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';
import 'package:typical_food/app/features/home/domain/repository/ihome_repository.dart';

class HomeRepository extends HomeRepositoryImpl {
  final HomeDataSourceImpl dataSource;

  HomeRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<HomeEntity>>> getResumoPrato() async {
    try {
      final result = await dataSource.getResumoPrato();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
