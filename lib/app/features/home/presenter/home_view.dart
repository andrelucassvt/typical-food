import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:typical_food/app/features/home/coordinator/home_coordinator.dart';
import 'package:typical_food/app/features/home/presenter/widgets/bottom_nav_bar_states_widget.dart';
import 'package:typical_food/app/util/strings/estados_strings.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedEstados = 0;
  final _listEstados = EstadosStrings.estados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //AppBar para Android
        appBar: Platform.isAndroid
            ? AppBar(
                title: const Text('Typical Food'),
                centerTitle: false,
                actions: [
                  TextButton(
                    onPressed: () {
                      HomeCoordinator.navigateAboutView(context);
                    },
                    child: const Text('Sobre'),
                  )
                ],
              )
            : null,
        bottomNavigationBar: BottomNavBarStatesWidget(
          onTap: Platform.isIOS ? _alterarEstadoIOS : _alterarEstadoAndroid,
          titulo: _listEstados[_selectedEstados],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            //AppBar para IOS
            if (Platform.isIOS)
              CupertinoSliverNavigationBar(
                largeTitle: const Text('Typical Food'),
                trailing: TextButton(
                  onPressed: () {
                    HomeCoordinator.navigateAboutView(context);
                  },
                  child: const Text('Sobre'),
                ),
              ),
            // Fim AppBar IOS
            SliverFillRemaining(
              child: Column(
                children: const [],
              ),
            )
          ],
        ));
  }

  Future<void> _alterarEstadoIOS() async {
    final fixedControllerIOS =
        FixedExtentScrollController(initialItem: _selectedEstados);
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: CupertinoPicker(
                  scrollController: fixedControllerIOS,
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 32,
                  onSelectedItemChanged: (int itemSelected) {
                    setState(() {
                      _selectedEstados = itemSelected;
                    });
                  },
                  children:
                      List<Widget>.generate(_listEstados.length, (int index) {
                    return Center(
                      child: Text(
                        _listEstados[index],
                      ),
                    );
                  }),
                ),
              ),
            ));
  }

  Future<void> _alterarEstadoAndroid() async {
    print('ANDROID');
  }
}
