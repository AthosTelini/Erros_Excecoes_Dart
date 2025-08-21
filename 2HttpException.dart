import 'dart:io';

void main() {
  try {
    throw HttpException("Erro ao acessar servidor", uri: Uri.parse("https://google.com"));
  } on HttpException catch (e) {
    print("Erro capturado: $e");
    print("Mensagem personalizada: Falha ao acessar a URL ${e.uri}");
  }
}
