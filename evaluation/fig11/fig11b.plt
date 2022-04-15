#!/usr/bin/env gnuplot

reset
set output "fig11b.eps"
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 0.5,0.55
set nozeroaxis

set rmargin 1 #2
set lmargin 8 #5.5
set tmargin 0.7 #1.5
set bmargin 3.4 #2.5

### Key
set key inside left Left reverse top enhanced nobox
set key samplen 1.5 spacing 1.4 height 0.2 width 0 autotitles columnhead 
set key font ',18' noopaque #maxrows 1 at graph 0.02, graph 0.975  


## Y-axis
#set ylabel "Latency (ms)" font ",22" offset -.5,0
#set yrange [0:1.0]
#set ytics 0,0.2,1.0 
set ylabel "Latency ({/Symbol m}s)" font ",22" offset 1.5,0
set yrange [1e1:5e4]
set logscale y 10
set ytics 1e1,10,1e5
set ytics scale 1, 0.7
set ytics add ('10^{1}' 1e1, '10^{2}' 1e2, '10^{3}' 1e3, '10^{4}' 1e4)
set ytics font ",20" offset 0,-.2 #format "%.1f"
set ytics nomirror 


### X-axis
set xlabel "DNN Models" font ",22" offset 0,-.0
set xrange [0.5:5.5]
set xtics font ",18" 
set xtics nomirror #offset -0.2,0.3 rotate by -30


set style data histogram
set style histogram clustered gap 1
set style fill solid border -1
set boxwidth 0.7 relative

set datafile missing "-"

plot "fig11b.dat" using ($3):xticlabels(1) t "Wait-based"   w histogram lw 2 lc rgb "#006600", \
     "fig11b.dat" using ($2):xticlabels(1) t "Reset-based"  w histogram lw 2 lc rgb "#cc0000", \

##008800
