#!/bin/bash

banner() {
    echo -e "\e[38;5;208m" 
    cat << "EOF"
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠙⠻⢶⣄⡀⠀⠀⠀⢀⣤⠶⠛⠛⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠀⠀⣙⣿⣦⣤⣴⣿⣁⠀⠀⣸⠇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣡⣾⣿⣿⣿⣿⣿⣿⣿⣷⣌⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣷⣄⡈⢻⣿⡟⢁⣠⣾⣿⣦⠀⠀  
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⠘⣿⠃⣿⣿⣿⣿⡏⠀⠀⠀ ███████╗███╗   ███╗ █████╗ ██████╗ ████████╗    ██╗  ██╗██╗   ██╗███╗   ██╗████████╗███████╗██████╗ 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠈⠛⣰⠿⣆⠛⠁⠀⡀⠀⠀⠀⠀ ██╔════╝████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝    ██║  ██║██║   ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣦⠀⠘⠛⠋⠀⣴⣿⠁⠀⠀⠀⠀⠀███████╗██╔████╔██║███████║██████╔╝   ██║       ███████║██║   ██║██╔██╗ ██║   ██║   █████╗  ██████╔╝
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⡇⠀⠀⠀⢸⣿⣏⠀⠀⠀⠀⠀⠀╚════██║██║╚██╔╝██║██╔══██║██╔══██╗   ██║       ██╔══██║██║   ██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗
⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠀⠀⠀⠾⢿⣿⠀⠀⠀⠀⠀⠀███████║██║ ╚═╝ ██║██║  ██║██║  ██║   ██║       ██║  ██║╚██████╔╝██║ ╚████║   ██║   ███████╗██║  ██║
⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⡿⠟⠋⣁⣠⣤⣤⡶⠶⠶⣤⣄⠈⠀⠀⠀⠀⠀⠀╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
⠀⠀⠀⢰⣿⣿⣮⣉⣉⣉⣤⣴⣶⣿⣿⣋⡥⠄⠀⠀⠀⠀⠉⢻⣄⠀⠀⠀⠀⠀
⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣋⣁⣤⣀⣀⣤⣤⣤⣤⣄⣿⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠁⠀⠀⠀⠀⠈⠛⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
    echo -e "\e[0m"  
}

tratar_url_email_senha() {
    local arquivo="$1"
    local termo="$2"
    local diretorio="$3"
    local modulo="url_email_senha"  

    local resultado
    resultado=$(grep -a -I -n "$termo" "$arquivo" 2>/dev/null)

    if [[ -n "$resultado" ]]; then
        echo "$resultado" >> "$diretorio/result_search.txt"

        while IFS= read -r linha; do
            if [[ $linha =~ ([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}) ]]; then
                email="${BASH_REMATCH[1]}"
                echo "$email (origem: $modulo)" >> "$diretorio/user_list.txt" 
                echo "$email (origem: $modulo)" >> "$diretorio/user_list_${modulo}.txt" 

          
                senha=$(echo "$linha" | sed "s/$email://")
                if [[ -n "$senha" ]]; then
                    echo "$senha (origem: $modulo)" >> "$diretorio/pass_list.txt"  
                    echo "$senha (origem: $modulo)" >> "$diretorio/pass_list_${modulo}.txt" 
                fi
            fi
        done <<< "$resultado"
    fi
}


