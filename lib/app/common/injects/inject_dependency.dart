import 'package:get_it/get_it.dart';
import 'package:typical_food/app/features/home/domain/inject/home_inject.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    HomeInjectDependency.init(getIt);
  }
}
