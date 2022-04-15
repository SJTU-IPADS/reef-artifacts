#!/usr/bin/env gnuplot

reset
set output "fig16a.eps"
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 0.5,0.55
set nozeroaxis

set rmargin 1 #2
set lmargin 8 #5.5
set tmargin 1.7 #1.5
set bmargin 3.4 #2.5



### Key
set key inside left Left reverse top
set key samplen 1.5 spacing 1.4 height 0.2 width 0 autotitles columnhead 
set key font ',18' noopaque #maxrows 1 at graph 0.02, graph 0.975


## Y-axis
set ylabel "Overhead (%)" font ",22" offset -.5,0
set yrange [0:200]
set ytics 0,50,200
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

#set label  1 "503%" left at 4.5, 212.0 font ",18" tc rgb "#000000" front 

set datafile missing "-"


plot "fig16a.dat" using ($3/$2*100-100):xticlabels(1) t "Default"  w histogram lw 2 lc rgb "#006600",\
     "fig16a.dat" using ($4/$2*100-100):xticlabels(1) t "+GlobalPtr"   w histogram lw 2 lc rgb "#ff9900", \
     "fig16a.dat" using ($5/$2*100-100):xticlabels(1) t "+ProxyKernel" w histogram lw 2 lc rgb "#cc0000"
     #'' using 0:($5/$2*100-100):($5/$2*100-100) with labels offset char 1.5, 1 left rotate by 90