tratar_email_senha() {
    local arquivo="$1"
    local termo="$2"
    local diretorio="$3"
    local modulo="${4:-email_senha}"  

  
    if [[ -z "$arquivo" || -z "$termo" || -z "$diretorio" ]]; then
        echo "Erro: Arquivo, termo ou diretório não fornecido."
        exit 1
    fi
    if [[ ! -f "$arquivo" ]]; then
        echo "Erro: Arquivo '$arquivo' não encontrado."
        exit 1
    fi
    if [[ ! -d "$diretorio" ]]; then
        echo "Erro: Diretório '$diretorio' não encontrado."
        exit 1
    fi

    local resultado
    resultado=$(grep -a -I -n "$termo" "$arquivo" 2>/dev/null)

    if [[ -n "$resultado" ]]; then
        echo "$resultado" >> "$diretorio/result_search.txt"

        while IFS= read -r linha; do
            linha=$(echo "$linha" | tr -d '\r')  
            [[ "$linha" == *:* ]] || continue  
            email="${linha%%:*}"
            senha="${linha#*:}"

            # Valida e-mail
            if [[ $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
                echo "$email (origem: $modulo)" >> "$diretorio/user_list.txt"
                echo "$email (origem: $modulo)" >> "$diretorio/user_list_${modulo}.txt"
            fi

            # Valida senha
            if [[ -n "$senha" && ${#senha} -le 16 && "$senha" =~ ^[[:print:]]+$ ]]; then
                echo "$senha (origem: $modulo)" >> "$diretorio/pass_list.txt"
                echo "$senha (origem: $modulo)" >> "$diretorio/pass_list_${modulo}.txt"
            fi
        done <<< "$resultado"

        for file in user_list pass_list result_search; do
            sort -u "$diretorio/${file}.txt" -o "$diretorio/${file}.txt"
        done
    fi
}

tratar_blocos_user_pass() {
    local arquivo="$1"
    local termo="$2"
    local diretorio="$3"
    local modulo="blocos_user_pass"  

    local bloco=""
    local encontrou_termo=0

    while IFS= read -r line || [ -n "$line" ]; do
        if [[ -z "$line" ]]; then
            bloco=""
            encontrou_termo=0
        else
            if echo "$line" | grep -iq "^USER:"; then
                user=$(echo "$line" | sed 's/^USER: //')
                echo "$user (origem: $modulo)" >> "$diretorio/user_list.txt"  
                echo "$user (origem: $modulo)" >> "$diretorio/user_list_${modulo}.txt" 
            elif echo "$line" | grep -iq "^PASS:"; then
                pass=$(echo "$line" | sed 's/^PASS: //')
                echo "$pass (origem: $modulo)" >> "$diretorio/pass_list.txt" 
                echo "$pass (origem: $modulo)" >> "$diretorio/pass_list_${modulo}.txt" 
            fi

            if echo "$line" | grep -iq "$termo"; then
                encontrou_termo=1
            fi
        fi
    done < "$arquivo"

    sort -u -o "$diretorio/user_list.txt" "$diretorio/user_list.txt"
    sort -u -o "$diretorio/pass_list.txt" "$diretorio/pass_list.txt"
}

contar_arquivos() {
    local count=0
    shopt -s nullglob
    for file in *.txt; do
        [ -f "$file" ] && ((count++))
    done
    shopt -u nullglob
    echo "$count"
}


contar_arquivos_validos() {
    local count=0
    shopt -s nullglob
    for file in *.txt; do
        [ -f "$file" ] || continue
        if verificar_arquivo "$file"; then
            ((count++))
        fi
    done
    shopt -u nullglob
}


mostrar_progresso() {
    local atual=$1
    local total=$2
    local largura=50


    ((total == 0)) && total=1

    local preenchido=$((atual * largura / total))
    local vazio=$((largura - preenchido))
    local percentual=$((100 * atual / total))

    local cor_verde="\e[42m \e[0m"  
    local cor_cinza="\e[100m \e[0m" 

    printf "\r["
    
    for ((i = 0; i < preenchido; i++)); do
        printf "${cor_verde}"
    done
    for ((i = 0; i < vazio; i++)); do
        printf "${cor_cinza}"
    done

    printf "] %3d%% (%d/%d)" "$percentual" "$atual" "$total"

    sleep 0.1
}


main() {
    banner
    echo "Iniciando processamento..."

    read -rp "Informe o termo para busca: " termo
    if [[ -z "$termo" ]]; then
        echo "Erro: Nenhum termo informado."
        exit 1
    fi

    diretorio="$PWD/${termo// /_}"
    mkdir -p "$diretorio"

    [ ! -f "$diretorio/user_list.txt" ] && touch "$diretorio/user_list.txt"
    [ ! -f "$diretorio/pass_list.txt" ] && touch "$diretorio/pass_list.txt"
    [ ! -f "$diretorio/result_search.txt" ] && touch "$diretorio/result_search.txt"
    [ ! -f "$diretorio/Desconhecido.txt" ] && touch "$diretorio/Desconhecido.txt"

    total_arquivos=0
    arquivos_processados=0

    shopt -s nullglob
    for file in *.txt; do
        ((total_arquivos++))
        arquivos_processados=$((arquivos_processados + 1))

        resultado=$(grep -a -I -n "$termo" "$file" 2>/dev/null)
        if [[ -n "$resultado" ]]; then
            echo "$resultado" >> "$diretorio/result_search.txt"

            while IFS= read -r linha; do
                if [[ $linha =~ ([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}) ]]; then
                    email="${BASH_REMATCH[1]}"
                    echo "$email" >> "$diretorio/user_list.txt"
                fi

                senha=$(echo "$linha" | sed -n 's/.*:\(.*\)/\1/p')
                if [[ -n "$senha" ]]; then
                    echo "$senha" >> "$diretorio/pass_list.txt"
                fi
            done <<< "$resultado"
        fi

        mostrar_progresso "$arquivos_processados" "$total_arquivos"
    done
    shopt -u nullglob

    echo -e "\n"
    echo "✔️  Processamento concluído."
    echo " - Arquivos processados: $arquivos_processados"
    echo " - Usuários encontrados: $(wc -l < "$diretorio/user_list.txt")"
    echo " - Senhas encontradas:   $(wc -l < "$diretorio/pass_list.txt")"
}
main 
