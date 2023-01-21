import 'package:flutter/material.dart';

class BottomNavBarStatesWidget extends StatefulWidget {
  const BottomNavBarStatesWidget({
    required this.item,
    super.key,
  });

  final Widget item;

  @override
  State<BottomNavBarStatesWidget> createState() =>
      _BottomNavBarStatesWidgetState();
}

class _BottomNavBarStatesWidgetState extends State<BottomNavBarStatesWidget> {
  @override
  Widget build(BuildContext context) {
    final widthContainer = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: widthContainer * 0.4,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: widget.item,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline),
            ),
          ],
        ),
      ),
    );
  }
}
