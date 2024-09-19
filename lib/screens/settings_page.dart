import 'package:flutter/material.dart';
import 'dart:math' as math;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Widget> tiles = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulTile(
        key: UniqueKey(),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: StatefulTile(
        key: UniqueKey(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Row(
        children: tiles,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.swap_calls),
        onPressed: () {
          debugPrint("floating button is clicked");
          setState(() {
            tiles.insert(1, tiles.removeAt(0));
          });
        },
      ),
    );
  }
}

class StatelessTile extends StatelessWidget {
  StatelessTile({super.key});

  final Color theColor = Color(math.Random().nextInt(0xffffffff));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: theColor,
    );
  }
}

class StatefulTile extends StatefulWidget {
  const StatefulTile({super.key});

  @override
  State<StatefulTile> createState() => _StatefulTileState();
}

class _StatefulTileState extends State<StatefulTile> {
  late Color theColor;

  @override
  void initState() {
    super.initState();

    theColor = Color(math.Random().nextInt(0xffffffff));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: theColor,
    );
  }
}
