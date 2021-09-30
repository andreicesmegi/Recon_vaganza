#!/bin/bash


echo "----------------------------"
echo "----------------------------"
echo "  ***  Recon_Vaganza  ***   "
echo "----------------------------"
echo "----------------------------"

echo ""
echo "Informe o site:"
read site

echo ""
echo "Selecione uma lista:"
echo "Press 1 for Lista 1 - 41 itens"
echo "Press 2 for Lista 2 - Mil itens"
echo "Press 3 for Lista 3 - 28 itens"
echo "Press 4 for Lista 4 - 20 mil itens"
echo ""
read list

if [ $list == "1" ];then
        Load_list=lista1.txt
elif [ $list == "2" ];then
        Load_list=lista2.txt
elif [ $list == "3" ];then
        Load_list=lista3.txt
elif [ $list == "4" ];then
        Load_list=lista4.txt
else
        echo "INVALIDO!!!!"
        echo""
        exit
fi

Total=$(wc -w $Load_list | cut -d " " -f 1)
echo ""
echo "Esta lista contem $Total palavras."

echo ""
echo ".... ---> Scanninnnng   :)"
echo ""

echo "----------------------------"
echo "    ARQUIVOS ENCONTRADOS    "
echo "----------------------------"

for palavra in $(cat $Load_list);do
resp=$(curl -s -H "user-agent: Obaoba" -o /dev/null -w "%{http_code}" $site/$palavra)

if [ $resp == "200" ];then
        echo "$site/$palavra"
        echo ""
fi
done

echo "++++++++++++++++++++++++++++++"
echo "   DIRETORIOS ENCONTRADOS     "
echo "++++++++++++++++++++++++++++++"

for palavraz in $(cat $Load_list);do
resp_1=$(curl -s -H "user-agent: Obaoba" -o /dev/null -w "%{http_code}" $site/$palavraz/)

if [ $resp_1 == "200" ];then
        echo "$site/$palavraz/"
        echo ""
fi
done
