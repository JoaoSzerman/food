import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/components/main_drawer.dart';

import '../models/setting.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({
    Key? key,
    required this.onSettingsChanged,
    required this.settings,
  }) : super(key: key);

  var settings = Settings();
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late Settings settings;

  @override
  void initState() {
    settings = widget.settings;
    super.initState();
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Configurações",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Gluten',
                    'Se exibe refeições sem gluten',
                    settings.isGlutenFree,
                    (value) => setState(
                      (() => settings.isGlutenFree = value),
                    ),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Se exibe refeições sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(
                      (() => settings.isLactoseFree = value),
                    ),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Se exibe refeições veganas',
                    settings.isVegan,
                    (value) => setState(
                      (() => settings.isVegan = value),
                    ),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Se exibe refeições vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(
                      (() => settings.isVegetarian = value),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
