import 'package:flutter/material.dart';
import 'package:flutter_map/data/notifiers.dart';
import 'package:flutter_map/views/pages/home_page.dart';
import 'package:flutter_map/views/pages/profile_page.dart';
import 'package:flutter_map/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
        actions: [
          ValueListenableBuilder(
            valueListenable: themeModeNotifier,
            builder:
                (BuildContext context, ThemeMode themeMode, Widget? child) {
                  final bool isDarkMode = themeMode == ThemeMode.dark;
                  return IconButton(
                    onPressed: () {
                      themeModeNotifier.value = isDarkMode
                          ? ThemeMode.light
                          : ThemeMode.dark;
                    },
                    icon: Icon(
                      isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    ),
                  );
                },
          ),
        ],
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (BuildContext context, dynamic selectedPage, Widget? child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
