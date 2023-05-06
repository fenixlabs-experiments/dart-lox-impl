import 'error_reporter.dart';
import 'token.dart';

const Map<String, TokenType> _keywordTypes = {'and': TokenType.$and};

class Scanner {
  final String _source;
  final ErrorReporter _errorReport;
  final List<Token> _tokens = [];
  int _offset = 0;
  final int _tokenStart = 0;
  int _line = 1;
  int _lineStart = 0;

  Scanner(this._source, this._errorReport);

  bool _isAtEnd() => _offset >= _source.length;

  void _addToken(TokenType type, [Object? value]) {
    final lexeme = _isAtEnd() ? '' : _source.substring(_tokenStart, _offset);
    _tokens.add(Token(type, lexeme, value, _line));
  }

  List<Token> scanTokens() {
    while (!_isAtEnd()) _scanToken();

    _addToken(TokenType.eof);
    return _tokens;
  }

  void _scanToken() {
    _tokenStart = _offset;

    final next = _advance();
    switch (next) {
      case $lparenthesis:
        _addToken(TokenType.leftParenthesis);
    }
  }

  int _advance() {
    final char = _source.codeUnitAt(_offset++);

    if (char == $lf && !_isAtEnd()) {
      _line++;
      _lineStart = _offset;
    }

    return char;
  }
}
