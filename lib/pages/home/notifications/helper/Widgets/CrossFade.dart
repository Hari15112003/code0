// ignore_for_file: file_names

part of 'Widgets.dart';

class CrossFade extends StatelessWidget {
  final Widget child;
  final Widget? hiddenChild;
  final bool show;
  final EdgeInsets? padding;
  final bool useCenter;

  const CrossFade({
    super.key,
    required this.child,
    this.hiddenChild,
    this.show = false,
    this.padding,
    this.useCenter = true,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: AnimatedCrossFade(
          firstChild: hiddenChild ?? Container(),
          secondChild: childX(),
          duration: const Duration(milliseconds: 500),
          crossFadeState:
              show ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ));
  }

  Widget childX() {
    if (useCenter) return Center(child: child);
    return child;
  }
}
