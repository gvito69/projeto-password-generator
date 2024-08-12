#!/bin/bash
# Função para exibir a ajuda
function show_help() {
 echo "Bem vindo ao password-generator! Versão 1.0, (c) 2024, Guilherme Vitor e Vinícius César, DIMAp, UFRN"
 echo "Uso: ./password-generator.sh [OPÇÕES]"
 echo "  -l [COMPRIMENTO] : comprimento da senha"
 echo "  -u               : incluir letras maiúsculas"
 echo "  -d               : incluir números"
 echo "  -s               : incluir símbolos"
 echo "  -h               : exibir essa mensagem de ajuda"
 echo " "
 echo "O comportamento padrão do script é gerar uma senha de 8 caracteres minúsculos."
}

# Definir variáveis padrão
LENGTH=8
USE_UPPERCASE=false
USE_DIGITS=false
USE_SYMBOLS=false

# Parsear argumentos
OPTIND=1

while getopts "l:udsh" opt; do
  case "$opt" in
    l) LENGTH="$OPTARG" ;;
    u) USE_UPPERCASE=true ;;
    d) USE_DIGITS=true;;
    s) USE_SYMBOLS=true ;;
    h) show_help ; exit 0 ;;
  esac
done

# Definir conjuntos de caracteres
LOWERCASE="abcdefghijklmnopqrstuvwxyz"
UPPERCASE="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS="0123456789"
SYMBOLS="!@#$%^&*()-_=+[]{}|;:,.<>?/~"

# # Construir a lista de caracteres permitidos
ALL_CHARACTERS="$LOWERCASE"
if $USE_UPPERCASE; then
  ALL_CHARACTERS="$ALL_CHARACTERS$UPPERCASE"
fi
if $USE_DIGITS; then
  ALL_CHARACTERS="$ALL_CHARACTERS$DIGITS"
fi
if $USE_SYMBOLS; then
  ALL_CHARACTERS="$ALL_CHARACTERS$SYMBOLS"
fi

# Gerar a senha: 
# o /dev/urandom gera bytes aleatórios, para conseguir
# uma senha precisamos limpar esses bytes de alguma forma
PASSWORD=$(cat /dev/urandom) 

# Exibir a senha gerada
echo "Senha gerada: $PASSWORD"

# # Opcional: salvar a senha em um arquivo criptografado
# # Implemente como essa senha será criptografada com o openssl
# echo $PASSWORD >> password.txt.enc
