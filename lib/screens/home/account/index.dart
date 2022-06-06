import 'package:flutter/material.dart';
import 'package:hyde/screens/home/account/favorite.dart';
import 'package:hyde/screens/home/account/completed.dart';
import 'package:hyde/screens/home/account/collection.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        CompletedSection(),
        FavoriteSection(),
        CollectionSection(),
      ],
    );
  }
}
