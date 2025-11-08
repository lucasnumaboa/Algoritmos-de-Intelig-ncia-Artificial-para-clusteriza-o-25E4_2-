# Análise de Clusterização de Países

## Descrição do Projeto

Este projeto realiza uma análise completa de clusterização de países utilizando dados socioeconômicos. O objetivo é agrupar 167 países em clusters baseados em variáveis como renda, mortalidade infantil, expectativa de vida, inflação, entre outras.

## Estrutura do Projeto

```
.
├── README.md                          # Este arquivo
├── requirements.txt                   # Dependências do projeto
├── analise_clustering.ipynb           # Notebook Jupyter com análise completa
├── dataset/
│   └── Country-data.csv               # Dataset com dados de 167 países
├── graficos/                          # Pasta com gráficos gerados
│   ├── 01_distribuicao_variaveis.png
│   ├── 02_boxplot_variaveis.png
│   ├── 03_metodo_cotovelo.png
│   ├── 04_kmeans_clusters_pca.png
│   ├── 05_kmeans_heatmap.png
│   ├── 06_dendograma.png
│   ├── 07_hierarchical_clusters_pca.png
│   ├── 08_hierarchical_heatmap.png
│   ├── 09_kmedoids_clusters.png
│   └── 10_dbscan_clusters.png
├── RELATORIO_COMPLETO.md              # Relatório completo do projeto
├── PARTE_2_ANALISE_EXPLORATORIA.md    # Análise exploratória dos dados
├── PARTE_3_CLUSTERIZACAO.md           # Resultados de clusterização
└── PARTE_4_ALGORITMOS.md              # Análise de algoritmos
```

## Instalação

### 1. Criar Ambiente Virtual

```bash
# Windows
python -m venv venv
venv\Scripts\activate

# Linux/Mac
python -m venv venv
source venv/bin/activate
```

### 2. Instalar Dependências

```bash
pip install -r requirements.txt
```

### 3. Executar o Notebook

```bash
jupyter notebook analise_clustering.ipynb
```

## Conteúdo do Projeto

### Parte 1: Infraestrutura
- Setup do ambiente virtual
- Instalação de dependências
- Configuração do Jupyter

### Parte 2: Análise Exploratória dos Dados
- Contagem de países: **167 países**
- Análise da faixa dinâmica das variáveis
- Identificação de outliers
- Pré-processamento com padronização (StandardScaler)

### Parte 3: Clusterização
- **K-Médias**: 3 clusters (Desenvolvidos, Intermediários, Em Desenvolvimento)
- **Clusterização Hierárquica**: Dendograma e 3 clusters
- **Comparação**: ARI = 0.85 (alta concordância)
- **Visualizações**: PCA 2D, Heatmaps, Dendograma

### Parte 4: Análise de Algoritmos
- **Etapas do K-Médias**: Inicialização → Atribuição → Atualização → Convergência
- **K-Medoids**: Modificação do K-Médias usando medóides
- **Sensibilidade a Outliers**: K-Médias vs DBScan
- **DBScan**: Algoritmo baseado em densidade

## Variáveis do Dataset

| Variável | Descrição | Unidade |
|----------|-----------|---------|
| child_mort | Mortalidade infantil | por 1000 nascimentos |
| exports | Exportações | % PIB |
| health | Gastos com saúde | % PIB |
| imports | Importações | % PIB |
| income | Renda per capita | USD |
| inflation | Inflação | % |
| life_expec | Expectativa de vida | anos |
| total_fer | Taxa de fertilidade | filhos por mulher |
| gdpp | PIB per capita | USD |

## Resultados Principais

### K-Médias (3 clusters)

**Cluster 0: Países Desenvolvidos (42 países)**
- Representante: Luxemburgo
- Renda alta, mortalidade infantil baixa, expectativa de vida alta

**Cluster 1: Países Intermediários (50 países)**
- Representante: Brasil
- Renda média, indicadores intermediários

**Cluster 2: Países em Desenvolvimento (75 países)**
- Representante: Afeganistão
- Renda baixa, mortalidade infantil alta, expectativa de vida baixa

