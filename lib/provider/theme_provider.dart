import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../healper/sp_helper.dart';

class ThemeProvider with ChangeNotifier {
  int switchIndex = 0;
  double fontSize = 16;
  int displayColorIndex = 0;


  setTheme({required int index, required BuildContext context}) async {
    SpHelper.saveInt(SpKey.theme, index);
    switchIndex = index;
    print(index);
    if (index == 0) {
      AdaptiveTheme.of(context).setLight();
    } else if (index == 1) {
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setSystem();
    }
    notifyListeners();
  }

  Future<AdaptiveThemeMode> getTheme() async {
    int index = await SpHelper.loadInt(SpKey.theme) ?? 2;

    switchIndex = index;
    if (switchIndex == 0) {
      notifyListeners();
      return AdaptiveThemeMode.light;
    } else if (switchIndex == 1) {
      notifyListeners();
      return AdaptiveThemeMode.dark;
    } else {
      notifyListeners();
      return AdaptiveThemeMode.system;
    }
  }

  setFontSize({required double size}) async {
    fontSize = size;
    notifyListeners();
  }

  setDisplayColorIndex({required int idx}) async {
    displayColorIndex = idx;
    notifyListeners();
  }
}
