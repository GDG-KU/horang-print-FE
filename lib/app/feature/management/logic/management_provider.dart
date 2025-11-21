import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/api/api_service.dart';
import 'package:horang_print/app/feature/management/logic/management_state.dart';

final managementProvider =
    NotifierProvider<ManagementNotifier, ManagementState>(
  ManagementNotifier.new,
);

class ManagementNotifier extends Notifier<ManagementState> {
  @override
  build() {
    return ManagementState(sessionHistories: []);
  }

  void getSessionHistories() async {
    final res = await ApiService.I.getSessionHistories();
    res.fold(
      onSuccess: (data) {
        state = state.copyWith(sessionHistories: data);
      },
      onFailure: (error) {
        log("Failed to fetch session histories: $error");
      },
    );
  }
}
