// ignore_for_file: file_names

part of 'Widgets.dart';

class Inkk extends StatelessWidget {
  final Widget child;
  final Color? spalshColor;
  final double? radius;
  final VoidCallback? onTap;
  final String? tooltip;
  final bool disable;

  const Inkk(
      {super.key,
      required this.child,
      this.onTap,
      this.radius,
      this.spalshColor,
      this.tooltip,
      this.disable = false,
      });

 
  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(radius ?? 8);
    return Semantics(
       label: tooltip??"Button",
        child: ClipRRect(
        borderRadius: borderRadius,
         clipBehavior: Clip.antiAlias,
          child: stack(borderRadius),
       ),
     );
  }  

  Widget stack(BorderRadius borderRadius){
    return Stack(
              children: [
                child,
                 if(disable==false) Positioned.fill(
                 child: Material(
                  elevation: 0,
                  color: Colors.transparent,
                  borderRadius: borderRadius,
                  child: InkWell(
                    highlightColor: (spalshColor?? Colorz.primaryColor).withOpacity(0.35),
                    splashColor: (spalshColor?? Colorz.primaryColor).withOpacity(0.25),
                    onTap: onTap?? (){},
                  ),
                )
              ),
              ],
            );
  }
}