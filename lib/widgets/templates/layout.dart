import 'package:flutter/material.dart';
import 'package:hyde/styles/colors.dart';
import 'package:hyde/styles/sizes.dart';
import 'package:hyde/widgets/molecules/app_bar.dart';

/// Interface
class Content {
  final IconData tabIcon;

  final Widget child;

  const Content(this.tabIcon, this.child);
}

/// Widget
class Layout extends StatelessWidget {
  final String avatar;

  final String username;

  final List<Content> contents;

  const Layout({
    required this.avatar,
    required this.username,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    final List<List<Widget>> viewer = [[], []];

    for (var c in contents) {
      viewer[0].add(
        Tab(icon: Icon(c.tabIcon, size: IconSizes.large)),
      );
      viewer[1].add(c.child);
    }

    return DefaultTabController(
      length: contents.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            HydeAppBar(
              title: username,
              avatar: _buildAvatar(avatar),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverTabBarDelegate(TabBar(
                labelColor: FontColors.primary,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: FontColors.hint,
                tabs: viewer[0],
              )),
            ),
          ];
        },
        body: TabBarView(children: viewer[1]),
      ),
    );
  }

  Widget _buildAvatar(String src) {
    return CircleAvatar(
      // 반지름 기준
      radius: 60,
      backgroundImage: NetworkImage(src),
    );
  }
}

/// Delegate
class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  const SliverTabBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        color: BackgroundColors.dep1,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: _tabBar,
    );
  }

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
