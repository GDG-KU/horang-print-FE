import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/management/logic/management_provider.dart';
import 'package:horang_print/app/feature/management/widget/management_session_history.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_provider.dart';
import 'package:horang_print/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:horang_print/app/provider/printer_provider.dart';

class ManagementPage extends ConsumerWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: double.maxFinite),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "프린터 초기화 상태:",
                                style: context.textTheme.h2,
                              ),
                              const SizedBox(width: 10),
                              if (ref.watch(printerProvider).isInitialized)
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 32,
                                )
                              else
                                const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 32,
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "프린터 연결 상태:",
                                style: context.textTheme.h2,
                              ),
                              const SizedBox(width: 10),
                              if (ref.watch(printerProvider).isConnected)
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 32,
                                )
                              else
                                const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 32,
                                ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          ShadButton(
                            onPressed: () {
                              ref
                                  .read(printerProvider.notifier)
                                  .initializeConnection();
                            },
                            size: ShadButtonSize.lg,
                            leading: const Icon(Icons.usb),
                            child: Text(
                              '프린터 연결 초기화',
                              style: context.textTheme.large.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ShadButton(
                            onPressed: () {
                              ref.read(printerProvider.notifier).connect();
                            },
                            enabled: !ref.watch(printerProvider).isConnected,
                            size: ShadButtonSize.lg,
                            leading: const Icon(Icons.usb),
                            child: Text(
                              '프린터 연결',
                              style: context.textTheme.large.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ShadButton(
                            onPressed: () {
                              ref.read(printerProvider.notifier).disconnect();
                            },
                            size: ShadButtonSize.lg,
                            leading: const Icon(Icons.usb_off),
                            enabled: ref.watch(printerProvider).isConnected,
                            child: Text(
                              '프린터 연결 해제',
                              style: context.textTheme.large.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const ShadSeparator.horizontal(),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShadInputFormField(
                                  label: const Text("밝기 조절 값"),
                                  initialValue: ref
                                      .watch(printOutputProvider)
                                      .brightnessFactor
                                      .toString(),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    final parsed = double.tryParse(value);
                                    if (parsed != null) {
                                      ref
                                          .read(printOutputProvider.notifier)
                                          .setBrightnessFactor(parsed);
                                    }
                                  },
                                ),
                                SizedBox(height: 16),
                                ShadInputFormField(
                                  label: const Text("대비 조절 값"),
                                  keyboardType: TextInputType.number,
                                  initialValue: ref
                                      .watch(printOutputProvider)
                                      .contrastFactor
                                      .toString(),
                                  onChanged: (value) {
                                    final parsed = double.tryParse(value);
                                    if (parsed != null) {
                                      ref
                                          .read(printOutputProvider.notifier)
                                          .setContrastFactor(parsed);
                                    }
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const ShadSeparator.vertical(),
                    const ManagementSessionHistory(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          "현재까지: ${ref.watch(managementProvider).sessionHistories.length}개"),
                      const SizedBox(width: 16),
                      ShadButton(
                        size: ShadButtonSize.lg,
                        onPressed: () {
                          final isConnected =
                              ref.read(printerProvider).isConnected;

                          if (isConnected || kDebugMode) {
                            context.go(Routes.start);
                            return;
                          } else {
                            RouterService.I.showToast(
                              '프린터가 연결되지 않았습니다.',
                              description: '프린터를 연결한 후 다시 시도해주세요.',
                            );
                          }
                        },
                        child: const Text('시작하기'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
