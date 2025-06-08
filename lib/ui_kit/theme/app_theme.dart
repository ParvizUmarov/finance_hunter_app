import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/ui_kit/page_transitions/smooth_page_transition.dart';
import 'package:finance_hunter_app/ui_kit/styles/app_text_styles.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  //static String? fontFamily = GoogleFonts.manrope().fontFamily;
  static final baseTextStyle = AppTextStyles.base;

  static ThemeData getThemeData() {
    return ThemeData(
      useMaterial3: true,
      //fontFamily: fontFamily,
      package: 'theme',
      // hintColor: AppColors.darkGrey,
      // disabledColor: AppColors.grey,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.brandColor,
        onPrimary: AppColors.defaultColor,

        surface: AppColors.surface,
        onSecondaryContainer: AppColors.defaultColor,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,

        error: AppColors.error,
        onError: AppColors.onError,

        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,

        // secondaryContainer: AppColors.lightGrey,
        // onSecondaryContainer: AppColors.black,
        // tertiaryContainer: AppColors.black,
        // onTertiaryContainer: AppColors.white,
        // onSurfaceVariant: AppColors.grey,
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
        builders: {
          TargetPlatform.android: SmoothSlidePageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.brandColor,
        //foregroundColor: AppColors.black,
        titleTextStyle: AppTextStyles.base
            .titleLarge
            .copyWith(color: AppColors.onSurface),
        elevation: 0,
        shadowColor: const Color(0xFFBDBDBD),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // systemNavigationBarContrastEnforced: true,
          //systemNavigationBarColor: Colors.transparent,
          // statusBarColor: Colors.transparent,
          // statusBarIconBrightness: Brightness.light,
        ),
      ),
      // actionIconTheme: ActionIconThemeData(
      //   backButtonIconBuilder: (context) => Assets.icons.back.svg(
      //     colorFilter: AppColors.black.filter,
      //   ),
      // ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.surfaceContainer,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        modalElevation: 0,
        modalBarrierColor: Colors.red,
        showDragHandle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      // filledButtonTheme: FilledButtonThemeData(style: commonButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          //disabledBackgroundColor: AppColors.borderColor,
          elevation: 2,
          minimumSize: Size.fromHeight(45),
          backgroundColor: AppColors.brandColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: AppColors.brandColor),
        ),
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: commonButtonStyle.merge(
      //     TextButton.styleFrom(
      //       foregroundColor: AppColors.black,
      //     ),
      //   ),
      // ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.onSurface,
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   filled: true,
      //   fillColor: AppColors.lightGrey,
      //   iconColor: AppColors.darkGrey,
      //   prefixIconColor: AppColors.darkGrey,
      //   suffixIconColor: AppColors.darkGrey,
      //   labelStyle: AppTextStyles.text.l.copyWith(color: AppColors.darkGrey),
      //   floatingLabelStyle: AppTextStyles.text.m.copyWith(
      //     color: AppColors.darkGrey,
      //   ),
      //   border: MaterialStateOutlinedInputBorder.resolveWith((states) {
      //     return OutlinedInputBorder(
      //       borderRadius: const BorderRadius.all(Radius.circular(10)),
      //       borderSide: states.contains(WidgetState.focused)
      //           ? const BorderSide(color: AppColors.darkGrey)
      //           : BorderSide.none,
      //     );
      //   }),
      //   contentPadding: const EdgeInsets.symmetric(
      //     horizontal: 16,
      //     vertical: 8,
      //   ),
      // ),
      // cardTheme: const CardTheme(
      //   elevation: 0,
      //   margin: EdgeInsets.zero,
      //   clipBehavior: Clip.hardEdge,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(24)),
      //   ),
      // ),
      // switchTheme: SwitchThemeData(
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   thumbColor: const WidgetStatePropertyAll(AppColors.white),
      //   trackColor: WidgetStateProperty.resolveWith((states) {
      //     if (states.contains(WidgetState.selected)) {
      //       return AppColors.orange;
      //     }
      //     return AppColors.grey;
      //   }),
      //   trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      //     if (states.contains(WidgetState.selected)) {
      //       return AppColors.orange;
      //     }
      //     return AppColors.grey;
      //   }),
      // ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                //color: AppColors.borderColor,
                width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceContainer,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 1,
      ),
      // badgeTheme: BadgeThemeData(
      //   offset: const Offset(-4, 4),
      //   textStyle: AppTextStyles.text.s.copyWith(height: 1),
      // ),
      // chipTheme: ChipThemeData(
      //   elevation: 0,
      //   pressElevation: 0,
      //   shape: const StadiumBorder(),
      //   showCheckmark: false,
      //   side: BorderSide.none,
      //   padding: EdgeInsets.zero,
      //   labelStyle: AppTextStyles.text.m.copyWith(
      //     color: AppColors.black,
      //   ),
      // ),
      // snackBarTheme: SnackBarThemeData(
      //   dismissDirection: DismissDirection.horizontal,
      //   backgroundColor: AppColors.black,
      //   actionTextColor: AppColors.white,
      //   behavior: SnackBarBehavior.floating,
      //   contentTextStyle: AppTextStyles.text.m.copyWith(
      //     color: AppColors.white,
      //   ),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20.0),
      //   ),
      // ),
    );
  }

  const AppTheme._();
}
