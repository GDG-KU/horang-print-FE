import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_state.dart';

final printOutputProvider =
    StateNotifierProvider<PrintOutputNotifier, PrintOutputState>((ref) {
  return PrintOutputNotifier();
});

class PrintOutputNotifier extends StateNotifier<PrintOutputState> {
  PrintOutputNotifier() : super(const PrintOutputState());

  void increaseQuantity() {
    if (state.printQuantity < state.maxQuantity) {
      state = state.copyWith(printQuantity: state.printQuantity + 1);
    }
  }

  void decreaseQuantity() {
    if (state.printQuantity > state.minQuantity) {
      state = state.copyWith(printQuantity: state.printQuantity - 1);
    }
  }

  Future<void> startPrinting() async {
    state = state.copyWith(isPrinting: true);

    await Future.delayed(const Duration(seconds: 3));

    state = state.copyWith(isPrinting: false);
  }

  void reset() {
    state = const PrintOutputState();
  }
}