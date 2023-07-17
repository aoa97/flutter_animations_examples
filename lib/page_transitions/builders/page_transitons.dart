import 'package:flutter/material.dart';

class PageFadeTransition extends PageRouteBuilder {
  final Widget page;

  PageFadeTransition(this.page)
      : super(
          pageBuilder: (context, anim, secAnim) => page,
          transitionsBuilder: (context, anim, secAnim, page) => FadeTransition(opacity: anim, child: page),
        );
}

class PageScaleTransition extends PageRouteBuilder {
  final Widget page;

  PageScaleTransition(this.page)
      : super(
          pageBuilder: (context, anim, secAnim) => page,
          transitionsBuilder: (context, anim, secAnim, page) {
            // More control over the provided animation
            final animation = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: anim, curve: Curves.easeInOut),
            );
            return ScaleTransition(scale: animation, child: page);
          },
        );
}

class PageRotationTransition extends PageRouteBuilder {
  final Widget page;

  PageRotationTransition(this.page)
      : super(
          pageBuilder: (context, anim, secAnim) => page,
          transitionsBuilder: (context, anim, secAnim, page) => RotationTransition(turns: anim, child: page),
        );
}

class PageSlideTransition extends PageRouteBuilder {
  final Widget page;

  PageSlideTransition(this.page)
      : super(
          pageBuilder: (context, anim, secAnim) => page,
          transitionsBuilder: (context, anim, secAnim, page) {
            final animation = Tween<Offset>(begin: const Offset(1, 1), end: Offset.zero).animate(anim);
            return SlideTransition(position: animation, child: page);
          },
        );
}

class PageSizeTransition extends PageRouteBuilder {
  final Widget page;

  PageSizeTransition(this.page)
      : super(
          pageBuilder: (context, anim, secAnim) => page,
          transitionsBuilder: (context, anim, secAnim, page) => Align(
            alignment: Alignment.center, // Mandatory to work properly
            child: SizeTransition(
              sizeFactor: anim,
              child: page,
            ),
          ),
        );
}

class PageSizeFadeTransition extends PageRouteBuilder {
  final Widget page;

  PageSizeFadeTransition(this.page)
      : super(
          pageBuilder: (context, anim, secAnim) => page,
          transitionsBuilder: (context, anim, secAnim, page) => Align(
            alignment: Alignment.center, // Mandatory to work properly
            child: SizeTransition(
              sizeFactor: anim,
              child: FadeTransition(
                opacity: anim,
                child: page,
              ),
            ),
          ),
        );
}

class PageScaleRotateTransition extends PageRouteBuilder {
  final Widget page;

  PageScaleRotateTransition(this.page)
      : super(
          pageBuilder: (context, anim, secAnim) => page,
          transitionsBuilder: (context, anim, secAnim, page) => ScaleTransition(
            scale: anim,
            child: RotationTransition(
              turns: anim,
              child: page,
            ),
          ),
        );
}
