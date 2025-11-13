import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sewoo_usb_printer/flutter_sewoo_usb_printer.dart';
import 'dart:async';

import 'package:horang_print/app/model/printer_state.dart';
import 'package:horang_print/app/routing/router_service.dart';

final printerProvider = NotifierProvider<PrinterNotifier, PrinterState>(
  PrinterNotifier.new,
);

class PrinterNotifier extends Notifier<PrinterState> {
  @override
  build() {
    return PrinterState();
  }

  Future<void> connect() async {
    try {
      state = state.copyWith();
      final connected = await SewooUsbPrinter.connect();
      state = state.copyWith(
        isConnected: connected,
      );
    } catch (e) {
      state = state.copyWith(
        isConnected: false,
      );
      RouterService.I.showToast(
        "프린터 연결 실패",
        description: e.toString(),
      );
    }
  }

  Future<void> disconnect() async {
    try {
      await SewooUsbPrinter.disconnect();
      state = state.copyWith(
        isConnected: false,
      );
    } catch (e) {
      RouterService.I.showToast(
        "프린터 연결 해제 실패",
        description: e.toString(),
      );
    }
  }

  Future<bool> printImage(Uint8List imageBytes) async {
    if (!state.isConnected) {
      RouterService.I.showToast(
        "프린터가 연결되어 있지 않습니다.",
      );
      return false;
    }
    await SewooUsbPrinter.printImage(imageBytes);
    await SewooUsbPrinter.lineFeed(lines: 5);
    await SewooUsbPrinter.cutPaper();
    return true;
  }
}




// class PrinterHomePage extends StatefulWidget {
//   const PrinterHomePage({Key? key}) : super(key: key);

//   @override
//   State<PrinterHomePage> createState() => _PrinterHomePageState();
// }

// class _PrinterHomePageState extends State<PrinterHomePage> {
//   bool _isConnected = false;
//   bool _isLoading = false;
//   PrinterStatus? _currentStatus;
//   StreamSubscription<PrinterStatus>? _statusSubscription;
//   bool _asbModeEnabled = false;

//   final List<int> _baudRates = [9600, 19200, 38400, 57600, 115200];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _statusSubscription?.cancel();
//     super.dispose();
//   }



//   void _printSampleImage() async {
//     Uint8List bytes =
//         (await rootBundle.load('assets/logo/output.bmp')).buffer.asUint8List();
//     await SewooUsbPrinter.printImage(bytes);
//     await SewooUsbPrinter.lineFeed(lines: 10);
//     await SewooUsbPrinter.cutPaper();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sewoo USB Printer'),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Connection Settings',
//                       style: Theme.of(context).textTheme.titleLarge,
//                     ),
//                     const SizedBox(height: 16),
//                     const SizedBox(height: 16),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             onPressed: _isLoading
//                                 ? null
//                                 : (_isConnected ? _disconnect : _connect),
//                             icon: Icon(
//                                 _isConnected ? Icons.link_off : Icons.link),
//                             label:
//                                 Text(_isConnected ? 'Disconnect' : 'Connect'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor:
//                                   _isConnected ? Colors.red : Colors.green,
//                               foregroundColor: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (_isConnected) ...[
//               const SizedBox(height: 16),
//               Expanded(
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   childAspectRatio: 2.5,
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 8,
//                   children: [
//                     _buildActionButton(
//                       'Sample Receipt',
//                       Icons.receipt,
//                       _printSampleReceipt,
//                     ),
//                     _buildActionButton(
//                       'Barcode',
//                       Icons.barcode_reader,
//                       _printBarcode,
//                     ),
//                     _buildActionButton(
//                       'QR Code',
//                       Icons.qr_code,
//                       _printQRCode,
//                     ),
//                     _buildActionButton(
//                       'Line Feed',
//                       Icons.format_line_spacing,
//                       () => SewooUsbPrinter.lineFeed(lines: 3),
//                     ),
//                     _buildActionButton(
//                       'Image',
//                       Icons.image,
//                       () => _printSampleImage(),
//                     ),
//                     _buildActionButton(
//                       'Cut Paper',
//                       Icons.cut,
//                       SewooUsbPrinter.cutPaper,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//             if (_isLoading)
//               const Center(
//                 child: CircularProgressIndicator(),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildActionButton(
//       String label, IconData icon, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: _isConnected ? onPressed : null,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 24),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }