/// HeadType
enum HeadType {
  /// h1
  h1('h1'),

  /// h2
  h2('h2'),

  /// h3
  h3('h3'),

  /// h4
  h4('h4'),

  /// h5
  h5('h5'),
  ;

  const HeadType(this.label);

  final String label;

  // 文字列でh1やh2を受け取ってHeadTypeに変換する
  static HeadType fromString(String value) {
    switch (value) {
      case 'h1':
        return HeadType.h1;
      case 'h2':
        return HeadType.h2;
      case 'h3':
        return HeadType.h3;
      case 'h4':
        return HeadType.h4;
      case 'h5':
        return HeadType.h5;
      default:
        return HeadType.h5;
    }
  }

  bool get isTitle => this == HeadType.h1 || this == HeadType.h2;
}
