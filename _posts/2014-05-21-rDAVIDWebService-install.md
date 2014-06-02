---
layout: posts
categories: 
  - ApTranscriptome
title: rDAVIDWebService Installation
tags: 
  - annotation
  - Bioconductor
  - rJava
---

I was excited to discover the `rDAVIDWebService` package from [Bioconductor](http://www.bioconductor.org/packages/release/bioc/html/RDAVIDWebService.html) so I could include DAVID queries in my tech report.

Unfortunately, the installation process, deceptively simply described as 

~~~
source("http://bioconductor.org/biocLite.R")
biocLite("RDAVIDWebService")
~~~

ended up being a *major* pain-in-the-ass. I don't remember all the details, but here I try to recreate the Google Fu that finally allowed me to install the package.

When I simply tried to install `rDAVIDWebService` as above, R complained about missing dependencies. Most installed without problem in the standard way, except for `rJava` and `XML`. 

`rJava` looked like a real pain as multiple questions and answer exist on SO. The `sudo apt-get install r-cran-rjava` didn't work for me as I'm using the newest version of R (3.1) and it complained "package 'rJava' was built before R 3.0.0: please re-install it". Easier said then done. 

This [question](https://stackoverflow.com/questions/16438073/unable-to-install-rjava-in-r-3-0-in-ubuntu-13-04/16453399#16453399) looked promising, but still didn't work for me. A clue was that after installing openjdk-7, running `sudo R CMD javareconf` still listed the Java version as 1.6. I had already installed Java 1.7 as this [SO question](http://stackoverflow.com/questions/16438073/unable-to-install-rjava-in-r-3-0-in-ubuntu-13-04) suggested that was the answer (it wasn't). 

~~~
jsg@jsg-ThinkCentre-M90z:~$ sudo R CMD javareconf
Java interpreter : /usr/bin/java
Java version     : 1.6.0_31
Java home path   : /usr/lib/jvm/java-6-openjdk-i386/jre
Java compiler    : /usr/bin/javac
Java headers gen.: /usr/bin/javah
Java archive tool: /usr/bin/jar

trying to compile and link a JNI progam 
detected JNI cpp flags    : 
detected JNI linker flags : -L$(JAVA_HOME)/lib/i386/server -ljvm
gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG      -fpic  -g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Wformat-security -Werror=format-security -D_FORTIFY_SOURCE=2 -g  -c conftest.c -o conftest.o
conftest.c:1:17: fatal error: jni.h: No such file or directory
compilation terminated.
make: *** [conftest.o] Error 1
Unable to compile a JNI program


JAVA_HOME        : /usr/lib/jvm/java-6-openjdk-i386/jre
Java library path: 
JNI cpp flags    : 
JNI linker flags : 
Updating Java configuration in /usr/lib/R
Done.
~~~

This [question](http://askubuntu.com/questions/64329/how-to-replace-openjdk-6-with-openjdk-7) explained how to get Ubuntu to use 1.7 as default. 

~~~
update-java-alternatives -l
sudo update-java-alternatives -s java-1.7.0-openjdk-i386
~~~

After that, I was able to run `sudo R CMD javareconf` without error:

jsg@jsg-ThinkCentre-M90z:~$ java -version

~~~
java version "1.7.0_55"
OpenJDK Runtime Environment (IcedTea 2.4.7) (7u55-2.4.7-1ubuntu1~0.12.04.2)
OpenJDK Server VM (build 24.51-b03, mixed mode)
~~~
 
jsg@jsg-ThinkCentre-M90z:~$ sudo R CMD javareconf

~~~
Java interpreter : /usr/bin/java
Java version     : 1.7.0_55
Java home path   : /usr/lib/jvm/java-7-openjdk-i386/jre
Java compiler    : /usr/bin/javac
Java headers gen.: /usr/bin/javah
Java archive tool: /usr/bin/jar

trying to compile and link a JNI progam 
detected JNI cpp flags    : -I$(JAVA_HOME)/../include
detected JNI linker flags : -L$(JAVA_HOME)/lib/i386/client -ljvm
gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I/usr/lib/jvm/java-7-openjdk-i386/jre/../include     -fpic  -g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Wformat-security -Werror=format-security -D_FORTIFY_SOURCE=2 -g  -c conftest.c -o conftest.o
gcc -std=gnu99 -shared -Wl,-Bsymbolic-functions -Wl,-z,relro -o conftest.so conftest.o -L/usr/lib/jvm/java-7-openjdk-i386/jre/lib/i386/client -ljvm -L/usr/lib/R/lib -lR

JAVA_HOME        : /usr/lib/jvm/java-7-openjdk-i386/jre
Java library path: $(JAVA_HOME)/lib/i386/client
JNI cpp flags    : -I$(JAVA_HOME)/../include
JNI linker flags : -L$(JAVA_HOME)/lib/i386/client -ljvm
Updating Java configuration in /usr/lib/R
Done.
~~~

Opened R and `install.packages("rJava")` ran without trouble. Yay!


NOTE - this required a few extra steps on a 64-bit computer.

Install Java 7

    sudo apt-get install openjdk-7-*

Install IcedTea plugin

    sudo apt-get install icedtea-7-plugin

Update Java

    sudo update-java-alternatives -s java-1.7.0-openjdk-amd64

Configure R

    sudo R CMD javareconf

The successful result!

~~~
Java interpreter : /usr/bin/java
Java version     : 1.7.0_55
Java home path   : /usr/lib/jvm/java-7-openjdk-amd64/jre
Java compiler    : /usr/bin/javac
Java headers gen.: /usr/bin/javah
Java archive tool: /usr/bin/jar

trying to compile and link a JNI progam 
detected JNI cpp flags    : -I$(JAVA_HOME)/../include
detected JNI linker flags : -L$(JAVA_HOME)/lib/amd64/server -ljvm
gcc -std=gnu99 -I/usr/share/R/include -DNDEBUG -I/usr/lib/jvm/java-7-openjdk-amd64/jre/../include     -fpic  -g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Wformat-security -Werror=format-security -D_FORTIFY_SOURCE=2 -g  -c conftest.c -o conftest.o
gcc -std=gnu99 -shared -Wl,-Bsymbolic-functions -Wl,-z,relro -o conftest.so conftest.o -L/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server -ljvm -L/usr/lib/R/lib -lR


JAVA_HOME        : /usr/lib/jvm/java-7-openjdk-amd64/jre
Java library path: $(JAVA_HOME)/lib/amd64/server
JNI cpp flags    : -I$(JAVA_HOME)/../include
JNI linker flags : -L$(JAVA_HOME)/lib/amd64/server -ljvm
Updating Java configuration in /usr/lib/R
Done.
~~~


Okay - `rJava` installed. Next, I had to figure out how to install the `XML` package. Naively trying `install.packages("XML")` crashed with error. I checked that `libxml2` was installed - it was. Turned out that I [also needed to system install libxml2-dev](https://stat.ethz.ch/pipermail/bioconductor/2013-July/054140.html)

    sudo apt-get install libxml2-dev

After all this, 

~~~
source("http://bioconductor.org/biocLite.R")
biocLite("RDAVIDWebService")
~~~

finally worked!!! Onto real analysis...

