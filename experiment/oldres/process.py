#!/usr/bin/env python3

import re


def plp():
	text = open('data4', "r") # open()
	i, j = 1, 1

	for line in text.readlines():
		l = len(line)-1
		if i%2 == 1:
			for k in range(10):
				if line[l] == '(':
					break
				l = l-1
			l = l+1
			print(j, line[l:-3])
			j = j+1
		i = i+1

def band():
	text = open('unslice.txt', "r") # open()
	index = 0
	i, j = 1, 1

	for line in text.readlines():
		l = 0	
		for t in range(len(line)):
			if line[l] == 't':
				break
			l = l+1
		l = l+4
		print(j, line[l:(l+4)])
		j = j+1

def main():
	#plp()
	band()

if __name__ == '__main__':
	main()
