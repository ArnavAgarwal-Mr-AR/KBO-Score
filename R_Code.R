#FDA PROJECT
library(dplyr)
print(paste("Teams in KBO are"))
print(paste("1. Doosan Bears"))
print(paste("2. Hanwha Eagles"))
print(paste("3. Kia Tigers"))
print(paste("4. Kiwoom Heroes"))
print(paste("5. KT Wiz"))
print(paste("6. LG Twins"))
print(paste("7. Lotte Giants"))
print(paste("8. NC Dinos"))
print(paste("9. Samsung Lions"))
print(paste("10. SSG Landers"))
print(paste("I am a good manager and I can make you one too!!!"))
print(paste("Lets predict if your team can  win or not"))
teama=readline("Your team name = ")
teamb=readline("Opponent team name = ")
#Reading all the daatsets
bat2022=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2022 data/2022_league_batting.csv")
pitch2022=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2022 data/2022_league_pitching.csv")
bat2021=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2021 data/2021_league_batting.csv")
pitch2021=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2021 data/2021_league_pitching.csv")
bat2020=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2020 data/2020_league_batting.csv")
pitch2020=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2020 data/2020_league_pitching.csv")
bat2019=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2019 data/2019_league_batting.csv")
pitch2019=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2019 data/2019_league_pitching.csv")
bat2018=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2018 data/2018_league_batting.csv")
pitch2018=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2018 data/2018_league_pitching.csv")
bat2017=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2017 data/2017_league_batting.csv")
pitch2017=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2017 data/2017_league_pitching.csv")
bat2016=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2016 data/2016_league_batting.csv")
pitch2016=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2016 data/2016_league_pitching.csv")
bat2015=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2015 data/2015_league_batting.csv")
pitch2015=read.csv("E:/SEM 5/Data Analytics/Project/Datasets/2015 data/2015_league_pitching.csv")
#Ordering the datasets based on team name
bating2022=bat2022[order(bat2022$Finals),]     
pitching2022=pitch2022[order(pitch2022$Finals),] 
bating2021=bat2021[order(bat2021$Finals),]     
pitching2021=pitch2021[order(pitch2021$Finals),] 
bating2020=bat2020[order(bat2020$Finals),]     #Sorting batting data in ascending order
pitching2020=pitch2020[order(pitch2020$Finals),]     #Sorting pitching data in ascending order
bating2019=bat2019[order(bat2019$Finals),]     
pitching2019=pitch2019[order(pitch2019$Finals),] 
bating2018=bat2018[order(bat2018$Finals),]     
pitching2018=pitch2018[order(pitch2018$Finals),] 
bating2017=bat2017[order(bat2017$Finals),]     
pitching2017=pitch2017[order(pitch2017$Finals),] 
bating2016=bat2016[order(bat2016$Finals),]     
pitching2016=pitch2016[order(pitch2016$Finals),] 
bating2015=bat2022[order(bat2015$Finals),]     
pitching2015=pitch2022[order(pitch2015$Finals),] 
#Probability of winning of every team
probmat=matrix(0,10,10)
for (i in 1:10)
{
  for (j in 1:10)
  {
    a=pitching2022$W[i]/(pitching2022$W[i]+pitching2022$L[i])
    b=pitching2022$W[j]/(pitching2022$W[j]+pitching2022$L[j])
    probmat[i,j]=((a-(a*b))*100)/(a+b-(2*a*b))
  }
}
#Plotting the probabilty of winning matrix
library(plot.matrix)
plot(probmat)

#Finding the average wins
avgw=(pitching2022$W+pitching2021$W+pitching2020$W+pitching2019$W+pitching2018$W+
        pitching2017$W+pitching2016$W+pitching2016$W+pitching2015$W)/8
#Finding average lose
avgl=(pitching2022$L+pitching2021$L+pitching2020$L+pitching2019$L+pitching2018$L+
        pitching2017$L+pitching2016$L+pitching2016$L+pitching2015$L)/8
#Average win-loss%
avgwinlos=(avgw*100)/(avgw+avgl)

#Finding our team in the dataset
teamapos=which(bating2022$Finals==teama)   #Gives the position of our team in the list
teambpos=which(bating2022$Finals==teamb)
#average SLG for batting for our team and opposite team
avgslga=(bating2022$SLG[teamapos]+bating2021$SLG[teamapos]+bating2020$SLG[teamapos]
        +bating2019$SLG[teamapos]+bating2018$SLG[teamapos]+bating2017$SLG[teamapos]
       +bating2016$SLG[teamapos]+bating2015$SLG[teamapos])/8
avgslgb=(bating2022$SLG[teambpos]+bating2021$SLG[teambpos]+bating2020$SLG[teambpos]
        +bating2019$SLG[teambpos]+bating2018$SLG[teambpos]+bating2017$SLG[teambpos]
        +bating2016$SLG[teambpos]+bating2015$SLG[teambpos])/8

#Average hr for batting
avghra=(bating2022$HR[teamapos]+bating2021$HR[teamapos]+bating2020$HR[teamapos]
        +bating2019$HR[teamapos]+bating2018$HR[teamapos]+bating2017$HR[teamapos]
        +bating2016$HR[teamapos]+bating2015$HR[teamapos])/8
avghrb=(bating2022$HR[teambpos]+bating2021$HR[teambpos]+bating2020$HR[teambpos]
        +bating2019$HR[teambpos]+bating2018$HR[teambpos]+bating2017$HR[teambpos]
        +bating2016$HR[teambpos]+bating2015$HR[teambpos])/8

#Average sb for bating
avgsba=(bating2022$SB[teamapos]+bating2021$SB[teamapos]+bating2020$SB[teamapos]
         +bating2019$SB[teamapos]+bating2018$SB[teamapos]+bating2017$SB[teamapos]
         +bating2016$SB[teamapos]+bating2015$SB[teamapos])/8
