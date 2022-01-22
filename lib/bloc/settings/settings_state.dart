import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable{
  const SettingsState();
  @override
  List<Object?> get props => throw UnimplementedError();
}
class InitSettings extends SettingsState{}
class FirstTimeSettings extends SettingsState{}
class FirstTimeAddCard extends SettingsState{}
class FoundSettings extends SettingsState{}