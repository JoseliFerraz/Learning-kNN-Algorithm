#*******************************************************************************
#*******************************************************************************
#************|-----------------------------------------------------|************
#************| Estatistico: Joseli Moreira Ferraz                 |************  
#************|-----------------------------------------------------|************
#*******************************************************************************
#*******************************************************************************


# --------------------------------------- #  
# Carregameto de Pacotes 
# --------------------------------------- #   
install.packages("class", dependencies=T)
library(class)

# --------------------------------------- #  
# Analise dos dados
# --------------------------------------- #  
head(iris)

summary(iris)

# --------------------------------------- #  
# Gerando amostra de treino para classificacao
# --------------------------------------- # 
amostra<- sample(2,150,replace=T, prob=c(0.7,0.3))

table(amostra)

iristreino<- iris[amostra==1,] 
classificar <-iris[amostra==2,]

dim(iristreino)

dim(classificar)

# --------------------------------------- # 
# Gerando a previsao: classe do mais proximo
# --------------------------------------- # 
previsao<- knn(iristreino[,1:4],classificar[,1:4],iristreino[,5],k=3)


# --------------------------------------- # 
# Classificacoes pelos vizinhos mais proximos
# --------------------------------------- # 
tabela<-table(classificar[,5],previsao);tabela

# --------------------------------------- # 
# Tabela de confudimento-> Taxa de acertidade do modelo de 93%
# --------------------------------------- # 
(tabela[1] + tabela[5] + tabela[9]) / sum(tabela) 
