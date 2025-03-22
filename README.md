# Projeto Git
Este é um passo a passo para de utilização de comandos Git, realizar versionamento conexão do VSCode ao GitHub através de chave SSH.

## `SETUP DO COMPUTADOR` (somente na primeira vez)

### 0.1. Instalar Git no COMPUTADOR

### 0.2. Instalar Python

### 0.3. Instalar pipx e poetry

### 0.4. Configurar SSH do Git Hub
Fonte: https://github.com/lvgalvao/data-engineering-roadmap/tree/main/Workshop%20-%20Git%20e%20Github/Aula_02

### 0.5. Configurar versões de Python
- `pyenv versions`: verificar versões instaladas
- `pyenv install <versão>`: instalar versão de python
- `pyenv global <versão>`: configurar versão global de python para todos Projetos
- `pip freeze | grep -v "^-e" | xargs pip uninstall -y`: limpa o pip list

### 0.6 Instalar Docker



## `SETUP DO PROJETO`
## 1. No terminal Bash (caso seja a primeira vez)
- Navegar até a pasta onde será criada a pasta utilizando comandos 'cd'. Você pode iniciar utilizando a pasta 'cd ~' para navegar para o PATH que você configurou nas variáveis de ambiente.
- `mkdir <nome da nova pasta>`: se for criar pasta nova.
- `cd <nome da pasta criada>`: abre pasta que você criou.
- Não fechar janela durante a configuração do GitHub.

