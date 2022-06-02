import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec_9_qrreader/services/scan_list_provider.dart';

class CustomScanTile extends StatelessWidget {
  const CustomScanTile({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    final iconLeading = Icon(
      type == 'http' ? Icons.map : Icons.directions,
      color: Colors.purple,
    );
    const iconTrailing = Icon(Icons.keyboard_arrow_right, color: Colors.grey);

    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scanList = scanListProvider.scans;

    deleteScanById(int id) =>
        Provider.of<ScanListProvider>(context, listen: false)
            .deleteScanById(id);

    return ListView.builder(
      itemCount: scanList.length,
      itemBuilder: (_, index) {
        return Dismissible(
          key: UniqueKey(), // seencarga de generar una key unica :)
          background: Container(color: Colors.orangeAccent),
          onDismissed: (_) => deleteScanById(scanList[index].id!),
          child: ListTile(
            leading: iconLeading,
            title: Text(scanList[index].value),
            subtitle: Text('id: ${scanList[index].id}'),
            trailing: iconTrailing,
            // ignore: avoid_print
            onTap: () => print(scanList[index].type),
          ),
        );
      },
    );
  }
}
