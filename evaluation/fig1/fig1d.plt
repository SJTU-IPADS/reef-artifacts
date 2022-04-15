#!/usr/bin/env gnuplot

reset
set output "fig1d.eps"
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 0.5,0.55
set nozeroaxis

set rmargin 1 #2
set lmargin 8 #5.5
set tmargin 0.7 #1.5
set bmargin 3.4 #2.5


### Key
set key inside right Right top enhanced nobox
set key samplen 1.5 spacing 1.4 height 0.2 width 0 #autotitles columnhead 
set key font ',20' noopaque 

### Y-axis
set ylabel "Throughput (reqs/s)" font ",22" offset -.5,0
set yrange[0:100]
set ytics 0,20,100 
set ytics font ",20" #offset 0,0 #format "%.1f"
set ytics nomirror 


### X-axis
set xlabel "Frequency (reqs/s)" font ",22" offset 0,-.0
set xrange [0:310]
set xtics 0,60,300  
set xtics font ",20" offset -0.2,0
set xtics nomirror 

plot "fig1d.dat"  using 1:3  t "Concurrent"   w l lw 5 lc rgb "#cc0000", \
     "fig1d.dat"  using 1:2  t "Preemptive" w l lw 5 lc rgb "#006600", \

#"#008800" dark green

