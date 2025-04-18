[Principal](https://github.com/Mateus-cpa/Projeto_Git/blob/master/README.md)
# Poetry

## Instalação (apenas na primeira vez)
Ótima pergunta! Vamos ao passo a passo para configurar o ambiente virtual com Poetry para que ele funcione de forma consistente em seus projetos:

Passo 1: Instale o Poetry (se ainda não estiver instalado)

Se você ainda não tem o Poetry instalado no seu sistema, siga as instruções de instalação na documentação oficial:

```Bash
# Para Linux, macOS, WSL (método recomendado)
curl -sSL https://install.python-poetry.org | python3 -

# Para Windows (PowerShell)
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -
```

Após a instalação, pode ser necessário fechar e reabrir o terminal ou executar o seguinte comando para adicionar o Poetry ao seu PATH:
```Bash
export PATH="$HOME/.local/bin:$PATH"
```

Verificar se foi instalado
```Bash
poetry --version
```

## 2. Navegar para o relatório (cada vez que iniciar o projeto)

### 2.1. Após a instalação, pode ser necessário fechar e reabrir o terminal ou executar o seguinte comando para adicionar o Poetry ao seu PATH:

```Bash
cd seu_projeto
```

### 2.2. Inicialize seu projeto

Se você está começando um novo projeto ou ainda não configurou o Poetry neste projeto, execute o seguinte comando:
```Bash
poetry init
```

### 2.3. Adicione as dependências do projeto

Depois de inicializar o Poetry, você pode adicionar as dependências que seu projeto precisa. Use o comando `poetry add` seguido pelo nome do pacote.

Exemplo:
```Bash
poetry add requests
poetry add numpy pandas
poetry add pytest --dev  # Para dependências de desenvolvimento (testes, etc.)

```
O Poetry irá automaticamente baixar e instalar as dependências no ambiente virtual do seu projeto e atualizar os arquivos `pyproject.toml` e `poetry.lock`.

### 2.4. Deixe o Poetry gerenciar o ambiente virtual no projeto (verificação)

Por padrão, o Poetry configura o ambiente virtual dentro da pasta do seu projeto (.venv). Para garantir que essa configuração esteja ativa (e ativá-la, se necessário), execute:

```Bash
poetry config virtualenvs.in-project
```
Se a saída for true, está tudo certo. Se for false, o Poetry irá criar a pasta .venv na próxima vez que você executar um comando como poetry install.

### 2.5. Instale as dependências (se ainda não instaladas)

Se você já tinha um arquivo pyproject.toml ou acabou de criá-lo/editá-lo, execute o seguinte comando para instalar todas as dependências especificadas no arquivo:

```Bash
poetry install
```
Este comando irá criar o ambiente virtual (se ainda não existir), instalar todas as dependências listadas em `pyproject.toml` e gravar as versões exatas das dependências instaladas no arquivo `poetry.lock`. É crucial manter o arquivo `poetry.lock` no seu sistema de controle de versão (como Git) para garantir builds reproduzíveis.

### 2.6. Execute comandos dentro do ambiente virtual

Para executar scripts Python ou outros comandos dentro do ambiente virtual do seu projeto, use o prefixo poetry run.

```Bash
poetry run python seu_script.py
poetry run pytest
```
O `poetry run` garante que o comando seja executado com o interpretador Python e as bibliotecas instaladas no ambiente virtual específico do seu projeto.

## Fluxo de Trabalho Típico:

1. Navegue para o diretório do seu projeto.
2. O Poetry automaticamente detecta o arquivo pyproject.toml e utiliza o ambiente virtual associado (geralmente na pasta .venv).
3. Use poetry add para adicionar novas dependências.
4. Use poetry install para instalar todas as dependências (após clonar um projeto, por exemplo).
5. Use poetry run <comando> para executar scripts e ferramentas dentro do ambiente virtual.

Seguindo esses passos, você terá um ambiente virtual configurado e gerenciado pelo Poetry de forma consistente para o seu projeto. Cada projeto terá seu próprio ambiente isolado, evitando conflitos de dependências e facilitando a colaboração. Lembre-se sempre de executar os comandos do Poetry dentro do diretório do projeto.

## Erros frequentes
### Error: pyproject.toml changed significantly since poetry.lock was last generated. Run poetry lock [--no-update] to fix the lock file.

Este erro indica que o arquivo `pyproject.toml` (onde você define as dependências do seu projeto) foi alterado de forma significativa desde a última vez que o arquivo `poetry.lock` foi gerado. 

O arquivo `poetry.lock` garante que as mesmas versões exatas das dependências sejam instaladas em diferentes ambientes, tornando as builds reproduzíveis. A "mudança significativa" geralmente envolve adicionar, remover ou atualizar dependências no `pyproject.toml`.

Como lidar:

Existem duas abordagens principais para resolver este erro:

- Atualizar as dependências (recomendado na maioria dos casos): Se você adicionou, removeu ou quer atualizar as versões das suas dependências, você precisa que o Poetry resolva novamente as dependências e gere um novo arquivo `poetry.lock`. Execute o seguinte comando:

    ```Bash
    poetry update
    ```

    Este comando fará o seguinte:

    - Lerá o `pyproject.toml`.
    - Buscará as versões mais recentes das dependências que conforme as restrições definidas no pyproject.toml.
    - Instalará essas versões no seu ambiente virtual.
    - Atualizará o arquivo `poetry.lock` com as versões exatas instaladas.
- Reverter o `poetry.lock` para corresponder ao `pyproject.toml` (menos comum): Se você fez alterações no `pyproject.toml` por engano ou quer voltar ao estado anterior das dependências definidas no `pyproject.lock`, você pode usar o comando sugerido no erro:

    ```Bash
    poetry lock --no-update
    ```

    Este comando irá:

    - Ler o `pyproject.toml`.
    - Compará-lo com o `poetry.lock`.
    - Atualizar o `poetry.lock` para refletir as dependências exatas especificadas no `pyproject.toml`, sem tentar buscar novas versões. Use este comando com cautela, pois pode levar a incompatibilidades se as versões especificadas no `pyproject.toml` não estiverem mais disponíveis ou causarem conflitos.
    - Melhores práticas:

        - Sempre execute poetry lock ou poetry update após modificar o pyproject.toml.
        - Inclua tanto o pyproject.toml quanto o poetry.lock no seu sistema de controle de versão (como Git). Isso garante que todos os colaboradores do projeto usem as mesmas versões de dependências.

### Erro: Módulo não encontrado (ImportError: No module named 'nome_do_modulo')

O que significa: Este erro indica que o interpretador Python não consegue encontrar o módulo que você está tentando importar no seu código. Isso geralmente acontece quando o módulo não está instalado no ambiente virtual que o seu script está usando.

Como lidar:

Verifique se o módulo está listado nas dependências do seu projeto: Abra o arquivo `pyproject.toml` e procure pelo nome do módulo na seção [tool.poetry.dependencies] ou [tool.poetry.dev-dependencies] (se for uma dependência de desenvolvimento).

Se o módulo não estiver listado: Adicione-o usando o comando `poetry add`:

```Bash
poetry add nome_do_modulo
```
Se for uma dependência de desenvolvimento:

```Bash
poetry add --dev nome_do_modulo
```

Após adicionar, o Poetry irá instalar o módulo no seu ambiente virtual e atualizar o `pyproject.toml` e o `poetry.lock`.

Se o módulo estiver listado: Certifique-se de que o ambiente virtual do seu projeto está ativo. Embora o Poetry geralmente cuide disso quando você usa poetry run, se você estiver executando scripts diretamente, pode ser necessário ativar o ambiente virtual manualmente.

Se você configurou `virtualenvs.in-project` true (o padrão e recomendado), o ambiente virtual está na pasta `.venv` dentro do seu projeto. Você pode ativá-lo (embora geralmente não seja necessário ao usar poetry run):

Linux/macOS:
```Bash
source .venv/bin/activate
```
Windows (CMD):
```Bash
.venv\Scripts\activate

```
Windows (PowerShell):

```PowerShell

.venv\Scripts\Activate.ps1
```
Se você configurou um diretório central para os ambientes virtuais, localize a pasta do ambiente virtual correspondente ao seu projeto e siga as instruções de ativação acima.

Execute seu script usando `poetry run`: A maneira mais confiável de garantir que seu script utilize o ambiente virtual gerenciado pelo Poetry é executá-lo com `poetry run`:

```Bash
poetry run python seu_script.py
```
Isso garante que o Python usado seja o do ambiente virtual do projeto, onde as dependências estão instaladas.

Verifique se há erros de digitação: Certifique-se de que você digitou corretamente o nome do módulo tanto na instrução import no seu código quanto ao adicioná-lo com `poetry add`.


### Interpretador do VS Code e o Ambiente Virtual do Poetry

Para que o VS Code utilize o ambiente virtual correto gerenciado pelo Poetry, você precisa configurá-lo para usar o interpretador Python dentro desse ambiente virtual.

#### Passos para configurar o interpretador no VS Code

1. Abra a paleta de comandos: Pressione Ctrl+Shift+P (Windows/Linux) ou Cmd+Shift+P (macOS).

2. Procure por "Python: Selecionar Intérprete": Digite ou procure por este comando e selecione-o.

3. Selecione o interpretador correto: Uma lista de interpretadores Python disponíveis no seu sistema será exibida. Você precisa selecionar o interpretador que está dentro do ambiente virtual do seu projeto Poetry.

4. Se você usou poetry config virtualenvs.in-project true (padrão): Procure por um caminho que contenha a pasta .venv dentro do diretório do seu projeto. O caminho geralmente se parece com algo como:

```
/caminho/para/seu/projeto/.venv/bin/python
# ou
C:\caminho\para\seu\projeto\.venv\Scripts\python.exe
```

5. Se você configurou um diretório central para os ambientes virtuais: Procure pelo caminho do interpretador dentro da pasta do ambiente virtual correspondente ao seu projeto (geralmente com o nome do projeto ou um hash gerado pelo Poetry).

6. Verifique a seleção: Após selecionar o interpretador, o VS Code deve exibir o caminho do interpretador selecionado na barra de status na parte inferior da janela.

7. Extensão Python do VS Code: Certifique-se de ter a extensão oficial da Microsoft para Python instalada no VS Code. Ela facilita a detecção e configuração de ambientes virtuais.

8. Reiniciar o VS Code: Em alguns casos, pode ser necessário reiniciar o VS Code após selecionar o interpretador para que as alterações tenham efeito completo.

9. Ao configurar o interpretador correto no VS Code, o IntelliSense, linters, formatadores e a execução de scripts dentro do VS Code usarão as dependências instaladas no ambiente virtual do seu projeto Poetry, evitando erros de "Módulo não encontrado".

Seguindo essas dicas, você estará bem equipado para lidar com esses erros comuns ao usar o Poetry para gerenciar seus projetos Python! Se surgir alguma outra dúvida, pode perguntar.

[Principal](https://github.com/Mateus-cpa/Projeto_Git/blob/master/README.md)
