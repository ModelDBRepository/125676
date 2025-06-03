# Model Code: Ca²⁺ current vs. Ca²⁺ channel cooperativity

[CalC Download](http://web.njit.edu/%7Ematveev/calc.html) | [CalC Manual](http://web.njit.edu/%7Ematveev/calc/manual.html) | [CalC Scripts](http://web.njit.edu/%7Ematveev/calc/scripts.html) | [CalC Publications](http://web.njit.edu/%7Ematveev/calc/calc_pub.html) | [Victor's Homepage](http://web.njit.edu/%7Ematveev/)


The scripts following below reproduce the simulation results presented in the manuscript:


Victor V. Matveev, Richard Bertram and Arthur Sherman (2009)  
**Ca²⁺ current vs. Ca²⁺ channel cooperativity of exocytosis**
*Journal of Neuroscience*, **29**(39): 12196-12209.  
[Abstract](http://www.jneurosci.org/cgi/content/abstract/29/39/12196) | [Full Text](http://www.jneurosci.org/cgi/content/full/29/39/12196)

----
♦ [Fig1.par](http://web.njit.edu/%7Ematveev/Scripts/MvsN/Fig1.par)  
This CalC script generates the first figure of the manuscript. It requires a single command-line parameter, the total buffer concentration (in μM) (e.g. run `calc Fig1.par 100`). The simulation produces an ASCII data file with five columns:  
1. single-channel Ca²⁺ current (varied from 0.001 to 1 pA);  
2. maximal release produced by a 1ms-long current pulse;  
3. corresponding maximal [Ca²⁺] at release site, 30 nm from channel;  
4. maximal volume-averaged [Ca²⁺];  
5. time to peak release after simulation start.


♦ [Fig1.m](http://web.njit.edu/%7Ematveev/Scripts/MvsN/Fig1.m)  
A MATLAB m-file that generates Figure 1 using data produced by CalC script `Fig1.par` above.


♦ [Fig7_8.par](http://web.njit.edu/%7Ematveev/Scripts/MvsN/Fig7_8.par)  
This CalC script generates data for Figures 7 and 8 of the manuscript. The simulation produces an ASCII data file used by MATLAB script `Fig7_8.m` below.


♦ [Fig7_8.m](http://web.njit.edu/%7Ematveev/Scripts/MvsN/Fig7_8.m)  
A MATLAB m-file that generates Figures 7 and 8 using data produced by CalC script `Fig7_8.par` above.


♦ [process2D.m](http://web.njit.edu/%7Ematveev/Scripts/MvsN/process2D.m)  
A simple MATLAB data parsing script required by MATLAB m-files `Fig1.m` and `Fig7_8.m`.


---

Supported in part by the **National Science Foundation** grant **DMS 0817703** to Victor Matveev


Victor Matveev  
This server is running a [Redhat](http://www.redhat.com/) distribution of [Linux](http://www.linux.org/).  

---
Last modified: January 8, 2010  
Converted README to Markdown: June 2, 2025
