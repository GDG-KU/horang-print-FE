import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/feature/start/logic/start_state.dart';

final startProvider = StateNotifierProvider<StartNotifier, StartState>((ref) {
  return StartNotifier();
});

class StartNotifier extends StateNotifier<StartState> {
  Timer? _timer;

  StartNotifier() : super(const StartState()) {
    _startSlideshow();
  }

  void _startSlideshow() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final nextIndex = (state.currentImageIndex + 1) % state.backgroundImages.length;
      state = state.copyWith(currentImageIndex: nextIndex);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}