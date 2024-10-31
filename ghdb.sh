#!/bin/bash
SEARCH="firefox"
ALVO="$1"

RED='\033[1;31m'
NC='\033[0m' 
echo -e "${RED}=========================="
echo -e "      DorkSearch"
echo -e "==========================${NC}"
echo
echo "Software para buscas avançadas no Google usando Google Dorks."
echo "Escolha um operador para refinar suas buscas e obter resultados específicos."
echo


usage() {
  echo "Modo de uso: $0 *termo_de_pesquisa*"
  echo "Este script realiza pesquisas no Google usando operadores de Google Dorks."
  echo
  echo "Argumentos:"
  echo "  *termo_de_pesquisa*    Termo ou site a ser pesquisado"
  echo
  echo "Operadores disponíveis:"
  echo "  1) site:       Pesquisar em um site específico"
  echo "  2) inurl:      Pesquisar URL com termo específico"
  echo "  3) intitle:    Pesquisar no título da página"
  echo "  4) filetype:   Pesquisar por tipo de arquivo"
  echo "  5) allintext:  Pesquisar texto específico no conteúdo da página"
  echo
  echo "Exemplo de uso:"
  echo "  $0 exemplo.com"
  exit 1
}


if [ -z "$ALVO" ]; then
  usage
fi


echo "Escolha o operador de Google Dork para a pesquisa:"
echo "1) site:    (pesquisar em um site específico)"
echo "2) inurl:   (pesquisar URL com termo específico)"
echo "3) intitle: (pesquisar no título da página)"
echo "4) filetype: (pesquisar por tipo de arquivo)"
echo "5) allintext: (pesquisar texto específico no conteúdo da página)"

read -p "Digite o número da opção desejada: " OPTION

case $OPTION in
  1)
    echo "Pesquisando no Google usando o operador 'site:'..."
    $SEARCH "https://www.google.com/search?q=site:$ALVO" 2> /dev/null
    ;;
  2)
    echo "Pesquisando no Google usando o operador 'inurl:'..."
    $SEARCH "https://www.google.com/search?q=inurl:$ALVO" 2> /dev/null
    ;;
  3)
    echo "Pesquisando no Google usando o operador 'intitle:'..."
    $SEARCH "https://www.google.com/search?q=intitle:$ALVO" 2> /dev/null
    ;;
  4)
    echo "Pesquisando no Google usando o operador 'filetype:'..."
    read -p "Digite a extensão do arquivo (ex: pdf, doc): " FILETYPE
    $SEARCH "https://www.google.com/search?q=filetype:$FILETYPE+$ALVO" 2> /dev/null
    ;;
  5)
    echo "Pesquisando no Google usando o operador 'allintext:'..."
    $SEARCH "https://www.google.com/search?q=allintext:$ALVO" 2> /dev/null
    ;;
  *)
    echo "Opção inválida. Saindo."
    exit 1
    ;;
esac
