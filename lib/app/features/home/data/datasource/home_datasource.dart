import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:typical_food/app/common/error/common_errors.dart';
import 'package:typical_food/app/features/home/domain/datasource/ihome_datasource.dart';

class HomeDataSource implements HomeDatasoucerImpl {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getResumoPrato() {
    final db = FirebaseFirestore.instance;

    try {
      final result = db.collection('comidas').get();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
