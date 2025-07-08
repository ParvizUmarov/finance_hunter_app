/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_right.svg
  String get arrowRight => 'assets/icons/arrow_right.svg';

  /// File path: assets/icons/ic_account.svg
  String get icAccount => 'assets/icons/ic_account.svg';

  /// File path: assets/icons/ic_analyze.svg
  String get icAnalyze => 'assets/icons/ic_analyze.svg';

  /// File path: assets/icons/ic_arrow_right.svg
  String get icArrowRight => 'assets/icons/ic_arrow_right.svg';

  /// File path: assets/icons/ic_articles.svg
  String get icArticles => 'assets/icons/ic_articles.svg';

  /// File path: assets/icons/ic_expenses.svg
  String get icExpenses => 'assets/icons/ic_expenses.svg';

  /// File path: assets/icons/ic_income.svg
  String get icIncome => 'assets/icons/ic_income.svg';

  /// File path: assets/icons/ic_settings.svg
  String get icSettings => 'assets/icons/ic_settings.svg';

  /// File path: assets/icons/mdi_dollar.svg
  String get mdiDollar => 'assets/icons/mdi_dollar.svg';

  /// File path: assets/icons/mdi_euro.svg
  String get mdiEuro => 'assets/icons/mdi_euro.svg';

  /// File path: assets/icons/mdi_ruble.svg
  String get mdiRuble => 'assets/icons/mdi_ruble.svg';

  /// List of all assets
  List<String> get values => [
    arrowRight,
    icAccount,
    icAnalyze,
    icArrowRight,
    icArticles,
    icExpenses,
    icIncome,
    icSettings,
    mdiDollar,
    mdiEuro,
    mdiRuble,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/empty.png
  AssetGenImage get empty => const AssetGenImage('assets/images/empty.png');

  /// File path: assets/images/error.png
  AssetGenImage get error => const AssetGenImage('assets/images/error.png');

  /// File path: assets/images/launch_icon.png
  AssetGenImage get launchIcon =>
      const AssetGenImage('assets/images/launch_icon.png');

  /// File path: assets/images/splash_icon.png
  AssetGenImage get splashIcon =>
      const AssetGenImage('assets/images/splash_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [empty, error, launchIcon, splashIcon];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
