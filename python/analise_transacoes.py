"""
Análise de Transações Bancárias
--------------------------------
Este script:
1. Cria um banco de dados SQLite em memória usando o SQL do projeto
2. Executa consultas para extrair informações
3. Usa Pandas para organizar os dados
4. Gera gráficos simples com Matplotlib

Como rodar:
    pip install pandas matplotlib
    python analise_transacoes.py
"""

import sqlite3
import pandas as pd
import matplotlib.pyplot as plt
import os

# =====================================================
# 1. Conectar ao banco e carregar as tabelas (via script SQL)
# =====================================================

conn = sqlite3.connect(":memory:")  # banco temporário em memória

caminho_sql = os.path.join(os.path.dirname(__file__), "..", "sql", "01_criar_tabelas.sql")

with open(caminho_sql, "r", encoding="utf-8") as f:
    script_sql = f.read()

conn.executescript(script_sql)

# =====================================================
# 2. Carregar os dados em DataFrames do Pandas
# =====================================================

clientes = pd.read_sql_query("SELECT * FROM clientes", conn)
transacoes = pd.read_sql_query("SELECT * FROM transacoes", conn)

# Junta as duas tabelas (equivalente a um JOIN em SQL)
dados = transacoes.merge(clientes, left_on="cliente_id", right_on="id", suffixes=("_transacao", "_cliente"))

print("Prévia dos dados combinados:")
print(dados[["nome", "cidade", "valor", "categoria", "data"]].head(), "\n")

# =====================================================
# 3. Estatísticas simples
# =====================================================

total_por_cliente = dados.groupby("nome")["valor"].sum().sort_values(ascending=False)
print("Total gasto por cliente:")
print(total_por_cliente, "\n")

total_por_categoria = dados.groupby("categoria")["valor"].sum().sort_values(ascending=False)
print("Total gasto por categoria:")
print(total_por_categoria, "\n")

media_geral = dados["valor"].mean()
print(f"Ticket médio das transações: R$ {media_geral:.2f}")

cliente_top = total_por_cliente.idxmax()
print(f"Cliente que mais gastou: {cliente_top} (R$ {total_por_cliente.max():.2f})\n")

# =====================================================
# 4. Gráficos
# =====================================================

# Gráfico 1: Total gasto por categoria
plt.figure(figsize=(8, 5))
total_por_categoria.plot(kind="bar", color="#8A05BE")
plt.title("Total gasto por categoria")
plt.xlabel("Categoria")
plt.ylabel("Valor total (R$)")
plt.tight_layout()
plt.savefig(os.path.join(os.path.dirname(__file__), "grafico_por_categoria.png"))
plt.close()

# Gráfico 2: Total gasto por cliente
plt.figure(figsize=(8, 5))
total_por_cliente.plot(kind="bar", color="#00A868")
plt.title("Total gasto por cliente")
plt.xlabel("Cliente")
plt.ylabel("Valor total (R$)")
plt.tight_layout()
plt.savefig(os.path.join(os.path.dirname(__file__), "grafico_por_cliente.png"))
plt.close()

print("Gráficos salvos: grafico_por_categoria.png e grafico_por_cliente.png")

conn.close()
