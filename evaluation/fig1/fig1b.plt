#!/usr/bin/env gnuplot

reset
set output "fig1b.eps"
set terminal postscript "Helvetica,16" eps enhance color dl 2

set pointsize 1
set size 0.5,0.55
set zeroaxis

set rmargin 1 #2
set lmargin 8 #5.5
set tmargin 0.7 #1.5
set bmargin 3.4 #2.5


### Key
#unset key
set key inside left Left reverse top enhanced nobox
set key samplen 1.5 spacing 1.4 height 0.2 width 0 autotitles columnhead 
set key font ',20' noopaque #maxrows 1 at graph 0.02, graph 0.975

###white box
set obj 1 rect at 1.7,30 size 1.8,40  fc rgb "white" fs solid 1.0 border -2 front 


### Y-axis
set ylabel "Task Latency (ms)" font ",22" offset -.5,0
set yrange[0:60]
set ytics 0,15,60 
set ytics font ",20" format "%4.0f" #offset 0,0 
set ytics nomirror 


### X-axis
set xlabel "Number of BE Tasks" font ",22" offset 0,-.0
set xrange[0.5:5.5]
set xtics font ",20" 
set xtics ('0' 1, '1' 2, '2' 3, '4' 4, '8' 5)
set xtics nomirror 


#set grid lw 2
#set grid xtics ytics linetype 2 lw 0.5


###set style
set style boxplot nooutliers 
set style boxplot fraction 1.0
set style data boxplot


plot 'fig1b.dat' \
        using (1):1  lw 4 lc rgb '#006600',\
     '' using (2):2  lw 4 lc rgb '#006600',\
     '' using (3):3  lw 4 lc rgb '#006600',\
     '' using (4):4  lw 4 lc rgb '#006600',\
     '' using (5):5  lw 4 lc rgb '#006600'\


#line1: lt 1 lw 5 pt  4 ps 2.0 lc rgb '#000000' #black
#line2: lt 1 lw 5 pt  3 ps 2.2 lc rgb '#cc0000' #dark red
#line3: lt 1 lw 5 pt  6 ps 2.0 lc rgb '#0000ee' #blue
#line4: lt 1 lw 5 pt 10 ps 2.2 lc rgb '#006622' #green
#line5: lt 1 lw 5 pt  2 ps 2.2 lc rgb '#6600cc' #dark purple