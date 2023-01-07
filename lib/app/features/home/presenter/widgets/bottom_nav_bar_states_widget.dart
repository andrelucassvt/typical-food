import 'package:flutter/material.dart';

class BottomNavBarStatesWidget extends StatefulWidget {
  const BottomNavBarStatesWidget({
    required this.onTap,
    required this.item,
    super.key,
  });

  final VoidCallback onTap;
  final Widget item;

  @override
  State<BottomNavBarStatesWidget> createState() =>
      _BottomNavBarStatesWidgetState();
}

class _BottomNavBarStatesWidgetState extends State<BottomNavBarStatesWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 150,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
    );
  }
}
