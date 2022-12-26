import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typical_food/app/common/error/failure.dart';
import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';
import 'package:typical_food/app/features/home/domain/usecase/get_resumo_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getResumoUseCase}) : super(HomeInitial());

  final GetResumoUseCase getResumoUseCase;

  Future<void> getPratos() async {
    final result = await getResumoUseCase();
    emit(HomeLoading());

    emit(
      result.fold(
        (failure) => HomeErro(failure),
        (sucess) => HomeSucess(sucess),
      ),
    );
  }
}
