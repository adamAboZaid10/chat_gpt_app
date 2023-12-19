part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ToggleSwitchSettings extends SettingsState {}

class ChangeAppThemeState extends SettingsState {}

class ChangeLanguageToEnglishState extends SettingsState {}

class ChangeLanguageToArabicState extends SettingsState {}