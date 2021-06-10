#!/bin/bash

while true
do
	arquivo=$(zenity --file-selection --title="Escolha o arquivo")
	opcao=$(zenity --list \
		--column='Códigos' --column='Opções' \
		--title='Escolha a opção' \
		--text "Escolha a opção" \
			"1" "Números de palavras do arquivo escolhido" \
			"2" "Números de caracteres do arquivo escolhido" \
			"3" "Números de parágrafos do arquivo escolhido" \
			"4" "Total de números do arquivo escolhido" \
			"5" "Números de letras do arquivo escolhido" \
			"6" "Palavras diferentes do arquivo escolhido" \
			"7" "Substituir palavras do arquivo escolhido" \
			"S" "sair do programa" --height=350 --width=450)
	case $opcao in
		'1')
		zenity --info --title="saida do comando" --text="Existem o total de $(cat $arquivo | egrep -o '\w+' | grep '[a-zA-Z]' | wc -l) palavras nesse arquivo" --height=170 --width=360 ;;
	
		'2')
		zenity --info --title="saida do comando" --text="Existem o total de $(wc -m < $arquivo) de caracteres nesse arquivo" --height=170 --width=360 ;;
	
		'3')
		zenity --info --title="saida do comando" --text="Existem o total de $(grep -o -P '\t' $arquivo | wc -l) parágrafos nesse arquivo" --height=170 --width=360 ;;
	
		'4')
	zenity --info --title="saida do comando" --text="Existem o total de $(grep -Eo [0-9] $arquivo | wc -w) números nesse arquivo" --height=170 --width=360 ;;

		'5')	
		zenity --info --title="saida do comando" --text="Existem o total de $(grep -Eo [a-zA-Z] $arquivo | wc -w) letras nesse arquivo" --height=170 --width=360 ;;
	
		'6')
		zenity --info --title="saida do comando" --text="Existem o total de $(cat $arquivo | egrep -o '\w+' | sort | uniq -c | grep '[a-zA-Z]' | grep '1' | wc -l) palavras diferentes nesse arquivo" --height=170 --width=360 ;;

		'7')
		nome1=$(zenity --entry --text="digite a palavra para substituir:")
		nome2=$(zenity --entry --text="trocar o $nome1 por qual palavra?")
		zenity --info --title="saida do comando" --text="$(sed "s/$nome1/$nome2/g" $arquivo)" --height=450 --width=450 ;;

		'S')
		break ;;
		
		*)
		break ;;
	esac
done