## 2. No GitHub
- Criar Repositório.
- Copiar o código gerado no Github para configurar a pasta, desde `echo` at[e `main`.
- Neste código você estará:
1. Incluindo o Título no README.md;
2. Iniciando Git
3. Adicionando README no status staged
4. Comprometendo git local (commit) com a mensagem 'first commit'
5. Definindo a branch com o nome `main`
6. Apontando seu projeto ao repositório remoto Githhub que você criou neste passo
7. Enviando arquivos comprometidos ao git remoto criado no Github.

## 3. De volta do Git Bash:
- Colar o código
- `code .`: para abrir a IDE VSCode já configurado.
- Na pasta inicial já virão criados a pasta <span style="background-color:rgba(235, 235, 139, 0.55)">.git</span> e o arquivo Markdown <span style="background-color:rgba(235, 235, 139, 0.55)">*README.md*</span>.
- Pastas iniciadas com '.' são ocultas, caso seu VSCode não as mostre, configure-o da seguinte forma:
a. Vá em Settings 
b. Busque pelo menu de Exclude 
c. Escolha os arquivos que você queira ver/ocultar arquivos ocultos (.git, por exemplo)

## 4. No Terminal do VSCode 
- Alterar terminal de PowerShell para Bash, caso já não esteja.
- `pyenv local <versão>`: para configurar a versão python da pasta, criando o arquivo <span style="background-color:rgba(235, 235, 139, 0.55)">.python-version</span> 
-- OBS: escolher a versão mais moderna da biblioteca que você quer trabalhar

### 4.a. Ativar ambiente virtual com pyenv

- `python -m venv .venv`: utiliza o comando python "-m" (módulo) ".venv".
Conforme o terminal:
    - BASH: `source <nome_do_ambiente>/Scripts/activate`
    - CMD: `<nome_do_ambiente>/Scripts/activate.bat`
    - POWERSHELL: `<nome_do_ambiente>/Scripts/activate.ps1`
- Assim aparecerá venv no terminal.

### 4.b. Ativar ambiente virtual com poetry
- `poetry init`: cria o arquivo <span style="background-color:rgba(235, 235, 139, 0.55)">pyproject.toml</span> e a pasta <span style="background-color:rgba(235, 235, 139, 0.55)">.venv</span>'
- `poetry env use <versão python do pyenv local>`
- `poetry shell`

### 4.2. Git ignore
- Gere o arquivo <span style="background-color:rgba(235, 235, 139, 0.55)">.gitignore</span> e coloque os arquivos que não serão adicionados ao Git. 
- Sugestões: .venv e outros arquivos de interesse.
- Lista de Sugestões: https://www.toptal.com/developers/gitignore/api/python

## 5. [Docker](https://github.com/Mateus-cpa/Projeto_Git/blob/master/docker_manual.md)




# Comandos bash/powershell/linux
Fonte: https://www.redhat.com/en/blog/Linux-file-navigation-commands, 
Powershell Cheat Sheet: https://download.microsoft.com/download/2/1/2/2122f0b9-0ee6-4e6d-bfd6-f9dcd27c07f9/ws12_quickref_download_files/powershell_langref_v3.pdf

- `pwd` (present working directory) = mostrar diretório atual
- `tree` = mostrar diretório em forma gráfica
- `ls` (list) = mostrar os arquivos não ocultos
- `ls -al` (list all) = mostrar todos

- `cd` "diretório" (change directory) = navegar para novo diretório
- `cd /c:/User/xxx/Documents/Projetos` = mover-se diretamente para diretório
- `cd ..` = ir para a pasta um nível acima

- `mkdir` (make directory) = criar uma pasta

- `rmdir` (remove directory) = excluir uma pasta (somente se vazio)

- `touch <nome do documento>` = criar documento

- `rm -r <nome da pasta no diretório>` = limpar arquivos de pasta

- `pip freeze | grep -v "^-e" | xargs pip uninstall -y` = Limpar todas dependências

- `code .` = Abrir VSCode

# Comandos Git
![Estágios Git](docs/Git%20stages.png)


## Criar git
- `git clone` = copiar projeto do Github
- `git init` = criar novo

## Status
- `git status` = Status atual
- `git log` = Mostrar histórico de commits com seus hashes (código de identificação)

## Adicionar em untracked(U) / modified(M) --> staged(A)
- `git add <nome do arquivo>`

## Retirar do staged (A) --> untracked(U) / modified(M)
- `git rm --cached <nome do arquivo>` = Retirar o arquivo de staged (com git add)
- `git restore --staged ...` = Retira documentos staged (com git add) e se torna untracked novamente

## Comprometer staged (A) --> repository
- `git commit -m "mensagem"` = Salvar no git local a versão criando um hash
- `git commit --amend` = Reescrever última mensagem do commit

## Configurar repositório remoto
- `git remote -v` = verifica os repositórios possíveis apontados
- `git remote add origin <new_repository_url>` = substitui repositório para o qual seu projeto aponta. Ex: https://github.com/your_username/new_repo.git
- `git remote add new-remote <new_repository_url>` = adiciona novo destino de repositório

## Repositório local --> Github
- `git push` = envia ao github original
- `git push -u origin <branch_name>` = (-u: upstream)
- `git push new-remote <branch_name>` = envia para novo destino
- `git push -f origin <branch_name>`= (-f: force) novo repositório já tem commits, e você precisa forçar mudanças, sobrescrevendo histórico.

## Branches
- `git branch`= Ver o nome das ramificações do projeto
- `git checkout <nome do branch>` = Mudar para outra branch

## Histórico e recuperação
- `git log --follow <nome_do_arquivo>` = ver histórico de o código hash com datas e usuários
- `git checkout <hash do commit>` = Ver outra versão daquele commit através so hash
- `git checkout <hash_do_commit> -- <nome_do_arquivo>` = recuperar arquivo específico para versão do hash indicado
- `git restore ...` = Retorna à última versão do arquivo





# Padrões de Commits: 
Fonte: https://github.com/iuricode/padroes-de-commits

O commit semântico possui os elementos estruturais abaixo (tipos), que informam a intenção do seu commit ao utilizador(a) de seu código.

`feat` - Commits do tipo feat indicam que seu trecho de código está incluindo um novo recurso (se relaciona com o MINOR do versionamento semântico).

`fix` - Commits do tipo fix indicam que seu trecho de código commitado está solucionando um problema (bug fix), (se relaciona com o PATCH do versionamento semântico).

`docs` - Commits do tipo docs indicam que houveram mudanças na documentação, como por exemplo no Readme do seu repositório. (Não inclui alterações em código).

`test` - Commits do tipo test são utilizados quando são realizadas alterações em testes, seja criando, alterando ou excluindo testes unitários. (Não inclui alterações em código)

`build` - Commits do tipo build são utilizados quando são realizadas modificações em arquivos de build e dependências.

`perf` - Commits do tipo perf servem para identificar quaisquer alterações de código que estejam relacionadas a performance.

`style` - Commits do tipo style indicam que houveram alterações referentes a formatações de código, semicolons, trailing spaces, lint... (Não inclui alterações em código).

`refactor` - Commits do tipo refactor referem-se a mudanças devido a refatorações que não alterem sua funcionalidade, como por exemplo, uma alteração no formato como é processada determinada parte da tela, mas que manteve a mesma funcionalidade, ou melhorias de performance devido a um code review.

`chore` - Commits do tipo chore indicam atualizações de tarefas de build, configurações de administrador, pacotes... como por exemplo adicionar um pacote no gitignore. (Não inclui alterações em código)

`ci` - Commits do tipo ci indicam mudanças relacionadas a integração contínua (continuous integration).

`raw` - Commits do tipo raw indicam mudanças relacionadas a arquivos de configurações, dados, features, parâmetros.

`cleanup` - Commits do tipo cleanup são utilizados para remover código comentado, trechos desnecessários ou qualquer outra forma de limpeza do código-fonte, visando aprimorar sua legibilidade e manutenibilidade.

`remove` - Commits do tipo remove indicam a exclusão de arquivos, diretórios ou funcionalidades obsoletas ou não utilizadas, reduzindo o tamanho e a complexidade do projeto e mantendo-o mais organizado.

## Emojis
<table>
  <thead>
    <tr>
      <th>Tipo do commit</th>
      <th>Emoji</th>
      <th>Palavra-chave</th>
    </tr>
  </thead>
 <tbody>
    <tr>
      <td>Acessibilidade</td>
      <td>♿ <code>:wheelchair:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Adicionando um teste</td>
      <td>✅ <code>:white_check_mark:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Atualizando a versão de um submódulo</td>
      <td>⬆️ <code>:arrow_up:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Retrocedendo a versão de um submódulo</td>
      <td>⬇️ <code>:arrow_down:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Adicionando uma dependência</td>
      <td>➕ <code>:heavy_plus_sign:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Alterações de revisão de código</td>
      <td>👌 <code>:ok_hand:</code></td>
      <td><code>style</code></td>
    </tr>
    <tr>
      <td>Animações e transições</td>
      <td>💫 <code>:dizzy:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Bugfix</td>
      <td>🐛 <code>:bug:</code></td>
      <td><code>fix</code></td>
    </tr>
    <tr>
      <td>Comentários</td>
      <td>💡 <code>:bulb:</code></td>
      <td><code>docs</code></td>
    </tr>
    <tr>
      <td>Commit inicial</td>
      <td>🎉 <code>:tada:</code></td>
      <td><code>init</code></td>
    </tr>
    <tr>
      <td>Configuração</td>
      <td>🔧 <code>:wrench:</code></td>
      <td><code>chore</code></td>
    </tr>
    <tr>
      <td>Deploy</td>
      <td>🚀 <code>:rocket:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Documentação</td>
      <td>📚 <code>:books:</code></td>
      <td><code>docs</code></td>
    </tr>
    <tr>
      <td>Em progresso</td>
      <td>🚧 <code>:construction:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Estilização de interface</td>
      <td>💄 <code>:lipstick:</code></td>
      <td><code>feat</code></td>
    </tr>
    <tr>
      <td>Infraestrutura</td>
      <td>🧱 <code>:bricks:</code></td>
      <td><code>ci</code></td>
    </tr>
    <tr>
      <td>Lista de ideias (tasks)</td>
      <td>🔜 <code> :soon: </code></td>
      <td></td>
    </tr>
    <tr>
      <td>Mover/Renomear</td>
      <td>🚚 <code>:truck:</code></td>
      <td><code>chore</code></td>
    </tr>
    <tr>
      <td>Novo recurso</td>
      <td>✨ <code>:sparkles:</code></td>
      <td><code>feat</code></td>
    </tr>
    <tr>
      <td>Package.json em JS</td>
      <td>📦 <code>:package:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Performance</td>
      <td>⚡ <code>:zap:</code></td>
      <td><code>perf</code></td>
    </tr>
    <tr>
        <td>Refatoração</td>
        <td>♻️ <code>:recycle:</code></td>
        <td><code>refactor</code></td>
    </tr>
    <tr>
      <td>Limpeza de Código</td>
      <td>🧹 <code>:broom:</code></td>
      <td><code>cleanup</code></td>
    </tr>
    <tr>
      <td>Removendo um arquivo</td>
      <td>🗑️ <code>:wastebasket:</code></td>
      <td><code>remove</code></td>
    </tr>
    <tr>
      <td>Removendo uma dependência</td>
      <td>➖ <code>:heavy_minus_sign:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Responsividade</td>
      <td>📱 <code>:iphone:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Revertendo mudanças</td>
      <td>💥 <code>:boom:</code></td>
      <td><code>fix</code></td>
    </tr>
    <tr>
      <td>Segurança</td>
      <td>🔒️ <code>:lock:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>SEO</td>
      <td>🔍️ <code>:mag:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tag de versão</td>
      <td>🔖 <code>:bookmark:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Teste de aprovação</td>
      <td>✔️ <code>:heavy_check_mark:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Testes</td>
      <td>🧪 <code>:test_tube:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Texto</td>
      <td>📝 <code>:pencil:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tipagem</td>
      <td>🏷️ <code>:label:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tratamento de erros</td>
      <td>🥅 <code>:goal_net:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Dados</td>
      <td>🗃️ <code>:card_file_box:</code></td>
      <td><code>raw</code></td>
    </tr>
  </tbody>
</table>

## 💻 Exemplos

<table>
  <thead>
    <tr>
      <th>Comando Git</th>
      <th>Resultado no GitHub</th>
    </tr>
  </thead>
 <tbody>
    <tr>
      <td>
        <code>git commit -m ":tada: Commit inicial"</code>
      </td>
      <td>🎉 Commit inicial</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":books: docs: Atualização do README"</code>
      </td>
      <td>📚 docs: Atualização do README</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":bug: fix: Loop infinito na linha 50"</code>
      </td>
      <td>🐛 fix: Loop infinito na linha 50</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":sparkles: feat: Página de login"</code>
      </td>
      <td>✨ feat: Página de login</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":bricks: ci: Modificação no Dockerfile"</code>
      </td>
      <td>🧱 ci: Modificação no Dockerfile</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":recycle: refactor: Passando para arrow functions"</code>
      </td>
      <td>♻️ refactor: Passando para arrow functions</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":zap: perf: Melhoria no tempo de resposta"</code>
      </td>
      <td>⚡ perf: Melhoria no tempo de resposta</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":boom: fix: Revertendo mudanças ineficientes"</code>
      </td>
      <td>💥 fix: Revertendo mudanças ineficientes</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":lipstick: feat: Estilização CSS do formulário"</code>
      </td>
      <td>💄 feat: Estilização CSS do formulário</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":test_tube: test: Criando novo teste"</code>
      </td>
      <td>🧪 test: Criando novo teste</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":bulb: docs: Comentários sobre a função LoremIpsum( )"</code>
      </td>
      <td>💡 docs: Comentários sobre a função LoremIpsum( )</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":card_file_box: raw: RAW Data do ano aaaa"</code>
      </td>
      <td>🗃️ raw: RAW Data do ano aaaa</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":broom: cleanup: Eliminando blocos de código comentados e variáveis não utilizadas na função de validação de formulário"</code>
      </td>
      <td>🧹 cleanup: Eliminando blocos de código comentados e variáveis não utilizadas na função de validação de formulário</td>
    </tr>
    <tr>
      <td>
        <code>git commit -m ":wastebasket: remove: Removendo arquivos não utilizados do projeto para manter a organização e atualização contínua"</code>
      </td>
      <td>🗑️ remove: Removendo arquivos não utilizados do projeto para manter a organização e atualização contínua</td>
    </tr>
  </tbody>
</table>