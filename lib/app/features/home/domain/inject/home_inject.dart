import 'package:get_it/get_it.dart';
import 'package:typical_food/app/features/home/data/datasource/home_datasource.dart';
import 'package:typical_food/app/features/home/data/repository/home_repository.dart';
import 'package:typical_food/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:typical_food/app/features/home/domain/repository/ihome_repository.dart';
import 'package:typical_food/app/features/home/domain/usecase/get_resumo_usecase.dart';
import 'package:typical_food/app/features/home/presenter/cubit/home_cubit.dart';

class HomeInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<HomeDatasoucerImpl>(
      () => HomeDataSource(),
    );

    getIt.registerFactory<HomeRepositoryImpl>(
      () => HomeRepository(dataSource: getIt()),
    );

    getIt.registerFactory<GetResumoUseCase>(
      () => GetResumoUseCase(repository: getIt()),
    );

    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(getResumoUseCase: getIt()),
    );
  }
}
