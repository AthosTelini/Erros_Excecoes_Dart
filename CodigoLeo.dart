import 'dart:async';

void main() async {
  print('INÍCIO DAS DEMONSTRAÇÕES DE EXCEÇÕES\n');

  await demonstrarFormatException();

  print('\n----------------------------------------\n');

  await demonstrarErroDeRedeSimulado();

  print('\n----------------------------------------\n');

  await demonstrarErroDeArquivoSimulado();

  print('\n----------------------------------------\n');

  await demonstrarTimeoutException();

  print('\nFIM DAS DEMONSTRAÇÕES.');
}

// ===================================================================
// 1. FormatException
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

// ===================================================================
// 2. Erro de Rede (Simulado)
// Esta função já era 'async' e retornava um Future.
// ===================================================================
Future<void> demonstrarErroDeRedeSimulado() async {
  print('▶️  DEMO 2: Simulação de Erro de Rede (SocketException)');
  print('Tentando buscar dados de um servidor que não existe...');

  try {
    await simularRequisicaoComErro();
  } catch (e) {
    print('✅ Exceção capturada com sucesso!');
    print('   Tipo: Exception (Simulada)');
    print('   Detalhes: $e');
  }
}

Future<void> simularRequisicaoComErro() {
  return Future.delayed(Duration(seconds: 1), () {
    throw Exception('SocketException simulada: Falha ao conectar no host');
  });
}

// ===================================================================
// 3. Erro de Arquivo (Simulado)
// ===================================================================
Future<void> demonstrarErroDeArquivoSimulado() async {
  print('▶️  DEMO 3: Simulação de Erro de Arquivo (FileSystemException)');
  String arquivoInexistente = 'config.json';
  print('Tentando ler o arquivo "$arquivoInexistente"...');

  try {
    lerArquivoSimulado(arquivoInexistente);
  } catch (e) {
    print('✅ Exceção capturada com sucesso!');
    print('   Tipo: Exception (Simulada)');
    print('   Detalhes: $e');
  }
}

String lerArquivoSimulado(String path) {
  final sistemaDeArquivosFalso = {
    'usuarios.txt': 'conteúdo do arquivo de usuários',
  };

  if (sistemaDeArquivosFalso.containsKey(path)) {
    return sistemaDeArquivosFalso[path]!;
  } else {
    throw Exception(
      'FileSystemException simulada: O arquivo "$path" não foi encontrado.',
    );
  }
}

// ===================================================================
// 4. TimeoutException
// Esta função já era 'async' e retornava um Future.
// ===================================================================
Future<void> demonstrarTimeoutException() async {
  print('▶️  DEMO 4: TimeoutException (Operação Lenta)');
  print('Iniciando operação com limite de tempo de 2 segundos...');

  try {
    await Future.delayed(Duration(seconds: 3), () {
      // Reduzi o tempo para a demo ser mais rápida
      return 'Dados recebidos!';
    }).timeout(Duration(seconds: 2));
  } on TimeoutException catch (e) {
    print('✅ Exceção capturada com sucesso!');
    print('   Tipo: TimeoutException');
    print('   Detalhes: $e'.substring(0, 60) + '...');
  }
}
