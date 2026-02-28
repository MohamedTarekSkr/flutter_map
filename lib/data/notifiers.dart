// ValueNotifier: hold the data
// ValueListenableBuilder: list to the data { don't need setstate}

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light);

