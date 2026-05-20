import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color iconBg;
  final Color iconFg;
  final Color textPrimary;
  final Color textSecondary;
  final Color seedColor;

  const AppColors({
    required this.iconBg,
    required this.iconFg,
    required this.textPrimary,
    required this.textSecondary,
    required this.seedColor,
  });

  @override
  AppColors copyWith({
    Color? iconBg,
    Color? iconFg,
    Color? textPrimary,
    Color? textSecondary,
    Color? seedColor,
  }) {
    return AppColors(
      iconBg: iconBg ?? this.iconBg,
      iconFg: iconFg ?? this.iconFg,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      seedColor: seedColor ?? this.seedColor,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      iconBg: Color.lerp(iconBg, other.iconBg, t)!,
      iconFg: Color.lerp(iconFg, other.iconFg, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      seedColor: Color.lerp(seedColor, other.seedColor, t)!,
    );
  }
}

class AppTheme {
  static ThemeData get lightMorning {
    return _buildTheme(
      seedColor: const Color(0xFF4A90E2), // Soft professional blue
      surface: const Color(0xFFF8F9FA), // Clean off-white
      scaffold: const Color(0xFFFFFFFF), // Pure white background
      card: const Color(0xFFFFFFFF),
      brightness: Brightness.light,
      iconBg: const Color(0xFFE8EEF5), // Very light blue tint
      iconFg: const Color(0xFF2C3E50), // Professional dark blue-gray
      textPrimary: const Color(0xFF2C3E50), // Consistent primary text
      textSecondary: const Color(0xFF7F8C8D), // Muted secondary
    );
  }

  static ThemeData get lightNoon {
    return _buildTheme(
      seedColor: const Color(0xFF5DADE2), // Calm sky blue
      surface: const Color(0xFFF4F6F7), // Soft surface
      scaffold: const Color(0xFFFAFBFC), // Clean white background
      card: const Color(0xFFFFFFFF),
      brightness: Brightness.light,
      iconBg: const Color(0xFFD6EAF8), // Light blue tint
      iconFg: const Color(0xFF34495E), // Deep professional
      textPrimary: const Color(0xFF34495E), // Professional text
      textSecondary: const Color(0xFF95A5A6), // Soft secondary
    );
  }

  static ThemeData get darkEvening {
    return _buildTheme(
      seedColor: const Color(0xFF5DADE2), // Soft blue accent
      surface: const Color(0xFF2C3E50), // Dark blue-gray
      scaffold: const Color(0xFF1A252F), // Deep background
      card: const Color(0xFF34495E), // Elevated cards
      brightness: Brightness.dark,
      iconBg: const Color(0xFF4A6572), // Mid-tone
      iconFg: const Color(0xFFECF0F1), // Bright white
      textPrimary: const Color(0xFFECF0F1), // Clean white text
      textSecondary: const Color(0xFFBDC3C7), // Soft gray
    );
  }

  static ThemeData get darkNight {
    return _buildTheme(
      seedColor: const Color(0xFF5DADE2), // Consistent blue
      surface: const Color(0xFF1E272E), // Dark surface
      scaffold: const Color(0xFF121619), // Pure dark
      card: const Color(0xFF2C3E50), // Elevated dark cards
      brightness: Brightness.dark,
      iconBg: const Color(0xFF34495E), // Darker icon bg
      iconFg: const Color(0xFFE8E8E8), // Soft white
      textPrimary: const Color(0xFFF0F0F0), // Bright primary
      textSecondary: const Color(0xFFA8A8B8), // Muted secondary
    );
  }

  static ThemeData _buildTheme({
    required Color seedColor,
    required Color surface,
    required Color scaffold,
    required Color card,
    required Brightness brightness,
    required Color iconBg,
    required Color iconFg,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: brightness,
        surface: surface,
        primary: seedColor,
      ),
      scaffoldBackgroundColor: scaffold,
      cardTheme: CardThemeData(
        elevation: brightness == Brightness.dark ? 2 : 1,
        shadowColor: brightness == Brightness.dark
            ? Colors.black.withValues(alpha: 0.2)
            : Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: brightness == Brightness.dark
              ? BorderSide(color: surface.withValues(alpha: 0.2), width: 0.5)
              : BorderSide(color: surface.withValues(alpha: 0.3), width: 0.5),
        ),
        color: card,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        surfaceTintColor: seedColor.withValues(alpha: 0.05),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: card,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: seedColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.all(16),
        labelStyle: TextStyle(color: textSecondary),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: brightness == Brightness.dark ? 2 : 1,
          shadowColor: brightness == Brightness.dark
              ? Colors.black.withValues(alpha: 0.3)
              : Colors.black.withValues(alpha: 0.1),
          backgroundColor: seedColor,
          foregroundColor:
              brightness == Brightness.dark ? Colors.black : Colors.white,
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
          side: BorderSide(
            color: seedColor.withValues(alpha: 0.6),
            width: 1,
          ),
          foregroundColor: seedColor,
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: seedColor,
        foregroundColor: Colors.white,
        elevation: brightness == Brightness.dark ? 4 : 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        extendedPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffold,
        foregroundColor: textPrimary,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3,
        ),
      ),
      extensions: [
        AppColors(
          iconBg: iconBg,
          iconFg: iconFg,
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          seedColor: seedColor,
        ),
      ],
    );
  }

  static AppColors of(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();
    if (colors == null) {
      return const AppColors(
        iconBg: Color(0xFFE8EEF5),
        iconFg: Color(0xFF2C3E50),
        textPrimary: Color(0xFF2C3E50),
        textSecondary: Color(0xFF7F8C8D),
        seedColor: Color(0xFF4A90E2),
      );
    }
    return colors;
  }

  static ThemeData getThemeForTime() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 10) return lightMorning;
    if (hour >= 10 && hour < 17) return lightNoon;
    if (hour >= 17 && hour < 21) return darkEvening;
    return darkNight;
  }
}
