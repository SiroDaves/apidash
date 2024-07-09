import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:apidash/consts.dart';

class EqualSplitView extends StatefulWidget {
  const EqualSplitView({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
  });

  final Widget leftWidget;
  final Widget rightWidget;

  @override
  State<EqualSplitView> createState() => _EqualSplitViewState();
}

class _EqualSplitViewState extends State<EqualSplitView> {
  final MultiSplitViewController _controller = MultiSplitViewController(
    areas: [
      Area(id: "left", min: 0.8),
      Area(id: "right", min: 0.95),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiSplitViewTheme(
      data: MultiSplitViewThemeData(
        dividerThickness: 3,
        dividerPainter: DividerPainters.background(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          highlightedColor: Theme.of(context).colorScheme.outline.withOpacity(
                kHintOpacity,
              ),
          animationEnabled: false,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return MultiSplitView(
            controller: _controller,
            // MultiSplitViewController(
            //   areas: [
            //     Area(id: "left", size: constraints.maxWidth / 2, min: 240),
            //     Area(id: "right", size: constraints.maxWidth / 2, min: 260),
            //   ],
            // ),
            builder: (context, area) {
              return switch (area.id) {
                "left" => widget.leftWidget,
                "right" => widget.rightWidget,
                _ => Container(),
              };
            },
          );
        },
      ),
    );
  }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
}
