import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/screens/io_device.dart';

import '../shared.dart';

class QrScanner extends StatelessWidget {
  final Function(String) onScan;
  final String? route;

  const QrScanner({
    Key? key,
    required this.onScan,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarcodeScanner(
      lineColor: '#2DA57F',
      cancelButtonText: '',
      isShowFlashIcon: false,
      scanType: ScanType.barcode,
      onScanned: (result) async {
        if (result.toString() != '-1') {
          await playBeep();
          final onScanResult = await onScan(result);
          if (route != null && onScanResult == null) Navigator.pop(context);
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}
