import 'package:flutter/material.dart';

class DesignSystemColors extends ThemeExtension<DesignSystemColors> {
  final Color background;
  final Color border;
  final Color shadow;
  final Color title;
  final Color subTitle;
  final Color content;
  final Color icon;
  final Color actionButtonBackground;
  final Color actionButtonText;

  const DesignSystemColors({
    required this.background,
    required this.border,
    required this.shadow,
    required this.title,
    required this.subTitle,
    required this.content,
    required this.icon,
    required this.actionButtonBackground,
    required this.actionButtonText,
  });

  @override
  DesignSystemColors copyWith({
    Color? background,
    Color? border,
    Color? shadow,
    Color? title,
    Color? subTitle,
    Color? content,
    Color? icon,
    Color? actionButtonBackground,
    Color? actionButtonText,
  }) {
    return DesignSystemColors(
      background: background ?? this.background,
      border: border ?? this.border,
      shadow: shadow ?? this.shadow,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      content: content ?? this.content,
      icon: icon ?? this.icon,
      actionButtonBackground:
          actionButtonBackground ?? this.actionButtonBackground,
      actionButtonText: actionButtonText ?? this.actionButtonText,
    );
  }

  @override
  DesignSystemColors lerp(ThemeExtension<DesignSystemColors>? other, double t) {
    if (other is! DesignSystemColors) return this;

    return DesignSystemColors(
      background: Color.lerp(background, other.background, t)!,
      border: Color.lerp(border, other.border, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      title: Color.lerp(title, other.title, t)!,
      subTitle: Color.lerp(subTitle, other.subTitle, t)!,
      content: Color.lerp(content, other.content, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      actionButtonBackground:
          Color.lerp(actionButtonBackground, other.actionButtonBackground, t)!,
      actionButtonText:
          Color.lerp(actionButtonText, other.actionButtonText, t)!,
    );
  }
}
