import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyde/constants/reaction.dart';
import 'package:hyde/widgets/molecules/info.dart';

class ReactionList extends StatefulWidget {
  @override
  _ReactionListState createState() => _ReactionListState();
}

class _ReactionListState extends State<ReactionList> {
  final List<String> _reactions = [
    Reaction.surprise,
    Reaction.sad,
    Reaction.bored,
    Reaction.serenity,
    Reaction.joy,
  ];

  String? _selectedItem;

  void handleSelect(String item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _reactions.map((item) {
        return _buildReactionItem(item);
      }).toList(),
    );
  }

  Widget _buildReactionSVG({required String source, String? semanticsLabel}) {
    return SvgPicture.asset(
      source,
      height: 40,
      semanticsLabel: semanticsLabel,
    );
  }

  Widget _buildReactionItem(String item) {
    bool isSelected = _selectedItem == item;

    return Info(
      label: Reaction.name(item),
      child: GestureDetector(
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.4,
          duration: const Duration(milliseconds: 100),
          child: _buildReactionSVG(
            source: 'assets/svgs/$item.svg',
            semanticsLabel: item,
          ),
        ),
        onTap: () => handleSelect(item),
      ),
    );
  }
}
