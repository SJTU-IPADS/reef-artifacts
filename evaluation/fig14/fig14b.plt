#!/usr/bin/env gnuplot

reset
set output "fig14b.eps"
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
set key samplen 1.5 spacing 1.4 height 0.2 width 0  
set key font ',18' noopaque #maxrows 1 at graph 0.02, graph 0.975  


## Y-axis
#set ylabel "Latency ({/Symbol m}s)" font ",22" offset -.5,0
set ylabel "Overhead (%)" font ",22" offset -.2,0
set yrange [0:10]
set ytics 0,2,10
#set ytics add ("50" 50)
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

# TODO: set new abs data to the fig
# set label 1  "245"  at 1,1.8+0.7 center font ",18" tc rgb '#000000' front
# set label 2   "70"  at 2,2.0+0.7 center font ",18" tc rgb '#000000' front
# set label 3  "224"  at 3,5.1+0.7 center font ",18" tc rgb '#000000' front
# set label 4  "224"  at 4,2.7+0.7 center font ",18" tc rgb '#000000' front
# set label 5  "102"  at 5,1.9+0.7 center font ",18" tc rgb '#000000' front


plot "fig14b.dat" using ($2):xticlabels(1) t "Execution"   w histogram lw 2 lc rgb "#006600", 

##008800
