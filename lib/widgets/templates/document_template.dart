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
            DocumentAppBar(
              controller: scrollController,
              image: media.bannerImage ?? 'https://bit.ly/33AxUGh',
              title: media.title,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                DocumentInfo(
                  type: media.type,
                  status: media.status,
                  keywords: media.keywords,
                  synopsis: media.synopsis,
                ),
                ...contents
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
            onPressed: () => _handleAddMedia(HistoryStatus.PLANNING),
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

  final String title;

  final String? subtitle;

  final String? image;

  const DocumentAppBar({
    required this.controller,
    required this.title,
    this.subtitle,
    this.image,
  });

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
          title,
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
          title: title,
          image: image,
        ),
      ),
    );
  }

  Widget _buildBackground({
    required String title,
    String? image,
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
          child: Image.network(image ?? '', fit: BoxFit.cover),
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
  final String type;

  final MediaStatus status;

  final List<String?> keywords;

  final String? synopsis;

  const DocumentInfo({
    required this.type,
    required this.status,
    required this.keywords,
    this.synopsis,
  });

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
          _buildSynopsis(synopsis),
          const SizedBox(height: 12),
          _buildTags(type, status, keywords),
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
  Widget _buildTags(String type, MediaStatus status, List<String?> keywords) {
    final tags = keywords
        .map((keyword) => HydeChip(
              name: keyword!,
              color: FontColors.secondary,
              margin: const EdgeInsets.only(right: 8),
            ))
        .toList();

    tags.add(HydeChip(
      name: type,
      color: BrandColors.primary,
      margin: const EdgeInsets.only(right: 8),
    ));

    tags.add(HydeChip(
      name: Media.getStatusName(status),
      color: BrandColors.primary,
    ));

    return Row(children: tags);
  }
}
