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
  static const String home = '/';
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

  void init() {
    router = GoRouter(
      initialLocation: Routes.home,
      routes: [
        GoRoute(
          path: Routes.home,
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
