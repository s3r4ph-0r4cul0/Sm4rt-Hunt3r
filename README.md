# 🔍 Script de Busca com Grep

Este repositório contém um script em **Bash** que realiza buscas em arquivos do diretório atual utilizando o `grep`. O script extrai informações relevantes, como e-mails e senhas, e salva os resultados em arquivos organizados.

## 📌 Funcionalidades
- Exibição de um **banner ASCII** ao iniciar.
- Solicitação de um **termo de busca** ao usuário.
- Identificação automática do tipo de arquivo.
- Busca em arquivos de texto e compactados (`gzip`).
- Extração e separação de e-mails e senhas.
- Notificação ao final do processo.

## 🚀 Como Usar

### 1️⃣ Clonar o Repositório
```bash
git clone https://github.com/AnubisChacal/Hole_Gaps.git
cd seu-repositorio
```

### 2️⃣ Tornar o Script Executável
```bash
chmod +x grep.sh
```

### 3️⃣ Executar o Script
```bash
./grep.sh
```

O script solicitará um termo de busca e iniciará a varredura no diretório atual.

## 📂 Estrutura de Saída
Após a execução, os resultados serão armazenados em uma pasta nomeada com o termo de busca:
```
/seu-diretorio/
  ├── termo_de_busca/
  │   ├── result_search-DD-MM-YYYY.txt  # Resultados completos
  │   ├── user_list.txt                 # Lista de e-mails encontrados
  │   ├── pass_list.txt                 # Lista de senhas extraídas
```


