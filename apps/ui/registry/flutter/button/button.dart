import 'package:flutter/material.dart';

/// FlutMan Button component
/// A customizable button widget for Flutter applications.
class FlutManButton extends StatelessWidget {
  const FlutManButton({
    super.key,
    required this.child,
    this.onPressed,
    this.variant = ButtonVariant.filled,
    this.size = ButtonSize.default_,
    this.isLoading = false,
    this.disabled = false,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isLoading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determine button style based on variant
    final ButtonStyle style = switch (variant) {
      ButtonVariant.filled => ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: _getPadding(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ButtonVariant.outline => OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: _getPadding(),
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ButtonVariant.ghost => TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          padding: _getPadding(),
        ),
      ButtonVariant.destructive => ElevatedButton.styleFrom(
          backgroundColor: colorScheme.error,
          foregroundColor: colorScheme.onError,
          padding: _getPadding(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
    };

    final button = switch (variant) {
      ButtonVariant.filled || ButtonVariant.destructive => ElevatedButton(
          onPressed: disabled || isLoading ? null : onPressed,
          style: style,
          child: _buildChild(),
        ),
      ButtonVariant.outline => OutlinedButton(
          onPressed: disabled || isLoading ? null : onPressed,
          style: style,
          child: _buildChild(),
        ),
      ButtonVariant.ghost => TextButton(
          onPressed: disabled || isLoading ? null : onPressed,
          style: style,
          child: _buildChild(),
        ),
    };

    return button;
  }

  Widget _buildChild() {
    if (isLoading) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }
    return child;
  }

  EdgeInsets _getPadding() {
    return switch (size) {
      ButtonSize.xs => const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ButtonSize.sm => const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      ButtonSize.default_ =>
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ButtonSize.lg => const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ButtonSize.xl => const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    };
  }
}

enum ButtonVariant {
  filled,
  outline,
  ghost,
  destructive,
}

enum ButtonSize {
  xs,
  sm,
  default_,
  lg,
  xl,
}
