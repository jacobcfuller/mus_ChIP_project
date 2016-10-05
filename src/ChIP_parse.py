#!/home/jcfuller/anaconda3/bin/python

import numpy as np

#file_path = input("Path to file to parse: ")

file_path = "/home/jcfuller/Documents/White_lab/mus_chIP_project/chIP_calls/13R_Y_Dq_Pv05_bsites.txt"

mmc4_3_path = "/home/jcfuller/Documents/White_lab/mus_chIP_project/mmc4-3.csv"

mmc4_3 = np.genfromtxt(mmc4_3_path, delimiter=",", skip_header=1, usecols=(0, 1, 2), dtype=None)

bsites_txt = np.genfromtxt(file_path, dtype=int, skip_header=2, usecols=(1, 2))

#print(mmc4_3)

blue = 0
red = 0
yellow = 0
other = 0
sequence_gaps = 0

for i in range(len(bsites_txt)):
    mean = (bsites_txt[i][0]+bsites_txt[i][1])/2
    #difference = (bsites_txt[index][1]-bsites_txt[index][0])
    for j in range(len(mmc4_3)):
        if mmc4_3[j][0] <= mean <= mmc4_3[j][1]:
            if mmc4_3[j][2] == "blue".encode('utf-8'):
                blue += 1
            elif mmc4_3[j][2] == "red".encode('utf-8'):
                red += 1
            elif mmc4_3[j][2] == "yellow".encode('utf-8'):
                yellow += 1
            elif mmc4_3[j][2] == "other".encode('utf-8'):
                other += 1
            elif mmc4_3[j][2] == "sequence gaps".encode('utf-8'):
                sequence_gaps += 1

print("blue: %s" % blue)
print("red: %s" % red)
print("yellow: %s" % yellow)
print("other: %s" % other)
print("sequence gaps: %s" % sequence_gaps)









