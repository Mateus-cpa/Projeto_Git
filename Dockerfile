FROM python:3.12
# Versão python

RUN pip install poetry
# Instala o poetry

COPY . /src
# informa em qual pasta irá na imagem Docker

WORKDIR /src
#informa a pasta onde o Docker trabalhará

RUN poetry install
# Instala as dependências do poetry

EXPOSE 8501
# Porta que será aberta

ENTRYPOINT ["poetry","run","streamlit","run","src/dataviz.py","--server.port=8501","--server.address=0.0.0.0"]
# código que irá rodar