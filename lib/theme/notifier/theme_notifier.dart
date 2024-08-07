// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import '../../core/app_export.dart';

part 'theme_state.dart';

final themeNotifier = StateNotifierProvider<ThemeNotifier, ThemeState>(
  (ref) => ThemeNotifier(
    ThemeState(themeType: PrefUtils().getThemeData()),
  ),
);

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier(ThemeState state) : super(state);

  Future<void> changeTheme(String themeType) async {
    await PrefUtils().setThemeData(themeType);
    state = state.copyWith(themeType: PrefUtils().getThemeData());
  }
}
