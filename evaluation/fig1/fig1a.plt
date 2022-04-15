#!/usr/bin/env gnuplot

reset
set output "fig1a.eps"
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 0.5,0.55
set nozeroaxis

set rmargin 1 #2
set lmargin 8 #5.5
set tmargin 0.7 #1.5
set bmargin 3.4 #2.5


### Key
set key inside left Left reverse invert top enhanced nobox
set key samplen 1.5 spacing 1.4 height 0.2 width 0 autotitles columnhead 
set key font ',20' noopaque #maxrows 1 at graph 0.02, graph 0.975


### Y-axis
set ylabel "Throughput (reqs/s)" font ",21" offset -.5,0
set yrange[0:300]
set ytics 0,75,300
set ytics font ",20" #offset 0,0 #format "%.1f"
set ytics nomirror 


### X-axis
set xlabel "Number of BE Tasks" font ",22" offset 0,-.0
set xrange[0.5:5.5]
set xtics font ",20" 
set xtics ('0' 1, '1' 2, '2' 3, '4' 4, '8' 5)
set xtics nomirror 


###set style
set style data histogram
set style histogram rows 
set style fill solid border -1
set boxwidth 0.5 relative


set datafile missing "-"
 

plot "fig1a.dat" using ($3):xticlabels(1) w histogram lw 2 lc rgb "#006600", \
     "fig1a.dat" using ($2):xticlabels(1) w histogram lw 2 lc  rgb "#cc0000"


#ff8040 orange
#006600 dark green