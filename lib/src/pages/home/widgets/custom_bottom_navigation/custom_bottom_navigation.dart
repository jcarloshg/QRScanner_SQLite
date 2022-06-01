import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_9_qrreader/services/ui_provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UIProvider uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      onTap: (int indexOption) => uiProvider.selectedMenuOpt = indexOption,
      items: const [
        BottomNavigationBarItem(
          label: 'Map',
          icon: Icon(Icons.map),
        ),
        BottomNavigationBarItem(
          label: 'Directions',
          icon: Icon(Icons.directions),
        ),
      ],
    );
  }
}
