import 'package:equatable/equatable.dart';

class SettingsState extends Equatable{
  final bool firstTime;
  const SettingsState({this.firstTime=false});

  @override
  List<Object> get props => [firstTime];

  SettingsState copyWith({
    bool? darkMode,
    bool? firstTime,
  }) {
    return SettingsState(
      firstTime: firstTime ?? this.firstTime,
    );
  }
}