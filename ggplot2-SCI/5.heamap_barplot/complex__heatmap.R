#����·��
setwd("C:\\Users\\Administrator\\Documents\\R-study\\ggplot2-SCI\\5.heamap_barplot")
test <- matrix(rnorm(200),20,10)
test[1:10, seq(1, 10, 2)] = test[1:10, seq(1, 10, 2)] + 3
test[11:20, seq(2, 10, 2)] = test[11:20, seq(2, 10, 2)] + 2
test[15:20, seq(2, 10, 2)] = test[15:20, seq(2, 10, 2)] + 4
colnames(test) <- paste("Test",1:10,sep = "")
rownames(test) <- paste("Gene",1:20,sep = "")
dim(test)


#pheatmap����heatmap
library(pheatmap)
library(stringr)
library(gplots)
data <- mtcars[,1:7]
data <- data[,-2]
test <- as.matrix(test)
colnames(data) <- str_to_upper(colnames(data))
heatmap(test)
heatmap.2(data)

#pheatmap����������
pheatmap(test)
pheatmap(test,scale = "row",color = colorRampPalette(c("navy", "white", "firebrick3"))(50),
         border_color = "white",main = "Heatmap of DEGS",angle_col = 45,display_numbers = T,#display_number�Ƿ�չʾ����
         number_format = "%.2f", number_color = "grey30")#number_format���ֵĸ�ʽ


#heatmap������ͼ
heatmap(test, scale = "row",main = "Heatmap of DEGS by heatmap()")


#heatmap.2������ͼ
heatmap.2(test,scale = "row",col = redgreen(20),trace = "none",key.title = "",keysize = 1.2)


         
         