### R code from vignette source 'rspear.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: rspear.Rnw:42-43 (eval = FALSE)
###################################################
## install.packages('rspear')


###################################################
### code chunk number 2: rspear.Rnw:48-52 (eval = FALSE)
###################################################
## install.packages("devtools")
## require(devtools)
## install_github("rspear", "EDiLD")
## require(rspear)


###################################################
### code chunk number 3: rspear.Rnw:54-55
###################################################
require(rspear)


###################################################
### code chunk number 4: rspear.Rnw:145-147
###################################################
data(spear_example)
head(spear_example)


###################################################
### code chunk number 5: rspear.Rnw:165-167
###################################################
require(reshape2)
df_wide <- dcast(spear_example, Site + Year ~ Taxon, value.var="Abundance", fill = 0)[ , 1:6]


###################################################
### code chunk number 6: rspear.Rnw:169-170
###################################################
df_wide


###################################################
### code chunk number 7: rspear.Rnw:174-177
###################################################
require(reshape2)
df_long <- melt(df_wide, id = c("Site", "Year"))
head(df_long)


###################################################
### code chunk number 8: rspear.Rnw:187-189 (eval = FALSE)
###################################################
## sp <- spear(spear_example, 
##             taxa = "Taxon", abundance = "Abundance", group = c("Year", "Site"))


###################################################
### code chunk number 9: rspear.Rnw:194-199
###################################################
names(spear_example)
sp <- spear(spear_example , 
            taxa = names(spear_example)[1], abundance = names(spear_example)[2],
            group = names(spear_example)[3:4], 
            check = FALSE)


###################################################
### code chunk number 10: rspear.Rnw:222-223
###################################################
head(sp$traits)


###################################################
### code chunk number 11: rspear.Rnw:229-230
###################################################
sp$spear


###################################################
### code chunk number 12: boxplot
###################################################
spear_df <- sp$spear
plot(SPEAR ~ factor(Year), data = spear_df)


###################################################
### code chunk number 13: rspear.Rnw:247-250
###################################################
traits_modi <- sp$traits
traits_modi[traits_modi$taxa_matched %in% "Baetis rhodani", "exposed"] <- c(1,1)
head(traits_modi)


###################################################
### code chunk number 14: rspear.Rnw:256-263
###################################################
sp_modi <- spear(spear_example , 
            taxa = names(spear_example)[1], abundance = names(spear_example)[2],
            group = names(spear_example)[3:4], 
            traits = traits_modi,
            check = FALSE)
head(sp_modi$spear)
head(sp_modi$traits)


###################################################
### code chunk number 15: rspear.Rnw:277-278
###################################################
citation("rspear")


