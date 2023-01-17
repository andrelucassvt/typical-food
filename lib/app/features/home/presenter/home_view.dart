import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:typical_food/app/common/global_widgets/circular_progress_widget.dart';
import 'package:typical_food/app/features/home/presenter/cubit/home_cubit.dart';
import 'package:typical_food/app/features/home/presenter/widgets/app_bar_adaptive.dart';
import 'package:typical_food/app/features/home/presenter/widgets/bottom_nav_bar_states_widget.dart';
import 'package:typical_food/app/features/home/presenter/widgets/prato_widget.dart';
import 'package:typical_food/app/common/strings/colors_app.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final cubit = GetIt.I.get<HomeCubit>();
  List<String> _listEstados = [];
  late String _estado = _listEstados.first;

  @override
  void initState() {
    super.initState();

    cubit.getDados('Pará');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _listEstados.isEmpty
          ? null
          : BottomNavBarStatesWidget(
              item: _alterarEstado(),
            ),
      body: CustomScrollView(
        slivers: <Widget>[
          const AppBarAdaptive(),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<HomeCubit, HomeState>(
                  bloc: cubit,
                  listener: (context, state) {
                    if (state is HomeListEstados) {
                      _listEstados = state.estados;

                      return;
                    }

                    if (state is HomeSucess) {
                      setState(() {
                        _listEstados;
                      });

                      return;
                    }
                  },
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return CircularProgressWidget(
                        color: ColorsApp.darkPrimary,
                      );
                    }

                    if (state is HomeErro) {
                      return Center(
                        child: Text(state.erro.errorMessage),
                      );
                    }

                    if (state is HomeListPratos) {
                      final prato = state.pratos;

                      return CarouselSlider.builder(
                        itemCount: state.pratos.length,
                        options: CarouselOptions(
                          aspectRatio: 1,
                          viewportFraction: 0.7,
                        ),
                        itemBuilder: (context, index, _) => PratoWidget(
                          url: prato[index].image,
                          nome: prato[index].name,
                          descricao: prato[index].description,
                          onTap: () {
                            log('tap !!');
                          },
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _alterarEstado() {
    return DropdownButton(
      value: _estado,
      dropdownColor: Colors.blue,
      borderRadius: BorderRadius.circular(10),
      underline: Container(height: 0),
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Colors.white,
      ),
      items: _listEstados
          .map(
            (String estado) => DropdownMenuItem(
              value: estado,
              child: Text(
                estado,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (String? value) {
        setState(() {
          _estado = value!;
          cubit.getPratos(value);
        });
      },
    );
  }
}
