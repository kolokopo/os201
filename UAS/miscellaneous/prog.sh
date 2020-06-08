export GitHubUser="kolokopo";
export PSTAMP="TMP1=\"\$(date +%y%m%d-%H%M%S)\"; TMP2=\"\$(echo \$TMP1-\$GitHubUser-\${PWD##*/}|sha1sum|cut -c1-4)\"; echo \"\$TMP1-\$TMP2-\${PWD##*/}/> \";"; echo $PSTAMP ;  eval $PSTAMP;
TMP1="$(date +%y%m%d-%H%M%S)"; TMP2="$(echo $TMP1-$GitHubUser-${PWD##*/}|sha1sum|cut -c1-4)"; echo "$TMP1-$TMP2-${PWD##*/}/> ";

------------------------------------------------------------------

export CheckUser="kolokopo";

startend=$(grep -o "[0-9].*[a-z].*[0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] [A-Z]M" -- 0001-mytest.txt)

readarray -t se <<<"$startend"

start=$(date -d "${se[0]}" "+%y%m%d-%H%M%S")
stop=$(date -d "${se[1]}" "+%y%m%d-%H%M%S")

sequence="SEQOK"

tstamp=($(grep -o "[0-9][0-9][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9][0-9][0-9]" -- 0001-mytest.txt))

iterator=$start

for ts in ${tstamp[@]}
do
    bool=$([[ $iterator > $ts ]]; echo $?)
    if [[ $bool = 0 ]]
        then sequence="SEQNO"
        break
    fi
    iterator=$ts
done

bool=$([[ $iterator > $stop ]]; echo $?)
if [[ $bool = 0 ]]; then sequence="SEQNO"; fi

sha1sum="SUMOK"

sha1sum 0000-mypub.txt 0001-mytest.txt 0002-mytest.txt.asc > SHA1SUM
sha1sum -c SHA1SUM

created=$(sed -n '2p' SHA1SUM | cut -c 1-8)
origin=$(sed -n '2p' SHA1SUM-ORI | cut -c 1-8)

if [ "$created" != "$origin" ]; then sha1sum="SUMNO"; fi

eval $PSTAMP

echo "$GitHubUser ZCZCSCRIPTSTART $start $CheckUser\n" >> temp0
echo "$GitHubUser $CheckUser "$TMP1-$TMP2-${PWD##*/}/" $start $sequence $sha1sum $origin\n" >> temp0
echo "$GitHubUser ZCZCSCRIPTSTOP $stop $sequence" >> temp0

CEKSAYA=$(cat temp0)

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

export CheckUser="krisnadwitama";

startend=$(grep -o "[0-9].*[a-z].*[0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] [A-Z]M" -- 0001-test0.txt)

readarray -t se <<<"$startend"

start=$(date -d "${se[0]}" "+%y%m%d-%H%M%S")
stop=$(date -d "${se[1]}" "+%y%m%d-%H%M%S")

sequence="SEQOK"

tstamp=($(grep -o "[0-9][0-9][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9][0-9][0-9]" -- 0001-test0.txt))

iterator=$start

for ts in ${tstamp[@]}
do
    bool=$([[ $iterator > $ts ]]; echo $?)
    if [[ $bool = 0 ]]
        then sequence="SEQNO"
        break
    fi
    iterator=$ts
done

bool=$([[ $iterator > $stop ]]; echo $?)
if [[ $bool = 0 ]]; then sequence="SEQNO"; fi

sha1sum="SUMOK"

sha1sum 0000-pub0.txt 0001-test0.txt 0002-test0.txt.asc > SHA1SUM-0
sha1sum -c SHA1SUM-0

created=$(sed -n '2p' SHA1SUM-0 | cut -c 1-8)
origin=$(sed -n '2p' SHA1SUM-0-ORI | cut -c 1-8)

if [ "$created" != "$origin" ]; then sha1sum="SUMNO"; fi

eval $PSTAMP

echo "$GitHubUser ZCZCSCRIPTSTART $start $CheckUser\n" >> temp1
echo "$GitHubUser $CheckUser "$TMP1-$TMP2-${PWD##*/}/" $start $sequence $sha1sum $origin\n" >> temp1
echo "$GitHubUser ZCZCSCRIPTSTOP $stop $sequence" >> temp1

CEKSEBELA1=$(cat temp1)

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

export CheckUser="kurilham19";

startend=$(grep -o "[0-9].*[a-z].*[0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9] [A-Z]M" -- 0001-test1.txt)

readarray -t se <<<"$startend"

start=$(date -d "${se[0]}" "+%y%m%d-%H%M%S")
stop=$(date -d "${se[1]}" "+%y%m%d-%H%M%S")

sequence="SEQOK"

tstamp=($(grep -o "[0-9][0-9][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9][0-9][0-9]" -- 0001-test1.txt))

iterator=$start

for ts in ${tstamp[@]}
do
    bool=$([[ $iterator > $ts ]]; echo $?)
    if [[ $bool = 0 ]]
        then sequence="SEQNO"
        break
    fi
    iterator=$ts
done

bool=$([[ $iterator > $stop ]]; echo $?)
if [[ $bool = 0 ]]; then sequence="SEQNO"; fi

sha1sum="SUMOK"

sha1sum 0000-pub1.txt 0001-test1.txt 0002-test1.txt.asc > SHA1SUM-1
sha1sum -c SHA1SUM-1

created=$(sed -n '2p' SHA1SUM-1 | cut -c 1-8)
origin=$(sed -n '2p' SHA1SUM-1-ORI | cut -c 1-8)

if [ "$created" != "$origin" ]; then sha1sum="SUMNO"; fi

eval $PSTAMP

echo "$GitHubUser ZCZCSCRIPTSTART $start $CheckUser\n" >> temp2
echo "$GitHubUser $CheckUser "$TMP1-$TMP2-${PWD##*/}/" $start $sequence $sha1sum $origin\n" >> temp2
echo "$GitHubUser ZCZCSCRIPTSTOP $stop $sequence" >> temp2

CEKSEBELA2=$(cat temp2)

-----------------------------------------------------------

PS1="$ "
echo $GitHubUser
echo $PSTAMP
eval $PSTAMP
PS1="\$(eval \$PSTAMP)"

-----------------------------------------------------------

echo -e $CEKSAYA
echo -e $CEKSEBELA1
echo -e $CEKSEBELA2

-----------------------------------------------------------

sha1sum 0000-pub0.txt 0001-test0.txt 0002-test0.txt.asc > SHA1SUM-0
sha1sum -c SHA1SUM-0
sha1sum 0000-pub1.txt 0001-test1.txt 0002-test1.txt.asc > SHA1SUM-1
sha1sum -c SHA1SUM-1

cek0="krisnadwitama"
cek1="kurilham19"