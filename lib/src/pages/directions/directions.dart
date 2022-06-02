import 'package:flutter/material.dart';
import 'package:sec_9_qrreader/widgets/widgets.dart';

class Directions extends StatelessWidget {
  const Directions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScanTile(type: 'http');
  }
}
