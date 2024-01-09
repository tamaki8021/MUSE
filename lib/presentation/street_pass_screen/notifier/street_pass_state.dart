// ignore_for_file: must_be_immutable

part of 'street_pass_notifier.dart';

/// Represents the state of StreetPass in the application.
class StreetPassState extends Equatable {
  StreetPassState({this.streetPassModelObj});

  StreetPassModel? streetPassModelObj;

  @override
  List<Object?> get props => [
        streetPassModelObj,
      ];

  StreetPassState copyWith({StreetPassModel? streetPassModelObj}) {
    return StreetPassState(
      streetPassModelObj: streetPassModelObj ?? this.streetPassModelObj,
    );
  }
}
