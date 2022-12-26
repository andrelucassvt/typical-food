import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:typical_food/app/common/error/failure.dart';
import 'package:typical_food/app/features/home/domain/repository/ihome_repository.dart';

class GetResumoUseCase {
  GetResumoUseCase({
    required this.repository,
  });

  final HomeRepositoryImpl repository;

  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> call() async {
    return await repository.getResumoPrato();
  }
}
