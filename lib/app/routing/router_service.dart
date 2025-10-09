import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/feature/completion/completion_page.dart';
import 'package:horang_print/app/feature/error/error_page.dart';
import 'package:horang_print/app/feature/final_confirm/final_confirm_page.dart';
import 'package:horang_print/app/feature/photo_confirm/photo_confirm_page.dart';
import 'package:horang_print/app/feature/photo_taking/photo_taking_page.dart';
import 'package:horang_print/app/feature/print_output/print_output_page.dart';
import 'package:horang_print/app/feature/start/start_page.dart';
import 'package:horang_print/app/feature/style_selection/style_selection_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension GoRouterX on GoRouter {
  BuildContext? get context => configuration.navigatorKey.currentContext;
  OverlayState? get overlayState {
    final context = this.context;
    if (context == null) return null;
    return Overlay.of(context);
  }

  Uri get currentUri {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri;
  }
}

abstract class Routes {
  static const String start = '/';
  static const String styleSelection = '/style-selection';
  static const String photoTaking = '/photo-taking';
  static const String photoConfirmation = '/photo-confirmation';
  static const String finalConfirmation = '/final-confirmation';
  static const String printOutput = '/print-output';
  static const String completion = '/completion';
  static const String error = '/error';
}

class RouterService {
  static RouterService get I => GetIt.I<RouterService>();

  late final GoRouter router;

  String? queryParameter(String key) => router.currentUri.queryParameters[key];

  void showToast(String message, {String? description}) {
    final context = router.context;
    if (context == null) return;
    ShadToaster.of(context).show(
      ShadToast(
        title: Text(message),
        description: description == null ? null : Text(description),
        action: ShadButton.outline(
          child: const Text('닫기'),
          onPressed: () => ShadToaster.of(context).hide(),
        ),
      ),
    );
  }

  Future<bool> showConfirmDialog({
    required String title,
    String? description,
    String confirmText = '계속하기',
    String cancelText = '취소',
  }) async {
    final context = router.context;
    if (context == null) return false;
    final res = await showShadDialog(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: Text(title),
        description: description != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(description),
              )
            : null,
        actions: [
          ShadButton.outline(
            child: Text(cancelText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          ShadButton(
            child: Text(confirmText),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
    return res ?? false;
  }

  void init() {
    router = GoRouter(
      initialLocation: Routes.start,
      routes: [
        GoRoute(
          path: Routes.start,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const StartPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.styleSelection,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const StyleSelectionPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.photoTaking,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const PhotoTakingPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.photoConfirmation,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const PhotoConfirmPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.finalConfirmation,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const FinalConfirmPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.printOutput,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const PrintOutputPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.completion,
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const CompletionPage(),
            );
          },
        ),
      ],
      errorBuilder: (context, state) {
        return const ErrorPage();
      },
    );
  }

  CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
