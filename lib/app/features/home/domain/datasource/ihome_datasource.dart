import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeDatasoucerImpl {
  Future<QuerySnapshot<Map<String, dynamic>>> getResumoPrato();
}
