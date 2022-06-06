import 'package:flutter/material.dart';
import 'package:hyde/widgets/molecules/library_item.dart';
import 'package:hyde/widgets/organisms/library_field.dart';

class CollectionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LibraryField(
      name: '컬렉션',
      content: Row(children: const [
        LibraryItem(
          name: "공사중🚧",
          image: 'https://bit.ly/3dVZf7z',
        ),
      ]),
    );
  }
}