import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stops for [LinearGradient] (9 stops for 9 colors).
const List<double> _stops = [0.0, 0.2, 0.35, 0.5, 0.6, 0.75, 0.85, 0.92, 1.0];

/// One login background theme: 9 colors for gradient (topLeft → bottomRight).
class LoginThemePreset {
  const LoginThemePreset({
    required this.name,
    required this.colors,
  });

  final String name;
  final List<Color> colors;

  LinearGradient get gradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
        stops: _stops,
      );
}

/// All 6 presets for login screen background.
class LoginThemes {
  LoginThemes._();

  static const neon = LoginThemePreset(
    name: 'Neon',
    colors: [
      Color(0xFF8B5CF6), // violet
      Color(0xFFA855F7),
      Color(0xFFEC4899), // pink
      Color(0xFFF97316), // orange
      Color(0xFFEAB308), // yellow
      Color(0xFFCA8A04),
      Color(0xFFEAB308),
      Color(0xFF22D3EE), // teal/cyan
      Color(0xFF06B6D4),
    ],
  );

  static const normal = LoginThemePreset(
    name: 'Обычный',
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFAFAFA),
      Color(0xFFF5F5F5),
      Color(0xFFF0F0F0),
      Color(0xFFEEEEEE),
      Color(0xFFEBEBEB),
      Color(0xFFE8E8E8),
      Color(0xFFE5E5E5),
      Color(0xFFE0E0E0),
    ],
  );

  static const blueGradient = LoginThemePreset(
    name: 'Синий градиент',
    colors: [
      Color(0xFF0F172A),
      Color(0xFF1E3A5F),
      Color(0xFF1E40AF),
      Color(0xFF2563EB),
      Color(0xFF3B82F6),
      Color(0xFF60A5FA),
      Color(0xFF7DD3FC),
      Color(0xFF67E8F9),
      Color(0xFF22D3EE),
    ],
  );

  static const pink = LoginThemePreset(
    name: 'Pink',
    colors: [
      Color(0xFF831843),
      Color(0xFF9D174D),
      Color(0xFFBE185D),
      Color(0xFFDB2777),
      Color(0xFFEC4899),
      Color(0xFFF472B6),
      Color(0xFFF9A8D4),
      Color(0xFFFBCFE8),
      Color(0xFFFCE7F3),
    ],
  );

  static const purple = LoginThemePreset(
    name: 'Purple',
    colors: [
      Color(0xFF4C1D95),
      Color(0xFF5B21B6),
      Color(0xFF6D28D9),
      Color(0xFF7C3AED),
      Color(0xFF8B5CF6),
      Color(0xFFA78BFA),
      Color(0xFFC4B5FD),
      Color(0xFFDDD6FE),
      Color(0xFFEDE9FE),
    ],
  );

  static const dark = LoginThemePreset(
    name: 'Dark',
    colors: [
      Color(0xFF0F0F1A),
      Color(0xFF1E1B2E),
      Color(0xFF2D2640),
      Color(0xFF3B2E5C),
      Color(0xFF4C3D6B),
      Color(0xFF0D9488),
      Color(0xFF14B8A6),
      Color(0xFF5B21B6),
      Color(0xFF06B6D4),
    ],
  );

  static const List<LoginThemePreset> all = [
    neon,
    normal,
    blueGradient,
    pink,
    purple,
    dark,
  ];
}

const String _loginThemeKey = 'login_background_theme_index';

Future<int> loadLoginThemeIndex() async {
  final prefs = await SharedPreferences.getInstance();
  final index = prefs.getInt(_loginThemeKey);
  if (index == null || index < 0 || index >= LoginThemes.all.length) {
    return 0;
  }
  return index;
}

Future<void> saveLoginThemeIndex(int index) async {
  if (index < 0 || index >= LoginThemes.all.length) return;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(_loginThemeKey, index);
}
