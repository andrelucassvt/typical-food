import 'package:get_it/get_it.dart';
import 'package:typical_food/app/features/home/presenter/cubit/home_cubit.dart';

class HomeInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(getIt()),
    );
  }
}
