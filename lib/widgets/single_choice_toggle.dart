import 'package:flutter/material.dart';

class SingleChoiceToggle extends StatefulWidget {
  const SingleChoiceToggle({super.key});

  @override
  State<SingleChoiceToggle> createState() => _SingleChoiceToggleState();
}

class _SingleChoiceToggleState extends State<SingleChoiceToggle> {
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
        setState(() {
          selectedIndex = newSelection.first;
        });
      },
    );
  }
}
