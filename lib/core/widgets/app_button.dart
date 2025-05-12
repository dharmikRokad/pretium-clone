import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.prefix,
    this.suffix,
    this.prefixSpace = 20,
    this.suffixSpace = 20,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final String title;
  final Widget? prefix;
  final Widget? suffix;
  final double prefixSpace;
  final double suffixSpace;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(50),
        backgroundColor:
            isLoading
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child:
          isLoading
              ? SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  strokeWidth: 3,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  if (prefix != null) ...[
                    prefix!,
                    SizedBox(width: prefixSpace),
                  ],
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                      fontWeightDelta: 2,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  if (suffix != null) ...[
                    SizedBox(width: suffixSpace),
                    suffix!,
                  ],
                  const SizedBox(width: 10),
                ],
              ),
    );
  }
}
