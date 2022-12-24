import 'package:flutter/material.dart';
import 'package:typical_food/app/features/home/presenter/widgets/app_bar_adaptive.dart';
import 'package:typical_food/app/features/home/presenter/widgets/bottom_nav_bar_states_widget.dart';
import 'package:typical_food/app/util/strings/estados_strings.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final int _selectedEstados = 0;
  final _listEstados = EstadosStrings.estados;

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
              child: Column(
                children: const [],
              ),
            )
          ],
        ));
  }

  Future<void> _alterarEstado() async {}
}
