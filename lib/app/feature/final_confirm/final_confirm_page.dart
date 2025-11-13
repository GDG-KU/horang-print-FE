// import 'dart:ui';

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_provider.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_provider.dart';
import 'package:horang_print/app/provider/session_provider.dart';
import 'package:horang_print/app/routing/router_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalConfirmPage extends ConsumerWidget {
  const FinalConfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(finalConfirmProvider);
    final sessionState = ref.watch(sessionProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  margin: const EdgeInsets.symmetric(
                    vertical: 50,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.colorScheme.border,
                      width: 1,
                    ),
                  ),
                  child: RepaintBoundary(
                    key: ref.read(printOutputProvider.notifier).renderTargetKey,
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Center(
                                  child: Text(
                                    "GDG 호랑이 프린트관🐯",
                                    style: GoogleFonts.jua(
                                      textStyle: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (sessionState.qr != null)
                                Expanded(
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: PrettyQrView.data(
                                      data: sessionState.qr!.redirect_url,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          if (state.ai_image_url.isEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 400,
                                height: 400,
                                decoration: BoxDecoration(
                                  image: state.originalImage != null
                                      ? DecorationImage(
                                          image:
                                              MemoryImage(state.originalImage!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 13, sigmaY: 13),
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
                          if (state.ai_image_url.isNotEmpty)
                            CachedNetworkImage(
                              imageUrl: state.ai_image_url,
                              imageBuilder: (context, imageProvider) =>
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 400,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 24),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 400,
                              height: 400,
                              decoration: BoxDecoration(
                                image: state.originalImage != null
                                    ? DecorationImage(
                                        image:
                                            MemoryImage(state.originalImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/logo/logo_long.png',
                              width: 400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
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