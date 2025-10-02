import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/photo_taking/logic/photo_taking_provider.dart';
import 'package:horang_print/app/feature/style_selection/logic/style_selection_provider.dart';
import 'package:horang_print/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CompletionPage extends ConsumerStatefulWidget {
  const CompletionPage({super.key});

  @override
  ConsumerState<CompletionPage> createState() => _CompletionPageState();
}

class _CompletionPageState extends ConsumerState<CompletionPage> {
  Timer? _autoResetTimer;
  int _remainingSeconds = 10;

  @override
  void initState() {
    super.initState();
    _startAutoResetTimer();
  }

  void _startAutoResetTimer() {
    _autoResetTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;
      });

      if (_remainingSeconds <= 0) {
        timer.cancel();
        _navigateToStart();
      }
    });
  }

  void _navigateToStart() {
    ref.read(photoTakingProvider.notifier).reset();
    ref.read(styleSelectionProvider.notifier).reset();
    context.go(Routes.home);
  }

  @override
  void dispose() {
    _autoResetTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  size: 80,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                '이용해주셔서 감사합니다!',
                style: context.textTheme.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '인쇄물을 잊지 말고 챙겨가세요!',
                      style: context.textTheme.large.copyWith(
                        color: Colors.orange[800],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              ShadButton(
                onPressed: () {
                  _autoResetTimer?.cancel();
                  _navigateToStart();
                },
                size: ShadButtonSize.lg,
                child: Text(
                  '처음으로 돌아가기',
                  style: context.textTheme.large.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '$_remainingSeconds초 후 자동으로 처음 화면으로 돌아갑니다',
                style: context.textTheme.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
