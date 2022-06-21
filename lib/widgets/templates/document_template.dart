import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:readmore/readmore.dart';

import 'package:hyde/utils/fade_on_scroll.dart';
import 'package:hyde/utils/show_bottom_sheet.dart';

import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';

import 'package:hyde/models/media.dart';
import 'package:hyde/models/history.dart';
import 'package:hyde/controllers/history_controller.dart';

import 'package:hyde/widgets/atoms/icon.dart';
import 'package:hyde/widgets/atoms/text.dart';
import 'package:hyde/widgets/atoms/chip.dart';
import 'package:hyde/widgets/atoms/button.dart';
import 'package:hyde/widgets/atoms/bottom_sheet.dart';
import 'package:hyde/widgets/molecules/field.dart';
import 'package:hyde/widgets/molecules/floating_action_button.dart';
import 'package:hyde/widgets/organisms/reaction_list.dart';

class DocumentTemplate extends StatelessWidget {
  final Media media;

  final List<Widget> contents;

  final ScrollController scrollController = ScrollController();

  DocumentTemplate({
    required this.media,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomAppBar(),
      body: Container(
        color: BackgroundColors.dep2,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            DocumentAppBar(scrollController, media),
            SliverList(
              delegate: SliverChildListDelegate([
                DocumentInfo(media),
                ...contents,
              ]),
            ),
          ],
        ),
      ),
    );
  }

  // FAB을 제외한 Hide/Show Animation 구현하기
  // 관련 검색어 How To Hide Bottom Navigation Bar On Scroll
  Widget _buildBottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(right: 16),
        color: BackgroundColors.dep1,
        child: Row(children: [
          // Add media to favorite
          // TODO: 데이터베이스 스키마 설계 다시 해봅시다!
          HydeButton(
            size: ButtonSizes.LARGE,
            icon: FlutterRemix.heart_line,
            onPressed: () => _handleAddMedia(HistoryStatus.COMPLETED),
          ),
          // Share
          HydeButton(
            size: ButtonSizes.LARGE,
            icon: FlutterRemix.share_circle_line,
          ),
          const Spacer(),
          HydeFAB(
            icon: FlutterRemix.add_fill,
            onPressed: () => showCustomBottomSheet(
              HydeBottomSheet(child: ReactionList()),
            ),
          ),
        ]),
      ),
    );
  }

  // History.Status에 미디어 추가
  void _handleAddMedia(HistoryStatus status) {
    final controller = Get.find<HistoryController>();

    // 미디어 추가
    controller.add(History(
      mediaId: media.id,
      id: const Uuid().v4(),
      title: media.title,
      image: media.bannerImage,
      status: status,
    ));

    // 상태 메세지 확인
    Get.snackbar(
      'ADD MEDIA',
      '${History.getStatusName(status)} 애니에 작품을 추가했어요!!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: BackgroundColors.dep1.withOpacity(0.64),
      colorText: FontColors.primary,
    );
  }
}

/// Document AppBar
/// 작품의 중요 정보 부분
class DocumentAppBar extends StatelessWidget {
  final ScrollController controller;

  final Media media;

  const DocumentAppBar(this.controller, this.media);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      expandedHeight: 320,
      title: FadeOnScroll(
        scrollController: controller,
        startOffset: 240,
        child: HydeText(
          media.title,
          size: FontSizes.title,
          color: FontColors.primary,
          strong: true,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1,
        background: _buildBackground(
          title: media.title,
          image: media.bannerImage ?? 'https://bit.ly/33AxUGh',
          trailer: media.trailer,
        ),
      ),
    );
  }

  Widget _buildBackground({
    required String title,
    required String image,
    String? trailer,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [BackgroundColors.dep1, Colors.transparent],
            ),
          ),
          // TODO: 티저 또는 오프닝 영상 미리보기 구현하기
          // 유튜브 영상 긁지 말고, OP 사이트 찾아보자!
          child: Image.network(image, fit: BoxFit.cover),
        ),
        Positioned(
          left: 16,
          bottom: 16,
          child: HydeText(
            title,
            strong: true,
            size: FontSizes.display,
            color: FontColors.primary,
          ),
        ),
      ],
    );
  }
}

/// Document Info
/// 작품의 간단한 정보 부분
class DocumentInfo extends StatelessWidget {
  final Media media;

  const DocumentInfo(this.media);

  @override
  Widget build(BuildContext context) {
    return Field(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSynopsis(media.synopsis),
          const SizedBox(height: 12),
          _buildKeywords(media.type, media.status, media.tags),
        ],
      ),
    );
  }

  /// 작품 설명
  Widget _buildSynopsis(String? synopsis) {
    if (synopsis == null) return const SizedBox();

    return ReadMoreText(
      synopsis,
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: '더보기',
      trimExpandedText: '',
      colorClickableText: FontColors.secondary,
      style: const TextStyle(
        height: 1.6,
        fontSize: FontSizes.body,
        color: FontColors.primary,
      ),
    );
  }

  /// 작품 태그
  Widget _buildKeywords(String type, MediaStatus status, List<String?> tags) {
    final keywords = tags
        .map((keyword) => HydeChip(
              name: keyword!,
              color: FontColors.secondary,
              margin: const EdgeInsets.only(right: 8),
            ))
        .toList();

    keywords.add(HydeChip(
      name: type,
      color: BrandColors.primary,
      margin: const EdgeInsets.only(right: 8),
    ));

    keywords.add(HydeChip(
      name: Media.getStatusName(status),
      color: BrandColors.primary,
    ));

    return Row(children: keywords);
  }
}
