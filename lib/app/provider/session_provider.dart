import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
import 'package:horang_print/app/api/sse_event.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_provider.dart';
import 'package:horang_print/app/model/session_event.dart';
import 'package:horang_print/app/model/session_state.dart';
import 'package:horang_print/app/routing/router_service.dart';

final sessionProvider = NotifierProvider<SessionNotifier, SessionState>(
  SessionNotifier.new,
);

class SessionNotifier extends Notifier<SessionState> {
  CancelToken? _sessionEventCancelToken;

  @override
  SessionState build() {
    return SessionState();
  }

  Future<String> createNewSession(int styleId) async {
    final result = await ApiService.I.createSessionWithStyle(styleId);

    return result.fold(onSuccess: (data) {
      state = data;
      _registerEventStream(data.session_uuid);
      return data.session_uuid;
    }, onFailure: (error) {
      RouterService.I.showToast(
        "세션 생성 실패",
        description: error.message,
      );
      return "";
    });
  }

  void _registerEventStream(String sessionUuid) async {
    final res = await ApiService.I.registerSessionEventStream(
      sessionUuid,
      _sessionEventCancelToken ??= CancelToken(),
    );
    res.fold(onSuccess: (stream) {
      stream.listen((event) {
        _handleSessionEvent(event);
      });
    }, onFailure: (error) {
      RouterService.I.showToast(
        "세션 이벤트 스트림 연결 실패",
        description: error.message,
      );
      _sessionEventCancelToken = null;
    });
  }

  void _handleSessionEvent(SseEvent event) {
    log('SSE Event Received: $event');
    final data = jsonDecode(event.data);
    final eventType = SessionEvent.values.firstWhere(
      (e) => e.name == data["status"],
      orElse: () => SessionEvent.FAILED,
    );

    switch (eventType) {
      case SessionEvent.SUCCEEDED:
        ref
            .read(finalConfirmProvider.notifier)
            .setAIImageUrl(data["ai_image_url"] as String);
        break;
      case SessionEvent.FAILED:
        _endSession(
          "Image generation failed",
          isError: true,
        );
        RouterService.I.showToast(
          "이미지 생성 실패",
          description: "이미지 생성 중 오류가 발생했습니다.",
        );
        break;
      case _:
    }

    if (event.event == "completed") {
      _endSession("Session completed");
      return;
    }
  }

  void _endSession(String reason, {bool isError = false}) {
    state = state.copyWith(
      isDone: true,
      isError: isError,
    );
    _sessionEventCancelToken?.cancel(reason);
    _sessionEventCancelToken = null;
    return;
  }
}
