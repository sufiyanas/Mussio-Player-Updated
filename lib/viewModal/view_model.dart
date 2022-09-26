import 'package:flutter/material.dart';
import 'package:music_player/widgets/musiccollapsed.dart';
import 'package:music_player/widgets/musicexpanded.dart';

class Views {
  Views(
      {required this.collapsedViews,
      required this.expandedViews,
      this.expandedHeight = 200,
      this.expandedBorderRadius = 20.0});
  final Widget collapsedViews;
  final Widget expandedViews;
  double expandedHeight;
  double expandedBorderRadius;
}

final List<Views> views = [
  Views(
      collapsedViews: const MusicCollapsed(),
      expandedViews: const MusicExpanded(),
      expandedHeight: 180,
      expandedBorderRadius: 40),
];
