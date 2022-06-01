import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_9_qrreader/services/scan_list_provider.dart';
import 'package:sec_9_qrreader/services/ui_provider.dart';
import 'package:sec_9_qrreader/src/pages/pages.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UIProvider uiProvider = Provider.of<UIProvider>(context);

    final currenIndex = uiProvider.selectedMenuOpt; // UPDATE type page

    final scanList = Provider.of<ScanListProvider>(context, listen: false);

    switch (currenIndex) {
      case 0:
        scanList.loadScansByType('geo');
        return const HistoryMaps();

      case 1:
        scanList.loadScansByType('http');
        return const Directions();

      default:
        return const HistoryMaps();
    }
  }
}
