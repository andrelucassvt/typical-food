import 'package:dartz/dartz.dart';
import 'package:typical_food/app/common/error/failure.dart';
import 'package:typical_food/app/features/home/domain/repository/ihome_repository.dart';

class GetEstadosUseCase {
  final HomeRepositoryImpl repository;

  GetEstadosUseCase({required this.repository});

  Future<Either<Failure, List<String>>> call() async {
    return await repository.getEstados();
  }
}
