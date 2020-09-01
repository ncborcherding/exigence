# exigence
#### Fix genes from excel

<img align="right" src="https://github.com/ncborcherding/ncborcherding.github.io/blob/master/images/hex_exigence.png" width="305" height="352">

Did I write a function/package just to address the issue with Excel autoconverting genes to date? Yes. 
An estimated 20% of published articles contain these autoconversion errors according [Ziemann et al](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-1044-7),
and despite the recent HUGO change in these gene symbols in August 2020, I still have to deal with this issue from collaborators. Thought
I would share if anyone is interested.

### How to use:

```
  file <- read.csv("data.frame) 
  file <- exTerminate(file, gene.Column = NULL) #for genes in row names  
  file <- exTerminate(file, gene.Colum = "genes") #for genes in "genes" vector
```
