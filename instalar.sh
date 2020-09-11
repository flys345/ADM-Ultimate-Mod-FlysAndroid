error_fun () {
msg -bar2 && msg -verm "$(source trans -b pt:${id} "Esta Chave Era de Outro Servidor Portanto Foi Excluida"|sed -e 's/[^a-z -]//ig') " && msg -bar2
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}
exit 1
}
invalid_key () {
msg -bar2 && msg -verm "Key Failed! " && msg -bar2
[[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq
exit 1
}
Key="qra-atsilK?29@%6087%?66d5K8888:%05+08+@@?+91"
REQUEST=$(echo $SCPresq|$SUB_DOM)
IP="104.238.135.147" && echo "$IP" > /usr/bin/vendor_code
cd $HOME
msg -ne "Key: "
wget -O $HOME/lista-arq ${REQUEST}/lista-arq > /dev/null 2>&1 && echo -e "\033[1;32m Verified" || {
   echo -e "\033[1;32m Verified"
   invalid_key
   exit
   }
sleep 1s
updatedb
if [[ -e $HOME/lista-arq ]] && [[ ! $(cat $HOME/lista-arq|grep "KEY INVALIDA!") ]]; then
   msg -bar2
   msg -ama "$(source trans -b pt:${id} "BEM VINDO, OBRIGADO POR UTILIZAR"|sed -e 's/[^a-z -]//ig'): \033[1;31m[NEW-ULTIMATE]"
   [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
   pontos="."
   stopping="$(source trans -b pt:${id} "Verificando Atualizacoes"|sed -e 's/[^a-z -]//ig')"
   for arqx in $(cat $HOME/lista-arq); do
   msg -verm "${stopping}${pontos}"
   wget -O ${SCPinstal}/${arqx} ${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" || error_fun
   tput cuu1 && tput dl1
   pontos+="."
   done
   sleep 1s
   msg -bar2
   listaarqs="$(locate "lista-arq"|head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs   
   cat /etc/bash.bashrc|grep -v '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' > /etc/bash.bashrc.2
   echo -e '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' >> /etc/bash.bashrc.2
   mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
   echo "${SCPdir}/menu" > /usr/bin/menu && chmod +x /usr/bin/menu
   echo "${SCPdir}/menu" > /usr/bin/adm && chmod +x /usr/bin/adm
   echo "/etc/newadm/menu" > /bin/h && chmod +x /bin/h > /dev/null 2>&1
   wget -O /root/versao https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/ADM-ULTIMATE-NEW-FREE/master/versao &> /dev/null
   inst_components
   echo "$Key" > ${SCPdir}/key.txt
   [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}   
   [[ ${#id} -gt 2 ]] && echo "pt" > ${SCPidioma} || echo "${id}" > ${SCPidioma}
   [[ ${byinst} = "true" ]] && install_fim
else
invalid_key
fi
