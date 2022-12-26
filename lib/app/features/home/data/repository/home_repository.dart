import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:typical_food/app/features/home/data/datasource/home_datasource.dart';
import 'package:typical_food/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:typical_food/app/features/home/domain/repository/ihome_repository.dart';

class HomeRepository extends HomeRepositoryImpl {
  final HomeDataSource dataSource;

  HomeRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>>
      getResumoPrato() async {
    try {
      final result = await dataSource.getResumoPrato();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
