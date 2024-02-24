import 'package:flutter/material.dart';

class ScreenFrame extends StatelessWidget {
  final String title;
  final Widget child;
  final String? subtitle;
  final bool canGoBack;
  final Widget? trailing;
  final Color? color;
  final Color? textColor;
  const ScreenFrame({super.key, required this.child, required this.title, this.canGoBack = true, this.subtitle, this.trailing, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: textColor ?? Theme.of(context).colorScheme.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      canGoBack
                          ? IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                            )
                          : const SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          subtitle != null
                              ? Text(
                                  subtitle.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                  trailing ?? const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class DiaButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final Color fillColor;
  final bool withBackground;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  const DiaButton({
    super.key,
    this.child,
    required this.onPressed,
    this.text = "",
    this.fillColor = Colors.white,
    this.withBackground = true,
    this.padding = const EdgeInsets.all(8),
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: fillColor == Colors.white
            ? withBackground
                ? MaterialStateProperty.all(Theme.of(context).colorScheme.primary)
                : MaterialStateProperty.all(Theme.of(context).colorScheme.background)
            : MaterialStateProperty.all(fillColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: text != ""
          ? Text(
              text.toString(),
              style: TextStyle(
                color: withBackground ? Colors.white : textColor ?? Theme.of(context).textTheme.titleSmall?.color,
              ),
            )
          : child,
    );
  }
}

class SincaIconButton extends StatelessWidget {
  final Widget? child;
  final IconData? iconData;
  final VoidCallback? onPressed;
  final Color fillColor;
  final bool withBackground;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  const SincaIconButton({
    super.key,
    this.child,
    required this.onPressed,
    this.iconData,
    this.fillColor = Colors.white,
    this.withBackground = true,
    this.padding = const EdgeInsets.all(0),
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed;
      },
      child: Padding(
        padding: padding,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: fillColor == Colors.white
                ? withBackground
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.background
                : fillColor,
          ),
          child: Icon(
            iconData,
            color: withBackground ? Colors.white : textColor ?? Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}
