enum TokenType {
  leftParenthesis,
  rightParenthesis,
  leftBrace,
  rightBrace,
  comma,
  dot,
  minux,
  plus,
  semicolon,
  slash,

  $and,
  $class,
  $else,
  $false,
  $fun,
  $for,
  $if,
  $nil,
  $or,
  $print,
  $return,
  $super,
  $this,
  $true,
  $var,
  $while,

  eof
}

class Token {
  final TokenType type;
  final String lexeme;
  final Object value;
  final int line;

  const Token(this.type, this.lexeme, this.value, this.line);

  @override
  String toString() => '$type ${value ?? lexeme}';
}
