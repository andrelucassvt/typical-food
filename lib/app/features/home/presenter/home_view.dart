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
import 'package:typical_food/app/common/strings/estados_strings.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final cubit = GetIt.I.get<HomeCubit>();
  String _listEstados = EstadosStrings.estados.first;

  @override
  void initState() {
    super.initState();

    cubit.getPratos('Pará');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarStatesWidget(
        item: _alterarEstado(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const AppBarAdaptive(),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                    bloc: cubit,
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

                      if (state is HomeSucess) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 1,
                            viewportFraction: 0.7,
                          ),
                          items: state.pratos.map((prato) {
                            return PratoWidget(
                              url: prato.image,
                              nome: prato.name,
                              descricao: prato.description,
                              onTap: () {
                                log('Click');
                              },
                            );
                          }).toList(),
                        );
                      }

                      return Container();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _alterarEstado() {
    return DropdownButton(
      value: _listEstados,
      dropdownColor: Colors.blue,
      borderRadius: BorderRadius.circular(10),
      underline: Container(height: 0),
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Colors.white,
      ),
      items: EstadosStrings.estados
          .map(
            (estado) => DropdownMenuItem(
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
          _listEstados = value!;
          cubit.getPratos(value);
        });
      },
    );
  }
}
