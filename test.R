# you need to install these first
# in the packages tab (lower right corner) click install
# after installation check if packages exists in the packages tab
#enable library by ticking the checkbox
library('httr') 
library('XML')
library('dplyr')
library('jsonlite')
library('ggplot2')

# call to url
response <- GET("https://branch.formbird.com/odata/0525a150-af9c-11e6-812e-cd6505553560/Insect");
# get content from URL
responseContent <- content(xmlParse(response),as="text",type="text/xml",encoding = 'UTF-8');
# since we are not sending in XLM but json we need to convert json values to R acceptable format
xmlNames <- fromJSON(responseContent)

# -----  from here on out you apply R specific libraries to the datasets ----

# assign values of the response to properties
properties <- xmlNames$value
# get genus of a document
genus <- properties$genus
 
#plot a bar chart
ggplot(properties, aes(x=genus, fill=factor(isPoisonous))) +
geom_bar(width = 0.5) +
  xlab("Genus") +
  ylab("Total COunt") +
  labs(fill="isPoisonous")