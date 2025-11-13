import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_provider.dart';
import 'package:horang_print/app/model/session_event.dart';
import 'package:horang_print/app/model/session_state.dart';
import 'package:horang_print/app/routing/router_service.dart';

final sessionProvider = NotifierProvider<SessionNotifier, SessionState>(
  SessionNotifier.new,
);

class SessionNotifier extends Notifier<SessionState> {
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
    final res = await ApiService.I.registerSessionEventStream(sessionUuid);
    res.fold(onSuccess: (stream) {
      stream.listen((event) {
        try {
          final data = jsonDecode(event);
          if (data.containsKey("status")) {
            _handleSessionEvent(data);
          }
        } catch (e) {
          log('JSON Decode Error: $e');
          return;
        }
      });
      // stream.listen((event) {
      //   state = state.copyWith(
      //     status: event.status,
      //     aiImageUrl: event.aiImageUrl ?? state.aiImageUrl,
      //   );
      // });
    }, onFailure: (error) {
      RouterService.I.showToast(
        "세션 이벤트 스트림 연결 실패",
        description: error.message,
      );
    });
  }

  void _handleSessionEvent(dynamic json) {
    log('Event Data: $json');
    final type = SessionEvent.values.firstWhere(
      (e) => e == json['status'],
      orElse: () => SessionEvent.FAILED,
    );

    switch (type) {
      case SessionEvent.AI_REQUESTED:
        break;
      case SessionEvent.RUNNING:
        state = state.copyWith(
          progress: json['progress_percent'] / 100 ?? state.progress,
        );
        break;
      case SessionEvent.SUCCEEDED:
        ref
            .read(finalConfirmProvider.notifier)
            .setAIImage(json['ai_image_url']);
        break;
      case SessionEvent.FAILED:
        state = state.copyWith(
          isError: true,
          isDone: true,
        );
        break;
    }
  }
}
