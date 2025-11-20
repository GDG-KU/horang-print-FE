import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/style_selection/logic/style_selection_provider.dart';
import 'package:horang_print/app/feature/style_selection/widgets/style_card.dart';
import 'package:horang_print/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StyleSelectionPage extends ConsumerWidget {
  const StyleSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(styleSelectionProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            context.go(Routes.start);
          },
        ),
        title: Text(
          '원하는 AI 스타일을 선택해주세요',
          style: context.textTheme.h3,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.isError) {
                    return Center(
                      child: ShadButton(
                        size: ShadButtonSize.lg,
                        onPressed: () {
                          ref
                              .read(styleSelectionProvider.notifier)
                              .loadStyles();
                        },
                        leading: const Icon(Icons.refresh),
                        child: Text(
                          '재시도',
                          style: context.textTheme.large.copyWith(
                            color: context.colorScheme.secondary,
                          ),
                        ),
                      ),
                    );
                  }
                  return CarouselSlider.builder(
                    itemCount: state.styles.length,
                    itemBuilder: (context, index, realIndex) {
                      final style = state.styles[index];
                      final isSelected = state.selectedStyleId == style.id;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: StyleCard(
                          style: style,
                          isSelected: isSelected,
                          onTap: () {
                            ref
                                .read(styleSelectionProvider.notifier)
                                .toggleStyle(style.id);
                          },
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: double.infinity,
                      viewportFraction: 0.45,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShadButton(
                    enabled: state.selectedStyleId != null,
                    onPressed: () {
                      context.go(Routes.photoTaking);
                    },
                    size: ShadButtonSize.lg,
                    child: Row(
                      children: [
                        Text(
                          '다음',
                          style: context.textTheme.large.copyWith(
                            color: context.colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: context.colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
