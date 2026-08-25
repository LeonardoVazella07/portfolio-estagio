# 📊 Análise de Transações Bancárias

Projeto de portfólio desenvolvido para praticar **SQL** e **Python** aplicados a um cenário de dados bancários — simulando clientes e suas transações, como em um banco digital.

## 🎯 Sobre o projeto

O projeto simula um mini banco de dados com duas tabelas (`clientes` e `transacoes`) e responde perguntas de negócio como:
- Qual cliente mais gastou?
- Qual categoria concentra mais gastos?
- Qual o ticket médio das transações?

## 🛠️ Tecnologias utilizadas

- **SQL** (SQLite) — criação de tabelas, consultas com `JOIN`, `GROUP BY` e agregações
- **Python** — Pandas para manipulação de dados e Matplotlib para geração de gráficos

## 📁 Estrutura do repositório

```
portfolio-estagio/
├── sql/
│   ├── 01_criar_tabelas.sql   # Criação das tabelas e dados fictícios
│   └── 02_consultas.sql       # Consultas simples, com JOIN e agregações
├── python/
│   └── analise_transacoes.py  # Script que roda o SQL, analisa e gera gráficos
└── README.md
```

## ▶️ Como executar

```bash
# 1. Instalar dependências
pip install pandas matplotlib

# 2. Rodar o script (ele cria o banco, executa as queries e gera os gráficos)
python python/analise_transacoes.py
```

O script imprime as análises no terminal e salva dois gráficos (`.png`) na pasta `python/`.

## 📈 O que o projeto demonstra

- Consultas SQL simples (`SELECT`, `WHERE`, `ORDER BY`)
- Consultas com `JOIN` entre tabelas relacionadas
- Agregações com `GROUP BY` (soma, média, contagem)
- Manipulação de dados com Pandas
- Visualização de dados com Matplotlib

## 📚 Aprendizados

Este projeto foi feito para consolidar conceitos estudados no curso de **SQL da FGV** e no curso básico de **Python**, unindo as duas linguagens em um caso prático de análise de dados — algo próximo do dia a dia de áreas de dados em empresas do setor financeiro.
