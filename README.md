O gerador de senhas permite ao usuário especificar o comprimento da senha e os tipos de caracteres a serem incluídos (letras maiúsculas, minúsculas, números e símbolos). Além disso, fornece uma simples interface de help no terminal, para que o usuário possa entender como o programa pode ser usado.

Uso: ./password-generator.sh [OPÇÕES]\
Opções:
<pre>
  -l [COMPRIMENTO] : comprimento da senha\
  -u               : incluir letras maiúsculas\
  -d               : incluir números\
  -s               : incluir símbolos\
  -h               : exibir essa mensagem de ajuda</pre>

O comportamento padrão do script é gerar uma senha de 8 caracteres minúsculos.