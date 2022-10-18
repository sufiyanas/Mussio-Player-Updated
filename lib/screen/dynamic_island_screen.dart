import 'package:flutter/material.dart';
import 'package:music_player/viewModal/view_model.dart';

class DynamicIsland extends StatefulWidget {
  const DynamicIsland({super.key});

  @override
  State<DynamicIsland> createState() => _DynamicIslandState();
}

class _DynamicIslandState extends State<DynamicIsland> {
  int activePageIndex = 0;
  bool collapsed = true;
  bool showViews = true;
  toggleViews() {
    setState(
      () {
        showViews = false;
        collapsed = !collapsed;
      },
    );
  }

  static const animationDuration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final activeViews = views[0];
    final viewsToShow =
        collapsed ? activeViews.collapsedViews : activeViews.expandedViews;
    return Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: toggleViews,
        child: AnimatedContainer(
          onEnd: () => setState(() {
            showViews = true;
          }),
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(
                collapsed ? 20.0 : activeViews.expandedBorderRadius),
          ),
          duration: animationDuration,
          curve: Curves.easeInOut,
          height: collapsed ? 40 : activeViews.expandedHeight,
          width: MediaQuery.of(context).size.width * (collapsed ? 0.5 : 0.70),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (collapsed ? 10.0 : 15.0), vertical: 5),
            child: AnimatedSwitcher(
              duration: animationDuration,
              child: showViews ? viewsToShow : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
