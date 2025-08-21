Future<void> demonstrarFormatException() async {
  print('▶️  DEMO 1: FormatException (Entrada de Dados Inválida)');
  String textoInvalido = 'abc';
  print('Tentando converter o texto "$textoInvalido" para um inteiro...');

  try {
    int.parse(textoInvalido);
  } on FormatException catch (e) {
    print('✅ Exceção capturada com sucesso!');
    print('   Tipo: FormatException');
    print('   Detalhes: $e');
  }
}
