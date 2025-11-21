import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Future<void> initializeConnection() async {
    try {
      final initialized = await SewooUsbPrinter.initializeConnection();
      state = state.copyWith(
        isInitialized: initialized,
        isConnected: false,
      );
    } catch (e) {
      state = state.copyWith(
        isInitialized: false,
        isConnected: false,
      );
      RouterService.I.showToast(
        "프린터 초기화 실패",
        description: e.toString(),
      );
    }
  }

  Future<void> connect() async {
    if (!state.isInitialized) {
      RouterService.I.showToast(
        "프린터가 초기화되지 않았습니다.",
      );
      return;
    }
    try {
      state = state.copyWith();
      final connected = await SewooUsbPrinter.connect();
      state = state.copyWith(
        isConnected: connected,
      );
      if (connected) {
        RouterService.I.showToast(
          "프린터 연결 성공",
        );
      }
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
        isInitialized: false,
      );
    } catch (e) {
      RouterService.I.showToast(
        "프린터 연결 해제 실패",
        description: e.toString(),
      );
    }
  }

  Future<bool> printImage(Uint8List imageBytes) async {
    log("Attempting to print image. Printer connected: ${state.isConnected}");
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
