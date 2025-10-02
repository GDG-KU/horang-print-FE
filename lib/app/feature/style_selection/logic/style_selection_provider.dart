import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/feature/style_selection/logic/style_selection_state.dart';
import 'package:horang_print/app/model/ai_style.dart';

final styleSelectionProvider =
    StateNotifierProvider<StyleSelectionNotifier, StyleSelectionState>((ref) {
  return StyleSelectionNotifier()..loadStyles();
});

class StyleSelectionNotifier extends StateNotifier<StyleSelectionState> {
  StyleSelectionNotifier() : super(const StyleSelectionState());

  void loadStyles() {
    state = state.copyWith(isLoading: true);

    final mockStyles = [
      const AiStyle(
        id: '1',
        name: '웹툰 스타일',
        exampleImageUrl: 'assets/sample_images/webtoon.png',
        description: '당신의 사진을 웹툰 캐릭터처럼 변환합니다',
      ),
      const AiStyle(
        id: '2',
        name: '유화 스타일',
        exampleImageUrl: 'assets/sample_images/oil.png',
        description: '고전 유화 그림처럼 변환합니다',
      ),
      const AiStyle(
        id: '3',
        name: '애니메이션 스타일',
        exampleImageUrl: 'assets/sample_images/style_anime_example.jpg',
        description: '일본 애니메이션 캐릭터처럼 변환합니다',
      ),
      const AiStyle(
        id: '4',
        name: '픽셀 아트',
        exampleImageUrl: 'assets/sample_images/style_pixel_example.jpg',
        description: '레트로 게임 픽셀 아트 스타일로 변환합니다',
      ),
      const AiStyle(
        id: '5',
        name: '수채화 스타일',
        exampleImageUrl: 'assets/sample_images/style_watercolor_example.jpg',
        description: '부드러운 수채화 그림으로 변환합니다',
      ),
    ];

    state = state.copyWith(
      styles: mockStyles,
      isLoading: false,
    );
  }

  void selectStyle(String styleId) {
    state = state.copyWith(selectedStyleId: styleId);
  }
}
