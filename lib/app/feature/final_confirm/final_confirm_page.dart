// import 'dart:ui';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_provider.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_provider.dart';
import 'package:horang_print/app/provider/session_provider.dart';
import 'package:horang_print/app/routing/router_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FinalConfirmPage extends ConsumerWidget {
  const FinalConfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(finalConfirmProvider);
    final sessionState = ref.watch(sessionProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.all(24.0)),
            SliverToBoxAdapter(
              child: Center(
                child: RepaintBoundary(
                  key: ref.read(printOutputProvider.notifier).renderTargetKey,
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(
                        color: context.colorScheme.border,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(width: double.infinity, height: 12),
                        Image.asset(
                          'assets/logo/logo.png',
                          width: 200,
                        ),
                        const SizedBox(height: 24),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 500,
                            height: 500,
                            decoration: BoxDecoration(
                              image: state.originalImage != null
                                  ? DecorationImage(
                                      image: MemoryImage(state.originalImage!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
                              child: Container(
                                color: Colors.white.withOpacity(0.1),
                                child: Center(
                                  child: LoadingAnimationWidget.inkDrop(
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 500,
                            height: 500,
                            decoration: BoxDecoration(
                              image: state.originalImage != null
                                  ? DecorationImage(
                                      image: MemoryImage(state.originalImage!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        if (sessionState.qr != null)
                          SizedBox(
                            width: 160,
                            height: 160,
                            child: PrettyQrView.data(
                              data: sessionState.qr!.redirect_url,
                            ),
                          ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ShadButton(
                    // enabled: sessionState.isDone, TODO
                    onPressed: () async {
                      await ref
                          .read(printOutputProvider.notifier)
                          .captureRenderTarget();
                      RouterService.I.router.go(Routes.printOutput);
                    },
                    size: ShadButtonSize.lg,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Icon(Icons.print, color: Colors.white),
                        if (!sessionState.isDone)
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: context.colorScheme.secondary,
                              strokeWidth: 3,
                            ),
                          ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: state.isProcessing
//                             ? AspectRatio(
//                                 aspectRatio: 1,
//                                 child: Stack(
//                                   children: [
//                                     BackdropFilter(
//                                       filter: ImageFilter.blur(
//                                           sigmaX: 10, sigmaY: 10),
//                                       child: Container(
//                                         color: Colors.grey[200],
//                                       ),
//                                     ),
//                                     const Center(
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           CircularProgressIndicator(),
//                                           SizedBox(height: 16),
//                                           Text('AI 변환 중...'),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : Container(),
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                     // if (state.qrCodeData != null) ...[
//                     //   Container(
//                     //     padding: const EdgeInsets.all(24),
//                     //     decoration: BoxDecoration(
//                     //       color: Colors.white,
//                     //       borderRadius: BorderRadius.circular(16),
//                     //       border: Border.all(
//                     //         color: context.colorScheme.border,
//                     //       ),
//                     //     ),
//                     //     child: Column(
//                     //       children: [
//                     //         Container(
//                     //           width: 200,
//                     //           height: 200,
//                     //           decoration: BoxDecoration(
//                     //             color: Colors.grey[200],
//                     //             borderRadius: BorderRadius.circular(8),
//                     //           ),
//                     //           child: const Center(
//                     //             child: Icon(
//                     //               Icons.qr_code_2,
//                     //               size: 150,
//                     //               color: Colors.black54,
//                     //             ),
//                     //           ),
//                     //         ),
//                     //         const SizedBox(height: 16),
//                     //         Text(
//                     //           'QR 코드를 스캔하여',
//                     //           style: context.textTheme.p,
//                     //         ),
//                     //         Text(
//                     //           '이미지를 핸드폰에 저장하세요!',
//                     //           style: context.textTheme.p.copyWith(
//                     //             fontWeight: FontWeight.bold,
//                     //           ),
//                     //         ),
//                     //       ],
//                     //     ),
//                     //   ),
//                     // ],
//                   ],
//                 ),
//               ),