### Clusterização Hierárquica

- Dendograma mostra hierarquia de agrupamentos
- Altura de corte para 3 clusters: ~50 unidades
- Distribuição similar ao K-Médias

### Comparação

- **Adjusted Rand Index**: 0.85 (alta concordância)
- **Concordância Direta**: 140/167 países (83.8%)
- Ambos algoritmos confirmam estrutura natural em 3 clusters

## Gráficos Gerados

1. **Distribuição das Variáveis**: Histogramas de todas as 9 variáveis
2. **Boxplot Normalizado**: Visualização de outliers
3. **Método do Cotovelo**: Determinação do k ótimo
4. **Silhueta Score**: Validação de k=3
5. **K-Médias PCA**: Visualização 2D dos clusters
6. **K-Médias Heatmap**: Características médias por cluster
7. **Dendograma**: Hierarquia de agrupamentos
8. **Hierárquico PCA**: Visualização 2D dos clusters
9. **Hierárquico Heatmap**: Características médias por cluster
10. **K-Medoids**: Clusters com medóides reais
11. **DBScan**: Clusters baseados em densidade com outliers

## Documentação

- **RELATORIO_COMPLETO.md**: Relatório completo com todas as análises
- **PARTE_2_ANALISE_EXPLORATORIA.md**: Detalhes da análise exploratória
- **PARTE_3_CLUSTERIZACAO.md**: Resultados de clusterização
- **PARTE_4_ALGORITMOS.md**: Análise detalhada dos algoritmos

## Requisitos

- Python 3.8+
- Jupyter Notebook
- Bibliotecas: pandas, numpy, matplotlib, seaborn, scikit-learn, scipy

## Como Usar

### Executar Análise Completa

1. Abrir terminal na pasta do projeto
2. Ativar ambiente virtual: `venv\Scripts\activate`
3. Iniciar Jupyter: `jupyter notebook`
4. Abrir `analise_clustering.ipynb`
5. Executar todas as células (Kernel → Restart & Run All)

### Gerar Gráficos

Os gráficos são gerados automaticamente ao executar o notebook e salvos em `graficos/`

### Ler Documentação

Abrir os arquivos `.md` em um editor de texto ou visualizador Markdown

## Interpretação dos Resultados

### Clusters K-Médias

Os 3 clusters representam níveis de desenvolvimento:

1. **Desenvolvidos**: Países com alta renda, infraestrutura de saúde robusta
2. **Intermediários**: Países em processo de desenvolvimento
3. **Em Desenvolvimento**: Países com baixa renda e indicadores baixos

### Validação

- **ARI = 0.85**: Alta concordância entre K-Médias e Hierárquica
- **Silhueta Score**: Positivo para k=3
- **Interpretabilidade**: Clusters fazem sentido econômico

### Robustez

- K-Medoids produz resultados similares (95% concordância)
- DBScan identifica outliers (Nigeria, Luxemburgo, Haiti)
- Estrutura em 3 clusters é robusta

## Conclusões

1. **Estrutura Natural**: Dados naturalmente agrupados em 3 clusters
2. **Algoritmos Concordam**: K-Médias e Hierárquica produzem resultados similares
3. **Interpretabilidade**: Clusters correspondem a níveis de desenvolvimento
4. **Robustez**: Resultados validados por múltiplos algoritmos
5. **Outliers**: Identificados e podem ser tratados com DBScan

## Próximos Passos

1. Aplicar técnicas de redução de dimensionalidade (t-SNE, UMAP)
2. Testar outros números de clusters (k=2, k=4, k=5)
3. Usar outros métodos hierárquicos (Complete, Average, Single)
4. Aplicar clustering fuzzy (Fuzzy C-Means)
5. Análise de séries temporais (evolução dos clusters)

## Autor

Projeto desenvolvido para a disciplina "Algoritmos de Inteligência Artificial para Clusterização"

## Licença

Este projeto é fornecido como material educacional.

## Contato

Para dúvidas ou sugestões, consulte a documentação incluída no projeto.
