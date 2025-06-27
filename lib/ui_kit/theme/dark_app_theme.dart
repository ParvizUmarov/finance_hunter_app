import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finance_hunter_app/ui_kit/styles/app_text_styles.dart';
import '../page_transitions/smooth_page_transition.dart';
import 'app_colors.dart';

class DarkAppTheme {
  const DarkAppTheme._();

  static final baseTextStyle = AppTextStyles.dark;

  ///TODO нужно поработать над темной цветой гаммой

  static ThemeData getThemeData() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Roboto",
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: DarkAppColors.brandColor,
        onPrimary: DarkAppColors.onPrimary,

        surface: DarkAppColors.surface,
        onSurface: DarkAppColors.onSurface,
        onSurfaceVariant: DarkAppColors.onSurfaceVariant,
        onSecondaryContainer: DarkAppColors.surfaceContainerHigh,

        outlineVariant: DarkAppColors.outlineVariant,

        tertiary: DarkAppColors.secondaryBrandColor,

        error: DarkAppColors.error,
        onError: DarkAppColors.onError,

        secondary: DarkAppColors.secondary,
        onSecondary: DarkAppColors.onSecondary,
        secondaryContainer: DarkAppColors.secondaryContainer,
      ),
      textTheme: TextTheme(
        displayLarge: baseTextStyle.displayLarge,
        displayMedium: baseTextStyle.displayMedium,
        displaySmall: baseTextStyle.displaySmall,
        headlineLarge: baseTextStyle.headlineLarge,
        headlineMedium: baseTextStyle.headlineMedium,
        headlineSmall: baseTextStyle.headlineSmall,
        titleLarge: baseTextStyle.titleLarge,
        titleMedium: baseTextStyle.titleMedium,
        titleSmall: baseTextStyle.titleSmall,
        bodyLarge: baseTextStyle.bodyLarge,
        bodyMedium: baseTextStyle.bodyMedium,
        bodySmall: baseTextStyle.bodySmall,
        labelLarge: baseTextStyle.labelLarge,
        labelMedium: baseTextStyle.labelMedium,
        labelSmall: baseTextStyle.labelSmall,
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {TargetPlatform.android: SmoothSlidePageTransitionsBuilder()},
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: DarkAppColors.brandColor,
        titleTextStyle: baseTextStyle.titleLarge.copyWith(
          color: LightAppColors.onSurface,
        ),
        iconTheme: IconThemeData(
          color: LightAppColors.onSurface
        ),
        actionsIconTheme: IconThemeData(
          color: LightAppColors.onSurface,
        ),
        elevation: 0,
        shadowColor: const Color(0xFF1C1C1C),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: DarkAppColors.onSurfaceVariant
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: DarkAppColors.surfaceContainer,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: DarkAppColors.onSurface,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: DarkAppColors.surfaceContainer,
        indicatorColor: DarkAppColors.secondaryBrandColor,
        labelTextStyle: WidgetStatePropertyAll(
          baseTextStyle.labelMedium.copyWith(
            color: DarkAppColors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
