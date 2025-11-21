import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/feature/management/logic/management_provider.dart';
import 'package:horang_print/app/feature/management/widget/management_session_history_detail.dart';
import 'package:horang_print/app/model/session_history.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ManagementSessionHistory extends ConsumerWidget {
  const ManagementSessionHistory({super.key});

  String _timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays >= 1) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(managementProvider);

    if (state.sessionHistories.isEmpty) {
      return Expanded(
        child: Center(
          child: ShadButton(
            onPressed: () {
              ref.read(managementProvider.notifier).getSessionHistories();
            },
            child: const Text("로딩하기"),
          ),
        ),
      );
    }

    List<SessionHistory> histories = List.from(state.sessionHistories);
    histories.sort(
      (a, b) => b.created_at.compareTo(a.created_at),
    );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          child: AnimationLimiter(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.read(managementProvider.notifier).getSessionHistories();
              },
              child: ListView.builder(
                itemCount: histories.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            showShadDialog(
                              context: context,
                              builder: (context) {
                                return ManagementSessionHistoryDetail(
                                  sessionHistory: histories[index],
                                );
                              },
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          histories[index].style,
                                          style: context.textTheme.h4,
                                        ),
                                        Text(
                                          histories[index].uuid,
                                          style:
                                              context.textTheme.muted.copyWith(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ~일 전, ~분 전
                                  Text(
                                    _timeAgo(histories[index].created_at),
                                    style: context.textTheme.small,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
