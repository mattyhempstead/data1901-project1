
library(ggplot2)

# Gender $ vs Income
# Removed outlier value <$1e5
ggplot(gradData[gradData$Median<100000,], aes(x=ShareWomen*100, y=Median/1000)) + 
  geom_point(aes(color = factor(Major_category))) + xlab("% Women") + ylab("Median Income ($1000)") + 
  labs(color = "Major Category", title="Median Income vs Percentage of Women in Major") + 
  stat_smooth(method = "lm", col = "black")

# Major vs Income
ggplot(data = gradData, aes(Median)) + 
  geom_histogram(aes(fill = factor(gradData$Major_category)), bins = 10) +
  labs(fill = "Major Category", title="Distribution of Median Income per Major Category")

# Major vs College Jobs %
percentCollege = gradData$College_jobs/(gradData$College_jobs+gradData$Non_college_jobs+gradData$Low_wage_jobs)
ggplot(gradData, aes(x=factor(Major_category), y=percentCollege)) + 
  geom_boxplot(aes(fill = factor(Major_category))) +
  theme(axis.text.x = element_blank(), axis.title.x = element_blank(), axis.ticks.x = element_blank()) +
  labs(fill = "Major Category", title="Percent College Jobs per Major Category") + 
  ylab("Percentage of Jobs as College Jobs")

# Major Category vs Income Boxplot
#R Removed outlier value <$1e5
ggplot(gradData[gradData$Median<100000,], aes(x=factor(Major_category), y=Median/1000)) +
  geom_boxplot(aes(fill = factor(Major_category))) + 
  theme(axis.text.x = element_blank(), axis.title.x = element_blank(), axis.ticks.x = element_blank()) +
  labs(fill = "Major Category", title="Median Income per Major Category") + 
  ylab("Median Income ($1000)")

# Major vs Income Bar Plot
ggplot(head(gradData, n=10), aes(x=reorder(Major, -Median), y=Median/1000)) + 
  geom_bar(aes(fill = reorder(Major, -Median)), stat="identity") +
  theme(axis.text.x = element_blank(), axis.title.x = element_blank(), axis.ticks.x = element_blank()) +
  labs(fill = "Major", title = "Top 10 Median Incomes") + 
  ylab("Median Income ($1000)") + xlab("Major")

#Old boxplot for top 10 majors
ggplot(gradData.head.df, aes(x=reorder(Major, -score$Median), y=Income/1000)) + 
  geom_boxplot(aes(fill = reorder(sub("AND", "\nAND",Major), -score$Median))) +
  theme(axis.text.x = element_blank(), axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) +
  labs(fill = "Major", title = "Top 10 Majors by Income") + 
  ylab("Income ($1000)") + xlab("Major")