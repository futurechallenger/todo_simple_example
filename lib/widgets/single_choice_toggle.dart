// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SingleChoiceToggle extends StatelessWidget {
  SingleChoiceToggle(
      {super.key,
      required this.selectedIndex,
      required this.handleSegmentClick});

  final Function(int) handleSegmentClick;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<int>(
      segments: const [
        ButtonSegment(value: 0, label: Text('By Created')),
        ButtonSegment(value: 1, label: Text('By Title')),
      ],
      selected: <int>{selectedIndex},
      onSelectionChanged: (Set<int> newSelection) {
        handleSegmentClick(newSelection.first);
      },
    );
  }
}
