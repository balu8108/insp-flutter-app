// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'navbar_redux.freezed.dart';

@freezed
class NavbarAppState with _$NavbarAppState {
  const factory NavbarAppState({@Default('Home') String selectedButton}) =
      _NavbarAppState;
}

sealed class NavbarAction {}

class UpdateSelectedButton extends NavbarAction {
  String selectedButton;
  UpdateSelectedButton({required this.selectedButton});
}

NavbarAppState navbarStateReducer(NavbarAppState state, dynamic action) {
  if (action is UpdateSelectedButton) {
    return state.copyWith(selectedButton: action.selectedButton);
  }
  return state;
}
