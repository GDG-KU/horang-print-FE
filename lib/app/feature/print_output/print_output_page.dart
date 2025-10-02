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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            context.go(Routes.finalConfirmation);
          },
        ),
        title: Text(
          '인쇄 설정',
          style: context.textTheme.h3,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Card(
                          elevation: 8,
                          child: Center(
                            child: Icon(
                              Icons.image,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      QuantitySelector(),
                    ],
                  ),
                ),
              ),
              ShadButton(
                onPressed: state.isPrinting
                    ? null
                    : () {
                        ref.read(printOutputProvider.notifier).startPrinting();
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
      ),
    );
  }
}
