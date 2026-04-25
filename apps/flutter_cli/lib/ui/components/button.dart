import 'package:flutter/material.dart';

/// FlutManButton - A customizable button component
/// 
/// Usage:
/// ```dart
/// FlutManButton(
///   label: 'Click me',
///   onPressed: () => print('Button pressed!'),
/// )
/// ```
class FlutManButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isLoading;
  final bool isDisabled;

  const FlutManButton({
    super.key,
    this.label,
    this.child,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
  }) : assert(
         label != null || child != null,
         'Either label or child must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ElevatedButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      style: _getButtonStyle(theme),
      child: isLoading 
        ? const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        : child ?? Text(label!),
    );
  }

  ButtonStyle _getButtonStyle(ThemeData theme) {
    final (backgroundColor, foregroundColor) = _getColors(theme);
    final (padding, textStyle) = _getSizeConfig(theme);

    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      textStyle: textStyle,
      elevation: variant == ButtonVariant.ghost ? 0 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  (Color, Color) _getColors(ThemeData theme) {
    return switch (variant) {
      ButtonVariant.primary => (theme.colorScheme.primary, theme.colorScheme.onPrimary),
      ButtonVariant.secondary => (theme.colorScheme.secondary, theme.colorScheme.onSecondary),
      ButtonVariant.destructive => (Colors.red, Colors.white),
      ButtonVariant.outline => (Colors.transparent, theme.colorScheme.primary),
      ButtonVariant.ghost => (Colors.transparent, theme.colorScheme.primary),
    };
  }

  (EdgeInsets, TextStyle) _getSizeConfig(ThemeData theme) {
    return switch (size) {
      ButtonSize.sm => (
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        theme.textTheme.labelSmall!,
      ),
      ButtonSize.md => (
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        theme.textTheme.labelMedium!,
      ),
      ButtonSize.lg => (
        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        theme.textTheme.labelLarge!,
      ),
    };
  }
}

enum ButtonVariant {
  primary,
  secondary,
  destructive,
  outline,
  ghost,
}

enum ButtonSize {
  sm,
  md,
  lg,
}
