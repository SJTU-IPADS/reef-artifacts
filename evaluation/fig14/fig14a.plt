#!/usr/bin/env gnuplot

reset
set output "fig14a.eps"
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 0.5,0.55
set nozeroaxis


#set rmargin 5.5 #2
#set lmargin 6.5 #5.5
# set tmargin 0.7 #1.5
# set bmargin 3.4 #2.5


set rmargin 5.5 #2
set lmargin 8 #5.5
set tmargin 0.7 #1.5
set bmargin 3.4 #2.5

### Key
set key inside left Left reverse top enhanced nobox
set key samplen 1.5 spacing 1.4 height 0.2 width 0
set key font ',18' noopaque #maxrows 1 at graph 0.02, graph 0.975  


## Y-axis
set ylabel "Preempt. Latency ({/Symbol m}s)" font ",22" offset 0.,0
set yrange [0:0.400]
set ytics 0,0.100,0.400
set ytics font ",20" #offset .6,0 #format "%.1f"
set ytics nomirror 

set y2label "Exec. Latency (ms)" font ",22" offset -1.5,0
set y2range [10:18]
set y2tics 10,2,18
set y2tics font ",20" offset -1.0,0 #format "%.1f"
set y2tics nomirror

### X-axis
set xlabel "DQ Capacity" font ",22" offset 0,-.0
set xrange [1:256]
set logscale x 2
set xtics 1,4,256
#set xtics add ('2^{0}' 1, '2^{1}' 2, '2^{2}' 4, '2^{3}' 8, '2^{4}' 16, '2^{5}' 32, '2^{6}' 64, '2^{7}' 128, '2^{8}' 256, '2^{9}' 512)
set xtics font ",18" offset -0.27,0
set xtics nomirror 



plot "fig14a.dat" u ($1):($3/1000) t "Preemption"  w l lt 1 lw 5 lc rgb '#cc0000' axis x1y1, \
     "fig14a.dat" u ($1):($2/1000) t "Execution"   w l lt 1 lw 5 lc rgb '#006600' axis x1y2, \
