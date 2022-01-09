# ��������ͼ��ggplot2�е�geom_tile�����������ͼ
# ѧϰ�ĵ���΢�Ź��ںš�����ʦ�֡�����sciѧ��ͼ
# ����·��
setwd("C:\\Users\\Administrator\\Documents\\R-study\\ggplot2-SCI\\4.violin_plot")
#�����
library(ggplot2)
library(ggsignif)
library(ggpubr)

###ģ�����ݹ���
WT <- rnorm(5346,9,1)
Gain <- rnorm(877,10,1)
LOH <- rnorm(2619,9,1)
HD <- rnorm(774,5,2)
##�ϲ�����
data <- as.data.frame(cbind(rep(c("WT","Gain","LOH","HD"),c(5346,877,2619,774))),
                            c(WT,Gain,LOH,HD))
data$Values <- as.numeric(rownames(data))
colnames(data) <- c("Group","Values")
data$Group <- as.factor(data$Group)
rownames(data) <- NULL
data$Group=factor(data$Group, levels=c("WT","Gain","LOH","HD"))

ggplot(data)+
  geom_violin(aes(Group,Values,fill=Group,color=Group))+
  geom_boxplot(aes(Group,Values),fill="#a6a7ac",color="#a6a7ac",width=0.1,
               outlier.shape = NA)+
  scale_fill_manual(values = c("#d1d2d2","#fbd3b9","#a1c9e5","#417bb9"))+
  scale_color_manual(values = c("#d1d2d2","#fbd3b9","#a1c9e5","#417bb9"))+
  scale_y_continuous(breaks = seq(-2,14,2))+
  theme_bw()+
  theme(panel.grid = element_blank(),
        axis.text.x = element_text(angle = 45,hjust=1))+
  xlab("Status")+
  ylab("Gene expression")+
  annotate("text",x=3,y=14,label="bolditalic(MTAP)",parse=T,color="black",size=8)+
  annotate("text",x = 1.2,y=6,label="5346",color="#a6a7ac")+
  annotate("text",x = 2.2,y=7.8,label="877",color="#a6a7ac")+
  annotate("text",x = 3.3,y=7.2,label="2619",color="#a6a7ac")+
  annotate("text",x = 4.2,y=1.5,label="774",color="#a6a7ac")+
  #����������������
  geom_signif(aes(Group,Values),
              comparisons = list(c("LOH","HD"), #��Щ����бȽ�
                                 c("WT","HD")),
              map_signif_level = T,#T��ʾ�����ԣ�F��ʾp_value
              tip_length = c(0,0), #�޸������������˵ĳ���
              y_position = c(0,-0.5),#�����������ߵ�λ�ø߶�
              size = 0.5, #�ߵĴ�ϸ
              textsize = 4,#�޸������Ա�ǵĴ�С
              extend_line=-0.1,#�ߵĳ��̣�Ĭ��Ϊ0
              color="#000000",#�ߵ���ɫ
              test = "t.test")#���������