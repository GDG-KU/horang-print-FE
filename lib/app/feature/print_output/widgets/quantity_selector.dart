import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/print_output/logic/print_output_provider.dart';

class QuantitySelector extends ConsumerWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(printOutputProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            '인쇄 매수',
            style: context.textTheme.large,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: state.printQuantity > state.minQuantity
                    ? () {
                        ref
                            .read(printOutputProvider.notifier)
                            .decreaseQuantity();
                      }
                    : null,
                icon: const Icon(Icons.remove_circle_outline),
                iconSize: 32,
                color: state.printQuantity > state.minQuantity
                    ? context.colorScheme.primary
                    : Colors.grey,
              ),
              const SizedBox(width: 32),
              Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: context.colorScheme.border,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    state.printQuantity.toString(),
                    style: context.textTheme.h1,
                  ),
                ),
              ),
              const SizedBox(width: 32),
              IconButton(
                onPressed: state.printQuantity < state.maxQuantity
                    ? () {
                        ref
                            .read(printOutputProvider.notifier)
                            .increaseQuantity();
                      }
                    : null,
                icon: const Icon(Icons.add_circle_outline),
                iconSize: 32,
                color: state.printQuantity < state.maxQuantity
                    ? context.colorScheme.primary
                    : Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '최대 ${state.maxQuantity}장',
            style: context.textTheme.muted,
          ),
        ],
      ),
    );
  }
}
