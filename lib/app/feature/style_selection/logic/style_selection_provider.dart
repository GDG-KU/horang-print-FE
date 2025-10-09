import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
import 'package:horang_print/app/feature/style_selection/logic/style_selection_state.dart';
import 'package:horang_print/app/model/ai_style.dart';
import 'package:horang_print/app/routing/router_service.dart';

final styleSelectionProvider =
    StateNotifierProvider<StyleSelectionNotifier, StyleSelectionState>((ref) {
  return StyleSelectionNotifier()..loadStyles();
});

class StyleSelectionNotifier extends StateNotifier<StyleSelectionState> {
  StyleSelectionNotifier() : super(const StyleSelectionState());

  void loadStyles() async {
    state = state.copyWith(isLoading: true);

    final result = await ApiService.I.getStyles();

    result.fold(
      onSuccess: (data) {
        state = state.copyWith(
          styles: data,
          isLoading: false,
          isError: false,
        );
      },
      onFailure: (error) {
        state = state.copyWith(isLoading: false, isError: true);
        RouterService.I.showToast(
          "스타일 불러오기 실패",
          description: error.message,
        );
      },
    );
  }

  void toggleStyle(int styleId) {
    state = state.copyWith(
      selectedStyleId: state.selectedStyleId == styleId ? null : styleId,
    );
  }

  void reset() {
    state = state.copyWith(
      selectedStyleId: null,
    );
  }
}
