# Streamlit
Consultas rápidas de métodos do Streamlit

## Rodar programa
streamlit run src/pages/dataviz.py

## Estrutura
your-repository/
├── page_1.py
├── page_2.py
└── streamlit_app.py


## Elementos de Texto
st.title('My Multi-Page App')

st.header('Page 1')

st.subheader('Subheader')

st.markdown('Markdown: Streamlit is **_really_ cool**.')

st.code('print("Hello, world!"), language='python')

st.write('Hello, world!')

st.caption('This is a small text at the bottom of the page.')

st.divider() # Adiciona uma linha divisória

st.warning('Mensagem de erro')


## Elementos gráficos
st.image('pasta','subpasta','arquivo.extensão')

## Elementos de dados
st.dataframe(variável_df)

novo_df = st.data_editor(variável_df) # Permite editar tabela

st.table(df) # Tabela estável

st.metric(label="" value=variavel)

st.json(dict_variavel)

## Elementos de gráficos

st.area_chart(df)

sr.bar_chart(df)

st.line_chart(df)

st.scatter_chart(df)

st.map(df[['lat','lon']])

fig, ax = plt.subplots

st.pyplot(fig)

## Elementos de Entrada
### Texto
var = st.text_input("Text box") # textos curtos

var = st.text_area("Text box") # textos longos

### Data
var = st.date_input("Text box")

var = st.time_input("Text box")

### Seletores
var = st.radio("Text box")

var = st.selectbox("Text box")

var = st.select_slider("Text box", min=, max=, padrão=, step=, options=[])

### Checkboxes
var = st.checkbox("Text box", value = False)

### Submissão de formulário
with st.form(key = 'identificador', clear_on_submit=True, enter_on_submit=True, border=True):

var = st.form_submit_button(label = '')

### Botões
if st.button('Texto do botão'):
    [efeito se clicado]

### Entrada no menu lateral
if sidebar_input:
    st.write(f'Você entrou no menu lateral: {sidebar_input}')

## Elementos de animação
st.balloons() sobem balões quando executado

## Session State
Dados guardados pelo navegador enquanto o usuário está com a sessão ativa
st.session_state.counter = 0


## Callback
[continuar de 48 min]

## Layouts

### Tabs
tab1, tab2, tab3 = st.tabs(['nome_tab1','nome_tab','nome_tab3'])

with tab1:
    [comandos de tab1]

### Sidebar
st.sidebar.[método]

### Colunas
col1, col2 = st.columns(spec = [2,1], vertical_alignment='top', gap=None, border=None, element=None, expand=True, equal_width=False, css=None)
with col1:
    [comandos col]

### Containers
Seção que agrupa elementos.
with st.container(border=True):
    [elementos do container]

### Espaço vazio
placeholder = st.empty()
placeholder.write('Este espaço vazio é úti para conteúdo dinâmico')

if st.button('Atualizar espaço'):
    plceholder.write("O conteúdo foi atualizado")

### Expansor
with st.expander('Expanda para mais detalhes')
    st.write('Esta informação adicional que está escondida por padrão')
    st.write('Você pode usar expansor para deixar a interface limpa')


### Popover (Tooltip)
Texto sobre elementos para ajudar o usuário
st.write('Passe o cursor sobre o botão para mais informações')
st.button('Botão para ativar'. help='Clique no botão apra navegar par aoutra página')

## Caching
[rever minuto 1h15min]

## Fragments

## Navegação