avgsbb=(bating2022$SB[teambpos]+bating2021$SB[teambpos]+bating2020$SB[teambpos]
         +bating2019$SB[teambpos]+bating2018$SB[teambpos]+bating2017$SB[teambpos]
         +bating2016$SB[teambpos]+bating2015$SB[teambpos])/8
#Average bb for bating
avgbba=(bating2022$BB[teamapos]+bating2021$BB[teamapos]+bating2020$BB[teamapos]
         +bating2019$BB[teamapos]+bating2018$BB[teamapos]+bating2017$BB[teamapos]
         +bating2016$BB[teamapos]+bating2016$BB[teamapos]+bating2015$BB[teamapos])/8
avgbbb=(bating2022$BB[teambpos]+bating2021$BB[teambpos]+bating2020$BB[teambpos]
         +bating2019$BB[teambpos]+bating2018$BB[teambpos]+bating2017$BB[teambpos]
         +bating2016$BB[teambpos]+bating2016$BB[teambpos]+bating2015$BB[teambpos])/8

#Average era for pitching
avgeraa=(pitching2022$ERA[teamapos]+pitching2021$ERA[teamapos]+pitching2020$ERA[teamapos]
        +pitching2019$ERA[teamapos]+pitching2018$ERA[teamapos]+pitching2017$ERA[teamapos]
        +pitching2016$ERA[teamapos]+pitching2015$ERA[teamapos])/8
avgerab=(pitching2022$ERA[teambpos]+pitching2021$ERA[teambpos]+pitching2020$ERA[teambpos]
         +pitching2019$ERA[teambpos]+pitching2018$ERA[teambpos]+pitching2017$ERA[teambpos]
         +pitching2016$ERA[teambpos]+pitching2015$ERA[teambpos])/8
#Average balk for pitching
avgbka=(pitching2022$BK[teamapos]+pitching2021$BK[teamapos]+pitching2020$BK[teamapos]
         +pitching2019$BK[teamapos]+pitching2018$BK[teamapos]+pitching2017$BK[teamapos]
         +pitching2016$BK[teamapos]+pitching2015$BK[teamapos])/8
avgbkb=(pitching2022$BK[teambpos]+pitching2021$BK[teambpos]+pitching2020$BK[teambpos]
         +pitching2019$BK[teambpos]+pitching2018$BK[teambpos]+pitching2017$BK[teambpos]
         +pitching2016$BK[teambpos]+pitching2015$BK[teambpos])/8

#Average h9 for pitching
avgh9a=(pitching2022$H9[teamapos]+pitching2021$H9[teamapos]+pitching2020$H9[teamapos]
         +pitching2019$H9[teamapos]+pitching2018$H9[teamapos]+pitching2017$H9[teamapos]
         +pitching2016$H9[teamapos]+pitching2015$H9[teamapos])/8
avgh9b=(pitching2022$H9[teambpos]+pitching2021$H9[teambpos]+pitching2020$H9[teambpos]
         +pitching2019$H9[teambpos]+pitching2018$H9[teambpos]+pitching2017$H9[teambpos]
         +pitching2016$H9[teambpos]+pitching2015$H9[teambpos])/8
#Average wild pitch for pitching
avgwpa=(pitching2022$WP[teamapos]+pitching2021$WP[teamapos]+pitching2020$WP[teamapos]
         +pitching2019$WP[teamapos]+pitching2018$WP[teamapos]+pitching2017$WP[teamapos]
         +pitching2016$WP[teamapos]+pitching2015$WP[teamapos])/8
avgwpb=(pitching2022$WP[teambpos]+pitching2021$WP[teambpos]+pitching2020$WP[teambpos]
         +pitching2019$WP[teambpos]+pitching2018$WP[teambpos]+pitching2017$WP[teambpos]
         +pitching2016$WP[teambpos]+pitching2015$WP[teambpos])/8
#probability of winning of our team
a=pitching2022$W[teamapos]/(pitching2022$W[teamapos]+pitching2022$L[teamapos])
b=pitching2022$W[teambpos]/(pitching2022$W[teambpos]+pitching2022$L[teambpos])
#Probability (in %) that a will win against b
prob=((a-(a*b))*100)/(a+b-(2*a*b))
print(paste("Probability of winning of our team = ",prob))
#Probability (in %) of strikeout for our team
bso=pitching2022$SO[teamapos]/pitching2022$BF[teamapos]
pso=(pitching2022$SO9[teamapos]*9)/pitching2022$IP[teamapos]
l=pitching2022$SO[teamapos]/(100*pitching2022$PA[teamapos])
bpl=bso*pso/l
e=(bpl*100)/(bpl+((1-bso)*(1-pso)/(1-l)))
print(paste("Probability of strikeout of our team = ",e))
#Finding which team has the best batting
scorebata=avgslga+avghra+avgsba+avgbba
scorebatb=avgslgb+avghrb+avgsbb+avgbbb
if(scorebatb - scorebata > 0)
{
  print(paste(bating2022$Finals[teambpos]," is better at bating than ",bating2022$Finals[teamapos]))
} else
{
  print(paste(bating2022$Finals[teamapos]," is better at bating than ",bating2022$Finals[teambpos]))
}
#Finding which team has the best pitching
scorepitcha=avgeraa+avgh9a+avgbka+avgwpa
scorepitchb=avgerab+avgbkb+avgh9b+avgwpb
if(scorepitchb - scorepitcha > 0)
{
  print(paste(bating2022$Finals[teamapos]," is better at pitching than ",bating2022$Finals[teambpos]))
} else
{
  print(paste(bating2022$Finals[teambpos]," is better at pitching than ",bating2022$Finals[teamapos]))
}
