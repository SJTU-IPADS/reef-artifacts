#!/usr/bin/env gnuplot

reset
set output "fig15a.eps"
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 0.5,0.55
set nozeroaxis

set rmargin 1 #2
set lmargin 8 #5.5
set tmargin 0.7 #1.5
set bmargin 3.4 #2.5


### Key
set key inside right Right top
set key samplen 1.5 spacing 1.4 height 0.2 width 0 autotitles columnhead 
set key font ',18' noopaque #maxrows 1 at graph 0.02, graph 0.975


## Y-axis
set ylabel "Latency (ms)" font ",22" offset -.5,0
set yrange [0:30]
set ytics 0,10,30
set ytics font ",20" #offset 0,0 #format "%.1f"
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

plot "fig15a.dat" using ($2/1000):xticlabels(1) t "RT-Only"    w histogram lw 2 lc rgb "#006600",\
     "fig15a.dat" using ($3/1000):xticlabels(1) t "GPUStreams" w histogram lw 2 lc rgb "#ff9900", \
     "fig15a.dat" using ($4/1000):xticlabels(1) t "DKP"  w histogram lw 2 lc rgb "#cc0000",\

##008800
