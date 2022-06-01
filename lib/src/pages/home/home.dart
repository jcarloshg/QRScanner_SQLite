import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_9_qrreader/services/scan_list_provider.dart';
import 'package:sec_9_qrreader/src/pages/home/widgets/widgets.dart';
import 'package:sec_9_qrreader/src/pages/pages.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de codigos'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () =>
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteAll(),
          )
        ],
      ),
      body: const HomeBody(),
      bottomNavigationBar: const CustomBottomNavigation(),
      floatingActionButton: const ScanActionButtton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
