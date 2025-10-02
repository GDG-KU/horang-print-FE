// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:horang_print/app/routing/router_service.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get_it/get_it.dart';
// import 'package:horang_print/app/api/api_service.dart';

// part 'service.dart';

// void main() async {
//   runZonedGuarded<Future<void>>(
//     () async {
//       await Service.initFlutter();
//       await Service.initEnv();
//       final serviceProviderContainer = Service.registerServices();

//       final router = RouterService.I.router;
//       runApp(UncontrolledProviderScope(
//         container: serviceProviderContainer,
//         child: ShadApp.router(
//           title: 'horang_print',
//           routerConfig: router,
//           themeMode: ThemeMode.light,
//           theme: ShadThemeData(
//             colorScheme: const ShadBlueColorScheme.light(),
//             brightness: Brightness.light,
//           ),
//           debugShowCheckedModeBanner: false,
//           builder: (context, child) {
//             return Overlay(
//               initialEntries: [
//                 OverlayEntry(builder: (context) => child!),
//               ],
//             );
//           },
//         ),
//       ));
//     },
//     (error, stackTrace) {
//       log('runZonedGuarded: ', error: error, stackTrace: stackTrace);
//       debugPrint('runZonedGuarded: $error');
//     },
//   );
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sewoo_usb_printer/flutter_sewoo_usb_printer.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sewoo USB Printer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const PrinterHomePage(),
    );
  }
}

class PrinterHomePage extends StatefulWidget {
  const PrinterHomePage({Key? key}) : super(key: key);

  @override
  State<PrinterHomePage> createState() => _PrinterHomePageState();
}

class _PrinterHomePageState extends State<PrinterHomePage> {
  bool _isConnected = false;
  bool _isLoading = false;
  PrinterStatus? _currentStatus;
  StreamSubscription<PrinterStatus>? _statusSubscription;
  bool _asbModeEnabled = false;

