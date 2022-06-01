import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:sec_9_qrreader/services/scan_list_provider.dart';

class ScanActionButtton extends StatelessWidget {
  const ScanActionButtton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.center_focus_strong),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF',
          'Cancelar',
          false,
          ScanMode.QR,
        );

        final scanListProvider = Provider.of<ScanListProvider>(
          context,
          listen: false,
        );

        scanListProvider.nuevoScan(barcodeScanRes);

        // ignore: avoid_print
        print(barcodeScanRes);
      },
    );
  }
}
