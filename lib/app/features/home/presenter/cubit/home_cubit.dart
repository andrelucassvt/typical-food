import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typical_food/app/common/error/failure.dart';
import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';
import 'package:typical_food/app/features/home/domain/usecase/get_estados_usecase.dart';
import 'package:typical_food/app/features/home/domain/usecase/get_resumo_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getResumoUseCase,
    required this.getEstadosUseCase,
  }) : super(HomeInitial());

  final GetResumoUseCase getResumoUseCase;
  final GetEstadosUseCase getEstadosUseCase;

  Future<void> getDados(String nomeEstado) async {
    await getEstados();
    getPratos(nomeEstado);

    emit(HomeSucess());
  }

  Future<void> getPratos(String nomeEstado) async {
    emit(HomeLoading());

    final result = await getResumoUseCase(nomeEstado);

    emit(result.fold(
      (failure) => HomeErro(failure),
      (sucess) => HomeListPratos(sucess),
    ));
  }

  Future<void> getEstados() async {
    emit(HomeLoading());

    final result = await getEstadosUseCase();

    emit(result.fold(
      (failure) => HomeErro(failure),
      (sucess) => HomeListEstados(sucess),
    ));
  }
}
