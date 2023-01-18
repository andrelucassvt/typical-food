import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:typical_food/app/common/error/common_errors.dart';
import 'package:typical_food/app/features/home/data/model/home_model.dart';
import 'package:typical_food/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';

class HomeDataSource implements HomeDataSourceImpl {
  final db = FirebaseFirestore.instance;

  @override
  Future<List<HomeEntity>> getResumoPrato(String nomeEstado) async {
    try {
      final data = await db
          .collection('Estados')
          .doc(nomeEstado)
          .collection('comidas')
          .get();

      final result = data.docs.map((doc) {
        final data = doc.data();

        return HomeModel(
          image: data['image'],
          name: data['name'],
          description: data['description'],
        );
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<List<String>> getEstados() async {
    try {
      final data = await db.collection('Estados').get();

      final result = data.docs.map((doc) {
        return doc.id;
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
