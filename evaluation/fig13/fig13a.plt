#!/usr/bin/env gnuplot

reset
set output "fig13a.eps"
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 0.5,0.55
set nozeroaxis


set rmargin 2 #2
set lmargin 8 #5.5
set tmargin 0.7 #1.5
set bmargin 3.4 #2.5


### Key
set key inside left Left reverse top enhanced nobox
set key samplen 1.5 spacing 1.4 height 0.2 width 0 autotitles columnhead 
set key font ',18' noopaque #maxrows 1 at graph 0.02, graph 0.975  


## Y-axis
set ylabel "Latency ({/Symbol m}s)" font ",22" offset -.5,0
set yrange [0:300]
set ytics 0,100,400 
#set ylabel "Latency ({/Symbol m}s)" font ",22" offset 1.5,0
#set yrange [1e1:1e3]
#set logscale y 10
#set ytics 1e1,10,1e4
#set ytics scale 1, 0.7
#set ytics add ('10^{1}' 1e1, '10^{2}' 1e2, '10^{3}' 1e3, '10^{4}' 1e4)
set ytics font ",20" #offset 0,0 #format "%.1f"
set ytics nomirror 


### X-axis
set xlabel "Kernel Execution Time (us)" font ",22" offset 0,-.0
set xrange [50:300]
set xtics 100, 100, 300
set xtics add (' 50' 50)
set xtics font ",18" offset -0.27,0
set xtics nomirror 



plot "fig13a.dat" u ($1):($3) t "Wait-based"   w l lt 1 lw 5 lc rgb '#006600', \
     "fig13a.dat" u ($1):($2) t "Reset-based"  w l lt 1 lw 5 lc rgb '#cc0000', \
