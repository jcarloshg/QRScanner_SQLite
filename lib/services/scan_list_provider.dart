import 'package:flutter/cupertino.dart';
import 'package:sec_9_qrreader/models/models.dart';
import 'package:sec_9_qrreader/services/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelect = 'http';

  Future<ScanModel> nuevoScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.nuevoScanRow(newScan);

    newScan.id = id; // set the id from the new scanModel

    if (typeSelect == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...scans];
    typeSelect = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScans(); // can search into [this.scans]
    notifyListeners();
  }
}
