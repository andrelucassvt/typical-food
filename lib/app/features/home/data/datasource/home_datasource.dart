import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:typical_food/app/common/error/common_errors.dart';
import 'package:typical_food/app/features/home/data/model/home_model.dart';
import 'package:typical_food/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';

class HomeDataSource implements HomeDatasoucerImpl {
  final FirebaseFirestore db;

  HomeDataSource({required this.db});

  @override
  Future<List<HomeEntity>> getResumoPrato() async {
    try {
      final data = await db.collection('comidas').get();

      final result = data.docs.map((doc) {
        final data = doc.data();

        return HomeModel(
          id: data['id'],
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
}
