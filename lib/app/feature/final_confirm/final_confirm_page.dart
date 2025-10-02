import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_provider.dart';
import 'package:horang_print/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FinalConfirmPage extends ConsumerWidget {
  const FinalConfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(finalConfirmProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'AI 변환 완료!',
                style: context.textTheme.h1,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: state.isProcessing
                            ? AspectRatio(
                                aspectRatio: 1,
                                child: Stack(
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                    const Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircularProgressIndicator(),
                                          SizedBox(height: 16),
                                          Text('AI 변환 중...'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : AspectRatio(
                                aspectRatio: 1,
                                child: state.transformedImage != null
                                    ? Image.memory(
                                        state.transformedImage!,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        color: ShadTheme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.1),
                                        child: const Center(
                                          child: Icon(
                                            Icons.auto_awesome,
                                            size: 100,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    if (state.qrCodeData != null) ...[
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: context.colorScheme.border,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.qr_code_2,
                                  size: 150,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'QR 코드를 스캔하여',
                              style: context.textTheme.p,
                            ),
                            Text(
                              '이미지를 핸드폰에 저장하세요!',
                              style: context.textTheme.p.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ShadButton(
                onPressed: state.isProcessing
                    ? null
                    : () {
                        context.go(Routes.printOutput);
                      },
                size: ShadButtonSize.lg,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.print, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      '프린트하기',
                      style: context.textTheme.large.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
