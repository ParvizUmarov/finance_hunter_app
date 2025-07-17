import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/ui_kit/page_transitions/smooth_page_transition.dart';
import 'package:finance_hunter_app/ui_kit/styles/app_text_styles.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class LightAppTheme {
  const LightAppTheme._();

  static final baseTextStyle = AppTextStyles.light;

  static ThemeData getThemeData({required Color primaryColor}) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: "Roboto",
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Colors.white,

        tertiary: lighten(primaryColor, 0.31),

        surface: LightAppColors.surface,
        onSecondaryContainer: LightAppColors.surfaceContainerHigh,
        onSurface: LightAppColors.onSurface,
        onSurfaceVariant: LightAppColors.onSurfaceVariant,

        outlineVariant: LightAppColors.outlineVariant,

        error: LightAppColors.error,
        onError: LightAppColors.onError,

        secondary: LightAppColors.secondary,
        onSecondary: LightAppColors.onSecondary,
        secondaryContainer: LightAppColors.secondaryContainer,
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
        backgroundColor: primaryColor,
        titleTextStyle: AppTextStyles.light.titleLarge.copyWith(
          color: LightAppColors.onSurface,
        ),
        elevation: 0,
        shadowColor: const Color(0xFFBDBDBD),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarContrastEnforced: true,
          systemNavigationBarColor: Colors.transparent,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? primaryColor
              : LightAppColors.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? primaryColor
              : LightAppColors.containerHighest;
        }),
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.selected)
              ? Colors.white
              : LightAppColors.outline;
        }),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: LightAppColors.surfaceContainer,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        modalElevation: 0,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          //disabledBackgroundColor: AppColors.borderColor,
          elevation: 2,
          minimumSize: Size.fromHeight(45),
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: LightAppColors.brandColor),
        ),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: lighten(primaryColor, 0.31),
        dayForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) return Colors.grey;

          return Colors.black;
        }),
        todayForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          return LightAppColors.onSurface;
        }),
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: LightAppColors.onSurface,
          textStyle: AppTextStyles.light.labelLarge.copyWith(
            fontWeight: FontWeight.w400,
            color: LightAppColors.onSurface,
          ),
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: LightAppColors.onSurface,
          textStyle: AppTextStyles.light.labelLarge.copyWith(
            color: LightAppColors.onSurface,
          ),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: LightAppColors.onSurface,
      ),
      iconButtonTheme: IconButtonThemeData(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: LightAppColors.surfaceContainer,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 1,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: LightAppColors.surfaceContainer,
        indicatorColor: lighten(primaryColor, 0.31),
        labelTextStyle: WidgetStatePropertyAll(
          AppTextStyles.light.labelMedium.copyWith(
            color: LightAppColors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

  static Color lighten(Color color, [double amount = 0.3]) {
    final hsl = HSLColor.fromColor(color);
    final lightHsl = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return lightHsl.toColor();
  }

}
