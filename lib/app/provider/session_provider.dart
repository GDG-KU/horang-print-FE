import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
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
      log(stream.toString());
      log(stream.runtimeType.toString());
      stream.listen((event) {
        try {
          final data = jsonDecode(event);
          log('Event Data: $data');
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
}
