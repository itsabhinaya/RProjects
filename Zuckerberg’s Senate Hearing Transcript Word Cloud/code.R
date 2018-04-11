library(tm)
library(wordcloud)
library(RColorBrewer)

lines <- readLines("fb.txt")
fb_script<-Corpus(VectorSource(lines))
fb_script_modi<-tm_map(fb_script,stripWhitespace)
fb_script_modi <- tm_map(fb_script_modi, removePunctuation)
fb_script_modi <- tm_map(fb_script_modi, removeWords, stopwords('english'))

png("FB_wordcloud_1.png", width=12, height=12, units="in", res=300)
wordcloud(fb_script_modi, random.order=F, min.freq=1, colors=brewer.pal(8, "Dark2"), vfont=c("sans serif","plain"))
dev.off()

team_lines = grep("team", lines, value = TRUE)
write(team_lines, "team_lines.txt")
