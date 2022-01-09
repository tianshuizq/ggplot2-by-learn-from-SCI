# ��ɽͼ��ͼ������GO��������
# �ο��ĵ���https://www.jianshu.com/p/69aa1c9cf4d1
# clusterProfiler����YU��İ�������������ID��ת����GO��KEGG����������DO����������
# ����·��

setwd("C:\\Users\\Administrator\\Documents\\R-study\\ggplot2-SCI\\2.Volcano")

library(ggplot2)
library(openxlsx)
data <- read.xlsx("ExprGene_data.xlsx",sheet=1,colNames = T)
#���ذ�
library(clusterProfiler)
library(org.Hs.eg.db)
library(topGO)
library(enrichplot)
library(stringr)#�ַ��������İ�
genelist <- data$GeneSB
head(genelist)
#GO����������OrgDbΪע�Ϳ⣬ont��������ѡ��ALL��CC��MF��B
go <- enrichGO(gene = genelist2$ENTREZID,OrgDb = org.Hs.eg.db,ont = "ALL",pAdjustMethod = 'BH',pvalueCutoff = 0.05, qvalueCutoff = 0.2,keyType = 'ENTREZID')
head(go)
dim(go)
barplot(go,showCategory=20,drop=T)
dotplot(go,showCategory=50)

write.csv(go,"GO Analysis of data.csv")

#KEGG��������
genelist1 <- toupper(x = genelist)#ID��������ĸת��Ϊ��д
head(genelist1)
#ת��geneID
genelist2 <- bitr(geneID = genelist1,fromType = "SYMBOL",toType = 
                    "ENTREZID",OrgDb="org.Hs.eg.db")#IDת����keggҪ��ENTREZID
#��������
kegg <- enrichKEGG(gene= genelist2$ENTREZID,organism  = 'hsa',pvalueCutoff = 0.05)
dim(kegg)
head(kegg)
#�򵥿��ӻ�
dotplot(kegg, showCategory=30)
barplot(kegg,showCategory = 30,title = str_to_title("barplot for kegg"))#str_to_title()����ת��������ĸ��д

