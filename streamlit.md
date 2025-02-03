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

var = st.select_slider("Text box", options=[])

### Checkboxes
var = st.checkbox("Text box", value = False)

### Submissãod e formulário
var = st.form_submit_button(label = '')