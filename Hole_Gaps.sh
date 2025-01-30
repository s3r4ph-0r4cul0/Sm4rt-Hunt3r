#!/bin/bash


# Função: Exibe o banner ASCII
exibir_banner() {
    echo -e "\e[1;32m"  # Define cor verde
    cat << "EOF"
 /$$   /$$           /$$                                                         
| $$  | $$          | $$                                                         
| $$  | $$  /$$$$$$ | $$  /$$$$$$         /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$$
| $$$$$$$$ /$$__  $$| $$ /$$__  $$       /$$__  $$ |____  $$ /$$__  $$ /$$_____/
| $$__  $$| $$  \ $$| $$| $$$$$$$$      | $$  \ $$  /$$$$$$$| $$  \ $$|  $$$$$$ 
| $$  | $$| $$  | $$| $$| $$_____/      | $$  | $$ /$$__  $$| $$  | $$ \____  $$
| $$  | $$|  $$$$$$/| $$|  $$$$$$$      |  $$$$$$$|  $$$$$$$| $$$$$$$/ /$$$$$$$/
|__/  |__/ \______/ |__/ \_______/       \____  $$ \_______/| $$____/ |_______/ 
                                         /$$  \ $$          | $$                
                                        |  $$$$$$/          | $$                
                                         \______/           |__/                

⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠙⠻⢶⣄⡀⠀⠀⠀⢀⣤⠶⠛⠛⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⣙⣿⣦⣤⣴⣿⣁⠀⠀⣸⠇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣡⣾⣿⣿⣿⣿⣿⣿⣿⣷⣌⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣷⣄⡈⢻⣿⡟⢁⣠⣾⣿⣦⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⠘⣿⠃⣿⣿⣿⣿⡏⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠈⠛⣰⠿⣆⠛⠁⠀⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣦⠀⠘⠛⠋⠀⣴⣿⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⡇⠀⠀⠀⢸⣿⣏⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠀⠀⠀⠾⢿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⡿⠟⠋⣁⣠⣤⣤⡶⠶⠶⣤⣄⠈⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢰⣿⣿⣮⣉⣉⣉⣤⣴⣶⣿⣿⣋⡥⠄⠀⠀⠀⠀⠉⢻⣄⠀⠀⠀⠀⠀
⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣋⣁⣤⣀⣀⣤⣤⣤⣤⣄⣿⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠁⠀⠀⠀⠀⠈⠛⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
    echo -e "\e[0m"  # Reseta cor
}



# Função: Solicita o termo de busca ao usuário
solicitar_termo() {
    read -rp "Informe o termo para busca: " termo
    if [[ -z "$termo" ]]; then
        echo "Erro: Nenhum termo foi informado."
        exit 1
    fi
}

# Função: Configura diretório e arquivos de saída
configurar_ambiente() {
    diretorio="$PWD/$(echo "$termo" | tr ' ' '_')"
    mkdir -p "$diretorio"

    result_file="$diretorio/result_search-$(date +%d-%m-%Y).txt"
    user_file="$diretorio/user_list.txt"
    pass_file="$diretorio/pass_list.txt"
}

# Função: Retorna o tipo MIME de um arquivo
identificar_tipo_arquivo() {
    file --mime-type -b "$1"
}

# Função: Executa a busca nos arquivos e salva os resultados
executar_busca() {
    local arquivo="$1"
    local tipo=$(identificar_tipo_arquivo "$arquivo")
    local resultado=""

    case "$tipo" in
        text/* | application/octet-stream)
            resultado=$(grep --color=auto -a -I -n "$termo" "$arquivo" 2>/dev/null)
            ;;
        application/gzip)
            resultado=$(zgrep --color=auto -n "$termo" "$arquivo" 2>/dev/null)
            ;;
        *)
            return
            ;;
    esac

    if [[ -n "$resultado" ]]; then
        echo "$resultado" >> "$result_file"
        extrair_dados "$resultado"
    fi
}

# Função: Extrai e-mails e senhas dos resultados encontrados
extrair_dados() {
    local resultado="$1"

    while IFS= read -r linha; do
        senha=${linha##*:}  # Captura tudo após o último ":"
        linha_sem_senha=${linha%:*}  # Remove a senha

        # Verifica se a senha tem no máximo 16 caracteres antes de salvá-la
        if [[ ${#senha} -le 16 ]]; then
            [[ -n "$senha" ]] && echo "$senha" >> "$pass_file"
        fi

        # Valida se há um e-mail na linha antes de armazená-lo
        if [[ $linha_sem_senha =~ ([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}) ]]; then
            email=${BASH_REMATCH[1]}
            [[ -n "$email" ]] && echo "$email" >> "$user_file"
        fi
    done <<< "$resultado"
}

# Função: Notifica o usuário sobre a conclusão da busca
notificar_conclusao() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send "Busca concluída" "Os resultados foram salvos em: $diretorio"
    fi
    echo "Busca concluída. Resultados salvos em: $diretorio"
}

# Função Principal
main() {
    exibir_banner
    solicitar_termo
    configurar_ambiente
    IFS=$'\n'
    for arquivo in $(find . -maxdepth 1 -type f ! -name "$(basename "$0")"); do
        executar_busca "$arquivo"
    done

    notificar_conclusao
}

# Executa o script
main
