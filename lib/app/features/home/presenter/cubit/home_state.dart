part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeListPratos extends HomeState {
  final List<HomeEntity> pratos;

  HomeListPratos(this.pratos);
}

class HomeListEstados extends HomeState {
  final List<String> estados;

  HomeListEstados(this.estados);
}

class HomeSucess extends HomeState {}

class HomeErro extends HomeState {
  final Failure erro;

  HomeErro(this.erro);
}
