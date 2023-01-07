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
import 'package:typical_food/app/util/colors_app.dart';
import 'package:typical_food/app/util/strings/estados_strings.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final int _selectedEstados = 0;
  final _listEstados = EstadosStrings.estados;
  final cubit = GetIt.I.get<HomeCubit>();

  @override
  void initState() {
    super.initState();

    cubit.getPratos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarStatesWidget(
        onTap: _alterarEstado,
        titulo: _listEstados[_selectedEstados],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const AppBarAdaptive(),
          SliverFillRemaining(
            child: BlocBuilder<HomeCubit, HomeState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is HomeLoading) {
                  return CircularProgressWidget(
                    color: ColorsApp.darkPrimary,
                  );
                }

                if (state is HomeErro) {
                  return Center(
                    child: Text('${state.erro}'),
                  );
                }

                if (state is HomeSucess) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1,
                          viewportFraction: 0.7,
                        ),
                        items: [
                          PratoWidget(
                            url:
                                'https://www.pa.gov.br/midias/2018/grandes/up_56_o_tacaca_cristino_martins_-_agencia_para__0.jpg',
                            nome: 'Tacaca',
                            descricao:
                                'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
                            onTap: () {
                              log('Tacaca');
                            },
                          ),
                          PratoWidget(
                            url:
                                'https://splitacai.com.br/wp-content/uploads/2021/10/img-bowl.png',
                            nome: 'Açai',
                            descricao:
                                'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
                            onTap: () {
                              log('Açai');
                            },
                          ),
                          PratoWidget(
                            url:
                                'https://img.estadao.com.br/resources/jpg/3/5/1477521433153.jpg',
                            nome: 'Maniçoba',
                            descricao:
                                'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
                            onTap: () {
                              log('Maniçoba');
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                }

                return Container(
                  color: Colors.red,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> _alterarEstado() async {}
}
