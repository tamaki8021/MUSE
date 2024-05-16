import 'package:equatable/equatable.dart';
import 'package:muse/presentation/app_navigation_screen/models/app_navigation_model.dart';

import '/core/app_export.dart';

part 'app_navigation_state.dart';

final appNavigationNotifier =
    StateNotifierProvider<AppNavigationNotifier, AppNavigationState>(
  (ref) => AppNavigationNotifier(AppNavigationState(
    appNavigationModelObj: const AppNavigationModel(),
  ),),
);

/// A notifier that manages the state of a AppNavigation according to 
/// the event that is dispatched to it.
class AppNavigationNotifier extends StateNotifier<AppNavigationState> {
  AppNavigationNotifier(AppNavigationState state) : super(state);
}
