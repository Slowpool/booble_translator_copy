class CopyrightText {
  final String copyrightText;

  CopyrightText({
    required this.copyrightText,
  });

  Map<String, Object?> toMap() {
    return {
      'copyright_text': copyrightText,
    };
  }

  @override
  String toString() {
    return 'copyright_text{copyright_text: $copyrightText}';
  }
}
