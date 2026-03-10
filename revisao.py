import pandas as pd

dados = 'https://www.ispdados.rj.gov.br/Arquivos/BaseDPEvolucaoMensalCisp.csv'
df = pd.read_csv(dados, encoding= 'latin1', sep= ';')

print(df)

#  df.groupby(variáveis qualitativas)[variáveis quantitativas].método de agrupamento quantitativo(sum()...).reset_index()
df_furto_celular_cisp = df.groupby('cisp')['furto_celular'].sum().reset_index()

print(df_furto_celular_cisp)
