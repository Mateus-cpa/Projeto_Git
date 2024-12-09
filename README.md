# Projeto Git
Este é um teste de utilização de comandos Git, realizar versionamento conexão do VS Code ao GitHub através de chave SSH.
Arquivo .env não deveria ter ido no commit, mas valeu como teste.
Padrões de Commits: https://github.com/iuricode/padroes-de-commits

## Comandos
- mkdir = make directory
- rmdir = remove directory (somente se vazio)

- rm -r <nome da pasta no diretório> = limpar arquivos de pasta

- pip freeze | grep -v "^-e" | xargs pip uninstall -y = Limpar todas dependências

### 1. Criar ambiente virtual:
- python -m venv .venv

### 2. Ativar:
- source .venv/Scripts/activate

### 3. Instalar bibliotecas
- pip install `biblioteca`

### 4. Desativar:
- deactivate