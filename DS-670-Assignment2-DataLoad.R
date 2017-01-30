######Points#########
# The following code is run once to:
# 1. Read the csv file as a R object (ARQ Listing only)
# 2. Calculate the returns using the price column
# 3. Calculating the ratios by choice and including in the dataset
# 4. Selecting a submatrix which includes my 20 Indicators 

arqdata <- read.csv("C:/Users/madhumita/Desktop/DS - Sem2 - Fall 2016/DS-640-Predictive Analytics and Experimental Design/practical/ARQ_Data.csv", header=TRUE)
#View(arqdata)
#t(names(arqdata))

#Considering the column price with data
arqdata_na <- subset(arqdata, arqdata$price != "NA")
#View(arqdata_na)

###################################Data_File - with ARQ listings########################################
return <- vector();
for (i in 2:length(arqdata_na[,1]))
{
  if (identical(arqdata_na[i,1],arqdata_na[i-1,1]))
  {
    #    return[i] = ((arqdata[i,72] / arqdata[i-1,72]) - 1);
    return[i] = (arqdata_na[i,72] / arqdata_na[i-1,72]);
  }
  else
  {
    return[i] = 0;
  }
}

return[1]=0;
#View(return)

#adding return to arqdata dataset
arqdata_returns <- cbind(arqdata_na,return)
#View(arqdata_returns)
#t(names(arqdata_returns))

#Indicators listed.
#Calculating ratios by choice 1.SGNA/REVENUE (sgnamargin) and 2.ebitmargin
sgnamargin = arqdata_returns$sgna / arqdata_returns$revenue
ebitmargin = arqdata_returns$ebit / arqdata_returns$revenue

#adding ratios by choice to dataset - arqdata_returns
arqdata_returns_ratios <- cbind(arqdata_returns, sgnamargin,ebitmargin)
#View(arqdata_returns_ratios)
#t(names(arqdata_returns_ratios))

#Consider the 20 indicators chosen
#factors required in the dataset
arq_data_factors <- arqdata_returns_ratios[c(1,3,77,16,42,84,24,43,95,96,45,91,61,29,30,65,7,9,50,17,93,13,94)]
View(arq_data_factors)
