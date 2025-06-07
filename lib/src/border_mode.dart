/// BorderMode is an abstraction that defines the length of a border segment.
/// You can use [BorderMode.full] or [BorderMode.half] and then add/subtract offsets.
class BorderMode {
  final String type; // "full" or "half"
  final double offset;

  const BorderMode._(this.type, this.offset);

  /// Use this to draw full-length borders.
  static const BorderMode full = BorderMode._("full", 0);

  /// Use this to draw half-length borders.
  static const BorderMode half = BorderMode._("half", 0);

  BorderMode operator +(double value) => BorderMode._(type, offset + value);
  BorderMode operator -(double value) => BorderMode._(type, offset - value);

  double calculateLength(double baseLength) {
    return (type == "half" ? baseLength / 2 : baseLength) + offset;
  }

  @override
  String toString() => "$type + $offset";
}
