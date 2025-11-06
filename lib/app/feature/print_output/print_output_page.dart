import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_provider.dart';
import 'package:horang_print/app/feature/print_output/widgets/quantity_selector.dart';

import 'package:horang_print/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PrintOutputPage extends ConsumerWidget {
  const PrintOutputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(printOutputProvider);

    ref.listen(printOutputProvider, (previous, next) {
      if (previous?.isPrinting == true && next.isPrinting == false) {
        context.go(Routes.completion);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          if (state.capturedImage != null)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.colorScheme.border,
                        width: 1,
                      ),
                    ),
                    child: Image.memory(
                      width: 400,
                      state.capturedImage!,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            top: 8,
            left: 12,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      context.go(Routes.finalConfirmation);
                    },
                  ),
                  Text(
                    '인쇄 설정',
                    style: context.textTheme.h3,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 24,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const QuantitySelector(),
                const SizedBox(height: 24),
                ShadButton(
                  onPressed: state.isPrinting
                      ? null
                      : () {
                          ref
                              .read(printOutputProvider.notifier)
                              .startPrinting(ref);
                        },
                  size: ShadButtonSize.lg,
                  child: state.isPrinting
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '인쇄 중...',
                              style: context.textTheme.large.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.print, color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              '인쇄하기',
                              style: context.textTheme.large.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
