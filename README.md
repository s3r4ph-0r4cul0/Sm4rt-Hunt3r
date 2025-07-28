<p align="center">
   🕵️ Sm4rhünt3r
</p>

Script Bash para varredura e extração de credenciais em massa a partir de arquivos `.txt`, com foco em dumps vazados. Ideal para análises manuais, automações de coleta e separação de dados úteis por padrão.

<p align="center">
  <img src="https://img1.picmix.com/output/stamp/normal/1/0/5/2/2572501_250d1.gif" alt="Cloud Exploit GIF" width="200"/>
</p>


---

## 💡 Objetivo

Extrair e organizar e-mails e senhas de forma automatizada, com base em um **termo de busca** (ex: `gmail`, `@empresa.com`, `123456`), presente em arquivos `.txt`.

---

## 📥 Formatos suportados

O script reconhece os seguintes padrões:

- `email:senha`  
user@example.com:123456


- `url:email:senha`  
http://site.com/login:user@example.com:senha123


- Blocos:
USER: user@example.com
PASS: senha123

---

## ▶️ Como usar

1. Coloque o `sSmarthunter.sh` no mesmo diretório dos arquivos `.txt`
2. Dê permissão de execução:
 ```bash
 chmod +x Smarthunter.sh
./hunter.sh
