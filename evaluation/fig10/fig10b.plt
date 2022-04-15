#!/usr/bin/env gnuplot

reset
set output "fig10b.eps"
# set terminal png
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 1.0,0.6
set nozeroaxis

set tics font ",22" scale 0.5

set rmargin 1 #2
set lmargin 8 #5.5
set tmargin 0.7 #1.5
set bmargin 3.4 #2.5
 

set style data histogram
set style histogram clustered gap 1
set style fill solid border -1
set boxwidth .7 relative


### Key
set key inside left Left reverse top enhanced nobox
set key samplen 1.5 spacing 1.4 height 0.2 width 0 autotitles columnhead 
set key font ',18' noopaque #maxrows 1 at graph 0.02, graph 0.975  

## Y-axis
set ylabel "Throughput (reqs/s)" font ",22" offset -.7,0
set yrange [0:600]
set ytics 0,200,600
set ytics font ",20" offset 0,-.2 #format "%.1f"
set ytics nomirror 
# set ytics add ("60" 60)


### X-axis
#set xlabel "Workload" font ",22" offset 0,-.0
set xrange [0.5:5.5]
#set xtics ('DISB-A' 1, 'DISB-B' 2, 'DISB-C' 3, 'DISB-D' 4, 'DISB-E' 5)  # DNN inference serving benchmark
set xtics font ",22" 
set xtics nomirror #offset -0.2,0.3 rotate by -30

set datafile missing "-"

plot "fig10b.dat" using ($2):xticlabels(1) t "RT-Only"              w histogram lw 2 lc rgb "#32CD32", \
     "fig10b.dat" using ($3):xticlabels(1) t "SEQ (no preemption)"  w histogram lw 2 lc rgb "#006600", \
     "fig10b.dat" using ($4):xticlabels(1) t "GPUStreams"           w histogram lw 2 lc rgb "#ff9900", \
     "fig10b.dat" using ($5):xticlabels(1) t "REEF"                 w histogram lw 2 lc rgb "#cc0000",
