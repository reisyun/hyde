import 'package:flutter/material.dart';

enum FadeMode {
  fadein,
  fadeout,
}

class FadeOnScroll extends StatefulWidget {
  final ScrollController scrollController;

  final Widget child;

  final double startOffset;

  final FadeMode mode;

  final Duration? duration;

  const FadeOnScroll({
    required this.scrollController,
    required this.child,
    this.startOffset = 0,
    this.mode = FadeMode.fadein,
    this.duration,
  });

  @override
  _FadeOnScrollState createState() => _FadeOnScrollState();
}

class _FadeOnScrollState extends State<FadeOnScroll> {
  late double _offset;

  @override
  void initState() {
    super.initState();
    _offset = widget.scrollController.offset;
    widget.scrollController.addListener(_setOffset);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    setState(() {
      _offset = widget.scrollController.offset;
    });
  }

  /// Opacity
  /// 1 = visible,
  /// 0 = invisible
  double _calculateOpacity() {
    // fading in
    if (widget.mode == FadeMode.fadein) {
      if (_offset >= widget.startOffset) return 1;
      if (_offset <= widget.startOffset) return 0;
    }

    // fading out
    else if (widget.mode == FadeMode.fadeout) {
      if (_offset <= widget.startOffset) return 1;
      if (_offset >= widget.startOffset) return 0;
    }

    // default
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _calculateOpacity(),
      duration: widget.duration ?? const Duration(milliseconds: 200),
      child: widget.child,
    );
  }
}
