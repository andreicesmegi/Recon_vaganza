#!/bin/bash


echo "----------------------------"
echo "----------------------------"
echo "  ***  Recon_Vaganza  ***   "
echo "----------------------------"
echo "----------------------------"


echo ""
echo "Informe o site:"
read site

echo "----------------------------"
echo "    ARQUIVOS ENCONTRADOS    "
echo "----------------------------"

for palavra in $(cat lista3.txt)
do
resp=$(curl -s -H "user-agent: Desectool" -o /dev/null -w "%{http_code}" $site/$palavra)

if [ $resp == "200" ];then
        echo "$site/$palavra"
        echo ""
fi
done


echo "++++++++++++++++++++++++++++++"
echo "   DIRETORIOS ENCONTRADOS     "
echo "++++++++++++++++++++++++++++++"

for palavra in $(cat lista3.txt)
do
resp_1=$(curl -s -H "user-agent: Desectool" -o /dev/null -w "%{http_code}" $site/$palavra/)

if [ $resp_1 == "200" ];then
        echo "$site/$palavra/"
        echo ""
fi
done
