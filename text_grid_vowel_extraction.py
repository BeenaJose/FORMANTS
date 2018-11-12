'''
	<text_grid_vowel_extraction.py> is the python script to extract the vowel, start_time, end_time and target in textgrid file. 

'''

#importing the supported libraries
import linecache
from itertools import islice
from decimal import Decimal

#Split function to split the strings the text file
def split_func(line, char):
	temp1, temp2 = line.split(char)
	return temp1, temp2

#To extract those four values from text_grid file.
def text_grid_vowel_extraction(filename):
	#print('.')
	#initialise some variables
	target_word = 'mark = "T"'	
	x_min = 'xmin'
	x_max = 'xmax'
	target_time = []
	line_numbers = []
	vowels_start_line_no = 0
	x_min_line_numbers = []
	x_max_line_numbers = []
	xmin_values = []
	xmax_values = []
	xmin_before_values = []
	xmax_before_values = []
	x = []
	
	#open the textgrid file
	f = open(filename)
	
	#Find the target variable 'T'
	for num, line in enumerate(f):
		if target_word in line:
			time_temp = linecache.getline(filename, num)
			temp, temp_time = split_func(time_temp, '=')
			time1, temp1 = split_func(temp_time,' \n')
			#print time1
			temp2, exact_time = split_func(time1, ' ')
			line_numbers.append(num)
			target_time.append(Decimal(exact_time))		#Found the target value and storing the target time into list
	#Close the file
	f.close()
	
	#Open the textgrid file 
	f = open(filename)
	
	#Get a line number start from item 2
	vowel_tier = 'item [2]:'
	for num1, line1 in enumerate(f):
		if vowel_tier in line1:
			vowels_start_line_no = num1			#Getting the line number for phonetic vowel tier
	f.close()
	
	#Again open the textgrid file.
	f = open(filename)
	
	#Slicing the data and start reading the text from phonetic vowel tier
	for line2 in islice(f, vowels_start_line_no, None):
		#Getting the xmin values in phonetic tier
		if x_min in line2:
			temp_line = line2
			x_min_line_numbers.append(num1)
			temp1,temp2 = split_func(temp_line, '=')
			#print temp2
			#temp3,temp4 = split_func(temp2, ' ')
	 		xmin_time, temp5 = split_func(temp2, '\r')
	 		#print xmin_time
			xmin_values.append(Decimal(xmin_time))	
		#Getting the xmax values in phonetic tier
		if x_max in line2:
			temp_line = line2
			x_max_line_numbers.append(num1)
			temp1,temp2 = split_func(temp_line, '=')
			#temp3,temp4 = split_func(temp2, ' ')
	 		xmax_time, temp5 = split_func(temp2, '\r')
			xmax_values.append(Decimal(xmax_time))
	#Getting vowel xmin values
	for i in range(0, len(target_time)):
		#print target_time[i]
		for j in range(len(xmin_values)):
			#print len(xmin_values)
			if target_time[i] < xmin_values[j]:
				#print target_time[i], xmin_values[j]
				xmin_before = xmin_values[j - 1]
		    		xmax_before = xmax_values[j - 1]
				xmin_before_values.append(xmin_before)
				xmax_before_values.append(xmax_before)
				break
	
	f.close()
	
	#Again open the textgrid file
	f = open(filename)
	
	#getting xmin and xmax values of each vowel lies in 'T'
	for num, lines in enumerate(f):
		for s in range(len(target_time)):
			target_vowel = 'xmin = '+str(xmin_before_values[s])
			#print target_vowel
			if target_vowel in lines:
				#print target_vowel  
				time_temp = linecache.getline(filename, num+3)
				#print time_temp
				#tem1,tem2,tem3 = line.split('\"',3)
				#print tem1,tem2,tem3
				temp1, temp2 = split_func(time_temp, '=')
				temp3, temp4 = split_func(temp2,'\n')
				x.append(temp3)
				#temp5, exact_vowel = split_func(temp3, ' ')
				#print temp3
	f.close()
	

	start_time = []
	end_time = []
	for i in range(len(target_time)):
		start_time.append(float(target_time[i])-0.02)			#To obtain the new start time with 20 ms
		end_time.append(float(target_time[i])+0.02)			    #To obtain the new start time with 20 ms
	return start_time, end_time, x, target_time
	
