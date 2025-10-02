import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/photo_taking/logic/photo_taking_provider.dart';
import 'package:horang_print/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PhotoTakingPage extends ConsumerStatefulWidget {
  const PhotoTakingPage({super.key});

  @override
  ConsumerState<PhotoTakingPage> createState() => _PhotoTakingPageState();
}

class _PhotoTakingPageState extends ConsumerState<PhotoTakingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(photoTakingProvider.notifier).initCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(photoTakingProvider);

    ref.listen(photoTakingProvider, (previous, next) {
      if (next.capturedImage != null) {
        context.go(Routes.photoConfirmation);
      }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Camera preview or loading state
          if (state.cameraController != null &&
              state.cameraController!.value.isInitialized)
            Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRect(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: state.cameraController!.value.previewSize!.height,
                      height: state.cameraController!.value.previewSize!.width,
                      child: CameraPreview(state.cameraController!),
                    ),
                  ),
                ),
              ),
            )
          else if (state.isInitializing)
            Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            )
          else if (state.errorMessage != null)
            Container(
              color: Colors.black,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    state.errorMessage!,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          else
            Container(
              color: Colors.black,
              child: const Center(
                child: Icon(
                  Icons.camera_alt,
                  size: 100,
                  color: Colors.white30,
                ),
              ),
            ),
          // UI Overlay
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ShadButton.ghost(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          ref.read(photoTakingProvider.notifier).reset();
                          context.go(Routes.styleSelection);
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (state.isCountingDown)
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      state.countdown.toString(),
                      key: ValueKey(state.countdown),
                      style: context.textTheme.h1Large.copyWith(
                        fontSize: 120,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (state.isCapturing)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '촬영 중...',
                      style: context.textTheme.large.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: GestureDetector(
                    onTap: state.isCountingDown || state.isCapturing
                        ? null
                        : () {
                            ref
                                .read(photoTakingProvider.notifier)
                                .startCapture();
                          },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.isCountingDown || state.isCapturing
                            ? Colors.grey
                            : Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: state.isCountingDown || state.isCapturing
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
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
