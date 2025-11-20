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
            Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              radius: const Radius.circular(8),
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: RepaintBoundary(
                      key: ref
                          .read(printOutputProvider.notifier)
                          .previewTargetKey,
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
                        child: RepaintBoundary(
                          key: ref
                              .read(printOutputProvider.notifier)
                              .renderTargetKey,
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
                                                image: MemoryImage(
                                                    state.originalImage!),
                                                fit: BoxFit.cover,
                                              )
                                            : null,
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 13, sigmaY: 13),
                                        child: Container(
                                          color: Colors.white.withOpacity(0.1),
                                          child: Center(
                                            child:
                                                LoadingAnimationWidget.inkDrop(
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (state.ai_image_url.isNotEmpty)
                                  SizedBox(
                                    width: 400,
                                    height: 400,
                                    child: CachedNetworkImage(
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
                                              image: MemoryImage(
                                                  state.originalImage!),
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
                    final result = await ref
                        .read(printOutputProvider.notifier)
                        .captureRenderTarget();
                    if (result) {
                      ref
                          .read(printOutputProvider.notifier)
                          .uploadReceiptImage(sessionState.session_uuid);
                      RouterService.I.router.go(Routes.printOutput);
                    }
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
            if (ref.watch(printOutputProvider).isCapturing)
              Center(
                child: ShadDialog(
                  closeIcon: const SizedBox.shrink(),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LoadingAnimationWidget.discreteCircle(
                          color: context.colorScheme.primary,
                          size: 50,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '이미지 처리 중...',
                          style: context.textTheme.large,
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
