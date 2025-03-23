[Principal](https://github.com/Mateus-cpa/Projeto_Git/blob/master/README.md)

## 5. Docker

- Criar o <span style="background-color:rgba(235, 235, 139, 0.55)">Dockerfile</span> para automatizar a configuração do computador.
- Criar o <span style="background-color:rgba(235, 235, 139, 0.55)">.dockerignore</span> para o docker ignorar arquivos ao copiar.


### 5.1. Código de arquivo Dockerfile
```
FROM python:3.12 
RUN pip install poetry
COPY . /src
WORKDIR /src
RUN poetry install
EXPOSE 8501
ENTRYPOINT ["poetry","run","streamlit","run","<streamlit_file.py>","--server.port=8501","--server.address=0.0.0.0"]
```

### 5.2. Build Docker
- `docker build --no-cache -t <nome_da_imagem> .` (às vezes pede que seja executado como administrador)


- fazer o push do repositório
- no git bash: 
--docker build -t <nome_da_imagem_docker>
-- docker run -d -p <porta> --name <container> <imagem>

[Principal](https://github.com/Mateus-cpa/Projeto_Git/blob/master/README.md)
