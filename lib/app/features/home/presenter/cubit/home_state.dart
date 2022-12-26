part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {
  final List<HomeEntity> pratos;

  HomeSucess(this.pratos);
}

class HomeErro extends HomeState {
  final Failure erro;

  HomeErro(this.erro);
}
