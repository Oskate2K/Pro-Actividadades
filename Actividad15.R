# Regresion Lineal Simple
# Oscar Alfonso Rojas Valdez
# Universidad de guadalajara
# Importar dataset 
dataset = read.csv('Salary_Data.csv')
# Dividir los datos en conjunto de entrenamiento y conjunto de test
install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)
# Ajustar el modelo de regresion lineal simple con el conjunto de entrenamiento
regressor = lm(formula = Salary ~ YearsExperience,
              data = training_set)
# Summary (regressor) # Descomentar para analizar y revisar la regresion
# Predecir resultados con el conjunto set 
y_pred = predict(regressor, newdata = testing_set)

#Visualizacion de los resultados en el conjunto de entrenamiento
install.packages("ggplot2")
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = "red") +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") + 
  ggtitle("Sueldo vs A?os de experiencia (conjunto de entrenamiento)") + 
  xlab("A?os de Experiencia") +
  ylab("Sueldo (en $)")

# Visualizacion de los resultados en el conjunto de testing
ggplot() +
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary),
             colour = "red") +
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") + 
  ggtitle("Sueldo vs A?os de experiencia (Conjunto de testing)") + 
  xlab("A?os de Experiencia Oscar Alfonso Rojas Valdez") + 
  ylab("Sueldo (en $)")
            
  