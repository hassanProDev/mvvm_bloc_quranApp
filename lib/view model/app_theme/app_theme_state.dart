part of 'app_theme_cubit.dart';

@immutable
abstract class AppThemeState {}

class AppThemeInitial extends AppThemeState {}

class AppThemeChanged extends AppThemeState {}

class AppColorChanged extends AppThemeState {}

class ChangeTabs extends AppThemeState {}
