import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/final_confirm/logic/final_confirm_provider.dart';
import 'package:horang_print/app/feature/photo_taking/logic/photo_taking_provider.dart';
import 'package:horang_print/app/feature/style_selection/logic/style_selection_provider.dart';
import 'package:horang_print/app/provider/session_provider.dart';
import 'package:horang_print/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PhotoConfirmPage extends ConsumerWidget {
  const PhotoConfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoState = ref.watch(photoTakingProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: photoState.capturedImage != null
                        ? Image.memory(
                            photoState.capturedImage!,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            color: Colors.grey[700],
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 100,
                                color: Colors.white30,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: ShadButton.outline(
                      onPressed: () {
                        ref.read(photoTakingProvider.notifier).reset();
                        context.go(Routes.photoTaking);
                      },
                      size: ShadButtonSize.lg,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.camera_alt),
                          const SizedBox(width: 8),
                          Text(
                            '다시 찍기',
                            style: context.textTheme.p,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ShadButton(
                      onPressed: () async {
                        final result = RouterService.I.showConfirmDialog(
                          title: '이 사진으로 결정하시겠습니까?',
                          description: '다음 단계로 넘어가면 사진을 다시 찍을 수 없습니다.',
                        );

                        result.then((isConfirmed) async {
                          if (isConfirmed && photoState.capturedImage != null) {
                            final sessionId = await ref
                                .read(sessionProvider.notifier)
                                .createNewSession(
                                  ref
                                      .read(styleSelectionProvider)
                                      .selectedStyleId!,
                                );
                            if (sessionId.isEmpty) return;
                            ref
                                .read(finalConfirmProvider.notifier)
                                .submitOriginalImage(
                                  photoState.capturedImage!,
                                  sessionId,
                                );
                            RouterService.I.router.go(Routes.finalConfirmation);
                          }
                        });
                      },
                      size: ShadButtonSize.lg,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            '이 사진으로 결정',
                            style: context.textTheme.p.copyWith(
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
          ],
        ),
      ),
    );
  }
}