  final List<int> _baudRates = [9600, 19200, 38400, 57600, 115200];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _statusSubscription?.cancel();
    super.dispose();
  }

  Future<void> _connect() async {
    setState(() => _isLoading = true);

    try {
      final connected = await SewooUsbPrinter.connect();

      setState(() {
        _isConnected = connected;
        _isLoading = false;
      });

      if (connected) {
        _showMessage('Connected successfully');
      }
    } catch (e) {
      setState(() => _isLoading = false);
      _showError('Connection failed: $e');
    }
  }

  Future<void> _disconnect() async {
    setState(() => _isLoading = true);

    try {
      await SewooUsbPrinter.disconnect();
      setState(() {
        _isConnected = false;
        _isLoading = false;
        _currentStatus = null;
      });
      _showMessage('Disconnected');
    } catch (e) {
      setState(() => _isLoading = false);
      _showError('Disconnect failed: $e');
    }
  }

  Future<void> _printSampleReceipt() async {
    try {
      await SewooUsbPrinter.printText(
        'SAMPLE RECEIPT',
        alignment: SewooUsbPrinter.ALIGN_CENTER,
        fontType: SewooUsbPrinter.FONT_BOLD,
        textSize: SewooUsbPrinter.TEXT_SIZE_2X,
      );

      await SewooUsbPrinter.lineFeed(lines: 2);

      await SewooUsbPrinter.printText(
        'Date: ${DateTime.now().toString().substring(0, 19)}',
        alignment: SewooUsbPrinter.ALIGN_LEFT,
      );

      await SewooUsbPrinter.lineFeed();

      await SewooUsbPrinter.printText('Items:',
          fontType: SewooUsbPrinter.FONT_BOLD);
      await SewooUsbPrinter.printText('Hamburger                    \$10.00');
      await SewooUsbPrinter.printText('French Fries                 \$5.00');
      await SewooUsbPrinter.printText('Soft Drink                   \$3.00');

      await SewooUsbPrinter.printText(
        '------------------------------------',
        alignment: SewooUsbPrinter.ALIGN_CENTER,
      );

      await SewooUsbPrinter.printText(
        'Total: \$18.00',
        alignment: SewooUsbPrinter.ALIGN_RIGHT,
        fontType: SewooUsbPrinter.FONT_BOLD,
        textSize: SewooUsbPrinter.TEXT_SIZE_2X,
      );

      await SewooUsbPrinter.lineFeed(lines: 2);

      await SewooUsbPrinter.printText(
        'Thank you for your purchase!',
        alignment: SewooUsbPrinter.ALIGN_CENTER,
      );

      await SewooUsbPrinter.lineFeed(lines: 4);
      await SewooUsbPrinter.cutPaper();

      _showMessage('Receipt printed successfully');
    } catch (e) {
      _showError('Print failed: $e');
    }
  }

  Future<void> _printBarcode() async {
    try {
      await SewooUsbPrinter.printText(
        'Barcode Example',
        alignment: SewooUsbPrinter.ALIGN_CENTER,
        fontType: SewooUsbPrinter.FONT_BOLD,
      );

      await SewooUsbPrinter.lineFeed(lines: 2);

      await SewooUsbPrinter.printBarcode(
        '1234567890',
        barcodeType: SewooUsbPrinter.BARCODE_CODE128,
        height: 100,
        width: 2,
        alignment: SewooUsbPrinter.ALIGN_CENTER,
        hriPosition: SewooUsbPrinter.HRI_TEXT_BELOW,
      );

      await SewooUsbPrinter.lineFeed(lines: 4);
      await SewooUsbPrinter.cutPaper();

      _showMessage('Barcode printed successfully');
    } catch (e) {
      _showError('Barcode print failed: $e');
    }
  }

  Future<void> _printQRCode() async {
    try {
      await SewooUsbPrinter.printText(
        'QR Code Example',
        alignment: SewooUsbPrinter.ALIGN_CENTER,
        fontType: SewooUsbPrinter.FONT_BOLD,
      );

      await SewooUsbPrinter.lineFeed(lines: 2);

      await SewooUsbPrinter.printQRCode(
        'https://github.com',
        moduleSize: 6,
        errorLevel: SewooUsbPrinter.QR_ERROR_LEVEL_M,
      );

      await SewooUsbPrinter.lineFeed(lines: 4);
      await SewooUsbPrinter.cutPaper();

      _showMessage('QR Code printed successfully');
    } catch (e) {
      _showError('QR Code print failed: $e');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  void _showError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error), backgroundColor: Colors.red),
    );
  }

  void _printSampleImage() async {
    Uint8List bytes =
        (await rootBundle.load('assets/logo/output.bmp')).buffer.asUint8List();
    await SewooUsbPrinter.printImage(bytes);
    await SewooUsbPrinter.lineFeed(lines: 10);
    await SewooUsbPrinter.cutPaper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sewoo USB Printer'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connection Settings',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _isLoading
                                ? null
                                : (_isConnected ? _disconnect : _connect),
                            icon: Icon(
                                _isConnected ? Icons.link_off : Icons.link),
                            label:
                                Text(_isConnected ? 'Disconnect' : 'Connect'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _isConnected ? Colors.red : Colors.green,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_isConnected) ...[
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    _buildActionButton(
                      'Sample Receipt',
                      Icons.receipt,
                      _printSampleReceipt,
                    ),
                    _buildActionButton(
                      'Barcode',
                      Icons.barcode_reader,
                      _printBarcode,
                    ),
                    _buildActionButton(
                      'QR Code',
                      Icons.qr_code,
                      _printQRCode,
                    ),
                    _buildActionButton(
                      'Line Feed',
                      Icons.format_line_spacing,
                      () => SewooUsbPrinter.lineFeed(lines: 3),
                    ),
                    _buildActionButton(
                      'Image',
                      Icons.image,
                      () => _printSampleImage(),
                    ),
                    _buildActionButton(
                      'Cut Paper',
                      Icons.cut,
                      SewooUsbPrinter.cutPaper,
                    ),
                  ],
                ),
              ),
            ],
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: _isConnected ? onPressed : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
