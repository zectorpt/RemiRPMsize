#!/bin/bash
#
# josemedeirosdealmeida@gmail.com | jose.almeida@gfi.pt
# Jose Almeida
#

URL='https://rpms.remirepo.net/enterprise/7/remi/x86_64/'

curl -L $URL|awk '{print $10}' > tmplst1
sleep 1
curl -L $URL|awk '{print $10}' >> tmplst1
sleep 0.5
#remove strings
sed 's/[align="rht>]//g' tmplst1 > tmplst2
sleep 0.5
sed 's/[</d<d&bsp;</d</]//g' tmplst2 > tmplst3
sleep 0.5
cat tmplst3|sort > tmplst4
sleep 0.5
cat tmplst4|grep M > tmplst6
sleep 0.5
sed 's/[M]//g' tmplst6 > tmplst7
sleep 1
cat tmplst4|grep K >> tmplst5
sleep 0.5
for i in `cat tmplst7`; do echo "$i * 1024" | /usr/bin/bc ; done >> tmplst5
sleep 1
sed 's/[K]//g' tmplst5 > tmplst8
sleep 0.5
#sum all lines
cat tmplst8 | xargs  | sed -e 's/\ /+/g' | bc
rm -f tmplst*
