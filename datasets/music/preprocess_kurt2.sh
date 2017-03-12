import os, sys
import subprocess


length = float(subprocess.check_output('ffprobe -i kurt/kurt-most.wav -show_entries format=duration -v quiet -of csv="p=0"', shell=True))

size = 8
num = 3200
for i in xrange(0, num):
	time = i * ((length-size)/float(num))
	os.system('ffmpeg -ss {} -t 8 -i kurt/kurt-most.wav -ac 1 -ab 16k -ar 16000 kurt/parts/p{}.flac'.format(time, i))


