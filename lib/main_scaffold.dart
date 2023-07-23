import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final void Function()? onAction;
  final Widget? floatingAction;
  final bool? fullView;
  final Icon? actionIcon;
  final Color? backgroundColor;
  final String? githubPath;

  const MainScaffold({
    super.key,
    this.title,
    required this.body,
    this.onAction,
    this.floatingAction,
    this.fullView = false,
    this.actionIcon,
    this.backgroundColor,
    this.githubPath = "",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
        actions: [
          IconButton(
            onPressed: () async {
              final uri = Uri.parse(
                "https://github.com/aoa97/flutter_animations_playground/tree/master/lib$githubPath",
              );
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
            icon: SvgPicture.asset("assets/svg/github.svg"),
          )
        ],
      ),
      floatingActionButton: () {
        if (floatingAction != null) {
          return floatingAction;
        } else if (onAction != null) {
          return FloatingActionButton(onPressed: onAction, child: actionIcon ?? const Icon(Icons.animation));
        } else {
          return null;
        }
      }(),
      body: Padding(
        padding: fullView! ? EdgeInsets.zero : const EdgeInsets.all(10),
        child: body,
      ),
    );
  }
}
