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
    echo -e "\e[0m"  # Reseta cor
}


# Trata arquivos com formato URL:EMAIL:SENHA
tratar_url_email_senha() {
    local arquivo="$1"
    local termo="$2"
    local diretorio="$3"
    local modulo="url_email_senha"  # Identificador do módulo

    local resultado
    resultado=$(grep -a -I -n "$termo" "$arquivo" 2>/dev/null)

    if [[ -n "$resultado" ]]; then
        echo "$resultado" >> "$diretorio/result_search.txt"

        while IFS= read -r linha; do
            # Extrai email usando regex
            if [[ $linha =~ ([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}) ]]; then
                email="${BASH_REMATCH[1]}"
                echo "$email (origem: $modulo)" >> "$diretorio/user_list.txt"  # Adiciona a origem
                echo "$email (origem: $modulo)" >> "$diretorio/user_list_${modulo}.txt" # Salva em arquivo específico do módulo

                # Remove o email da linha para obter a senha
                senha=$(echo "$linha" | sed "s/$email://")
                if [[ -n "$senha" ]]; then
                    echo "$senha (origem: $modulo)" >> "$diretorio/pass_list.txt"  # Adiciona a origem
                    echo "$senha (origem: $modulo)" >> "$diretorio/pass_list_${modulo}.txt" # Salva em arquivo específico do módulo
                fi
            fi
        done <<< "$resultado"
    fi
}

# Trata arquivos com formato EMAIL:SENHA
tratar_email_senha() {
    local arquivo="$1"
    local termo="$2"
    local diretorio="$3"
    local modulo="${4:-email_senha}"  # Permite definir o módulo externamente

    # Verificar entradas
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
            linha=$(echo "$linha" | tr -d '\r')  # Normaliza \r\n → \n
            [[ "$linha" == *:* ]] || continue   # Ignora linhas malformadas
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

        # Deduplicação consolidada
        for file in user_list pass_list result_search; do
            sort -u "$diretorio/${file}.txt" -o "$diretorio/${file}.txt"
        done
    fi
}

# Trata arquivos com blocos USER:\nPASS:
tratar_blocos_user_pass() {
    local arquivo="$1"
    local termo="$2"
    local diretorio="$3"
    local modulo="blocos_user_pass"  # Identificador do módulo

    local bloco=""
    local encontrou_termo=0

    while IFS= read -r line || [ -n "$line" ]; do
        if [[ -z "$line" ]]; then
            bloco=""
            encontrou_termo=0
        else
            if echo "$line" | grep -iq "^USER:"; then
                user=$(echo "$line" | sed 's/^USER: //')
                echo "$user (origem: $modulo)" >> "$diretorio/user_list.txt"  # Adiciona a origem
                echo "$user (origem: $modulo)" >> "$diretorio/user_list_${modulo}.txt" # Salva em arquivo específico do módulo
            elif echo "$line" | grep -iq "^PASS:"; then
                pass=$(echo "$line" | sed 's/^PASS: //')
                echo "$pass (origem: $modulo)" >> "$diretorio/pass_list.txt"  # Adiciona a origem
                echo "$pass (origem: $modulo)" >> "$diretorio/pass_list_${modulo}.txt" # Salva em arquivo específico do módulo
            fi

            if echo "$line" | grep -iq "$termo"; then
                encontrou_termo=1
            fi
        fi
    done < "$arquivo"

    # Deduplicação
    sort -u -o "$diretorio/user_list.txt" "$diretorio/user_list.txt"
    sort -u -o "$diretorio/pass_list.txt" "$diretorio/pass_list.txt"
}

# Função para contar arquivos de forma segura
contar_arquivos() {
    local count=0
    shopt -s nullglob
    for file in *.txt; do
        [ -f "$file" ] && ((count++))
    done
    shopt -u nullglob
    echo "$count"
}


# Função para contar arquivos válidos
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


# Função para verificar se arquivo é válido


# Função para criar barra de progresso
mostrar_progresso() {
    local atual=$1
    local total=$2
    local largura=50

    # Evita divisão por zero
    ((total == 0)) && total=1

    local preenchido=$((atual * largura / total))
    local vazio=$((largura - preenchido))
    local percentual=$((100 * atual / total))

    # Cores ANSI
    local cor_verde="\e[42m \e[0m"  # bloco verde
    local cor_cinza="\e[100m \e[0m" # bloco vazio cinza

    printf "\r["
    
    for ((i = 0; i < preenchido; i++)); do
        printf "${cor_verde}"
    done
    for ((i = 0; i < vazio; i++)); do
        printf "${cor_cinza}"
    done

    printf "] %3d%% (%d/%d)" "$percentual" "$atual" "$total"
    # Adiciona um pequeno atraso para visualização
    sleep 0.1
}

# Main
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

    # Garante que os arquivos existem
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
