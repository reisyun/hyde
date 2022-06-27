import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyde/models/favorite.dart';
import 'package:readmore/readmore.dart';

import 'package:hyde/utils/fade_on_scroll.dart';
import 'package:hyde/utils/show_bottom_sheet.dart';

import 'package:hyde/styles/sizes.dart';
import 'package:hyde/styles/colors.dart';

import 'package:hyde/models/media.dart';
import 'package:hyde/controllers/favorite_controller.dart';

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
      backgroundColor: BackgroundColors.dep2,
      body: CustomScrollView(
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
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  // TODO: FAB을 제외한 Hide/Show Animation 구현하기
  // 관련 검색어 How To Hide Bottom Navigation Bar On Scroll
  Widget _buildBottomAppBar() {
    return GetX<FavoriteController>(
        init: FavoriteController(),
        builder: (_) {
          final favorite = _.find(mediaId: media.id);

          return BottomAppBar(
            elevation: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.only(right: 16),
              color: BackgroundColors.dep1,
              child: Row(children: [
                // Favorite
                HydeButton(
                  size: ButtonSizes.LARGE,
                  icon: favorite != null
                      ? FlutterRemix.heart_3_fill
                      : FlutterRemix.heart_3_line,
                  color: favorite != null
                      ? CommonColors.point_pink
                      : FontColors.secondary,

                  // '보고싶은'에 추가 또는 제거
                  onPressed: () => _.toggle(Favorite(
                    userId: 'u1',
                    mediaId: media.id,
                    mediaTitle: media.title,
                    mediaBanner: media.banner,
                  )),
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
        });
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
          image: media.banner,
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
          _buildKeywords(
            media.type.name,
            media.status.name,
            media.keywords,
          ),
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
  Widget _buildKeywords(String type, String status, List<String?> tags) {
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
      name: status,
      color: BrandColors.primary,
    ));

    return Row(children: keywords);
  }
}
