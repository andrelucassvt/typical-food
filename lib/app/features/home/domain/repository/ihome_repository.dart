import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:typical_food/app/common/error/failure.dart';

abstract class HomeRepositoryImpl {
  Future<Either<Failure, QuerySnapshot<Map<String, dynamic>>>> getResumoPrato();
}
