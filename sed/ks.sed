:ck;h
    s/^[0-2][0-9] [0-5][0-9] [0-5][0-9]$//;tok
    s/.*/Supply time on stdin in a format corresponding to what date "+%H %M %S" would output/
    b
:ok;x
:s; s/^\(.. ..\) \(..\)/\1 000\2/;tm
:m; s/^.. .0/& 00000/;tm1
    s/^.. .1/& 00060/;tm1;  s/^.. .2/& 00120/;tm1;  s/^.. .3/& 00180/;tm1
    s/^.. .4/& 00240/;tm1;  s/^.. .5/& 00300/;tm1;  s/^.. .6/& 00360/;tm1
    s/^.. .7/& 00420/;tm1;  s/^.. .8/& 00480/;tm1;  s/^.. .9/& 00540/;tm1
:m1;s/^.. 0./& 00000/;th0
    s/^.. 1./& 00600/;th0;  s/^.. 2./& 01200/;th0;  s/^.. 3./& 01800/;th0;
    s/^.. 4./& 02400/;th0;  s/^.. 5./& 03000/;th0
:h0;s/^.0 ../& 00000/;th1
    s/^.1 ../& 03600/;th1;  s/^.2 ../& 07200/;th1;  s/^.3 ../& 10800/;th1
    s/^.4 ../& 14400/;th1;  s/^.5 ../& 18000/;th1;  s/^.6 ../& 21600/;th1
    s/^.7 ../& 25200/;th1;  s/^.8 ../& 28800/;th1;  s/^.9 ../& 32400/;th1
:h1;s/^0. ../00000/;tsp
    s/^1. ../36000/;tsp
    s/^2. ../72000/;tsp
:sp;s/$/|/
:d4;s/\<\(.\)\(....\>.*|.*\)/\2\1/;td4; s/$/ /
:d3;s/\<\(.\)\(...\>.*|.*\)/\2\1/;td3; s/$/ /
:d2;s/\<\(.\)\(..\>.*|.*\)/\2\1/;td2; s/$/ /
:d1;s/\<\(.\)\(.\>.*|.*\)/\2\1/;td1; s/$/ /
:d0;s/\<\(.\)\(\>.*|.*\)/\2\1/;td0; s/$/ /
:c0;s/.*|//
    s/0//g
    s/1/o/g
    s/2/oo/g
    s/3/ooo/g
    s/4/oooo/g
    s/5/ooooo/g
    s/6/oooooo/g
    s/7/ooooooo/g
    s/8/oooooooo/g
    s/9/ooooooooo/g
:+; s/\(.*\) oooooooooo\(.*\)/\1o \2/;t+
:c1;s/ooooooooo /9/g
    s/oooooooo /8/g
    s/ooooooo /7/g
    s/oooooo /6/g
    s/ooooo /5/g
    s/oooo /4/g
    s/ooo /3/g
    s/oo /2/g
    s/o /1/g
    s/ /0/g
:c2;s/\(..\)\(...\)/It is \1.\2 kiloseconds./
:zp;s/0\(.\)\./\1./
