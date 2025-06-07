import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'border_mode.dart';

/// FlexiBorder allows drawing dotted or solid lines on any subset of the four sides.
/// Supports per-side offset and segment control using [BorderMode].
class FlexiBorder extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final List<double> dashPattern;
  final double strokeWidth;

  final bool drawTop, drawRight, drawBottom, drawLeft;
  final BorderMode borderMode;

  final double topStartOffset, topEndOffset;
  final double rightStartOffset, rightEndOffset;
  final double bottomStartOffset, bottomEndOffset;
  final double leftStartOffset, leftEndOffset;

  const FlexiBorder({
    super.key,
    required this.child,
    this.borderColor = Colors.white,
    this.dashPattern = const [4, 2],
    this.strokeWidth = 1,
    this.drawTop = true,
    this.drawRight = true,
    this.drawBottom = true,
    this.drawLeft = true,
    this.borderMode = BorderMode.full,
    this.topStartOffset = 0,
    this.topEndOffset = 0,
    this.rightStartOffset = 0,
    this.rightEndOffset = 0,
    this.bottomStartOffset = 0,
    this.bottomEndOffset = 0,
    this.leftStartOffset = 0,
    this.leftEndOffset = 0,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: borderColor,
      dashPattern: dashPattern,
      strokeWidth: strokeWidth,
      customPath: (size) {
        final path = Path();
        final fullW = size.width;
        final fullH = size.height;

        final lenTop = borderMode.calculateLength(fullW);
        final lenRight = borderMode.calculateLength(fullH);
        final lenBottom = borderMode.calculateLength(fullW);
        final lenLeft = borderMode.calculateLength(fullH);

        if (drawTop) {
          final sx = (borderMode.type == "half" && drawRight) ? fullW - lenTop : 0;
          final ex = (borderMode.type == "half" && drawRight) ? fullW : lenTop;
          path.moveTo(sx - topStartOffset, 0);
          path.lineTo(ex + topEndOffset, 0);
        }

        if (drawRight) {
          final sy = (borderMode.type == "half" && drawBottom) ? fullH : 0;
          final ey = (borderMode.type == "half" && drawBottom) ? fullH - lenRight : lenRight;
          path.moveTo(fullW, sy - rightStartOffset);
          path.lineTo(fullW, ey + rightEndOffset);
        }

        if (drawBottom) {
          final sx = (borderMode.type == "half" && drawLeft) ? 0 : fullW;
          final ex = (borderMode.type == "half" && drawLeft) ? lenBottom : fullW - lenBottom;
          path.moveTo(sx + bottomStartOffset, fullH);
          path.lineTo(ex - bottomEndOffset, fullH);
        }

        if (drawLeft) {
          final sy = (borderMode.type == "half" && drawTop) ? 0 : fullH;
          final ey = (borderMode.type == "half" && drawTop) ? lenLeft : fullH - lenLeft;
          path.moveTo(0, sy + leftStartOffset);
          path.lineTo(0, ey - leftEndOffset);
        }

        return path;
      },
      child: child,
    );
  }
}