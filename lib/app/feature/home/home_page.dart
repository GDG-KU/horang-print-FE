import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/feature/home/logic/home_provider.dart';
import 'package:horang_print/app/routing/router_service.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ShadButton(
              onPressed: () {
                context.go(Routes.login);
              },
              child: const Text('Test Login Page'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShadCard(
                    title: Text(state.filters[index]),
                  ),
                );
              },
              itemCount: state.filters.length,
            ),
          ),
        ],
      ),
    );
  }
}
