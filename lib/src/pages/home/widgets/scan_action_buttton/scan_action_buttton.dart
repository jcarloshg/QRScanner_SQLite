import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:sec_9_qrreader/models/models.dart';
import 'package:sec_9_qrreader/services/scan_list_provider.dart';
import 'package:sec_9_qrreader/utils/url_launcher.dart';

class ScanActionButtton extends StatelessWidget {
  const ScanActionButtton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.center_focus_strong),
      onPressed: () async {
        // final scanListProviderSCAN = Provider.of<ScanListProvider>(
        //   context,
        //   listen: false,
        // );
        // final scan =
        //     await scanListProviderSCAN.nuevoScan('geo:18.993171,-98.276771');

        // customLaunchUrl(context, scan.value);

        // return;

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF',
          'Cancelar',
          false,
          ScanMode.QR,
        );

        // ignore: avoid_print
        print(barcodeScanRes);

        if (barcodeScanRes == '-1') return;

        final scanListProvider = Provider.of<ScanListProvider>(
          context,
          listen: false,
        );

        scanListProvider.nuevoScan(barcodeScanRes);
      },
    );
  }
}
