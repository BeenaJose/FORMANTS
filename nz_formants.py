''' 
	<nz_formants.py> is the main python file for estimating the formants in a wav file.
'''

#Importing libraries
import formants as f
import text_grid_vowel_extraction as tg
import os



for i in range(len(exists)):
	if os.path.isfile(exists[i]):
		os.remove(exists[i])

#Initialise the global variables to store the start time, end time, vowel, target in each wav file
begin = []
end = []
vowel = []
target = []
wav = []
lpc_features = []
quasi_features = []

#TooGood Textgrid and Wav filenames list#
tg_wav_dir_path = 'dataset/wav_files/TooGood_wav'
tg_textgrid_dir_path = 'dataset/textgrid_files/TooGood_txt'
tg_wav_dir_path =  os.path.abspath('dataset/wav_files/TooGood_wav')
tg_wav_files = sorted(os.listdir(tg_wav_dir_path))
tg_textgrid_dir_path = os.path.abspath('dataset/textgrid_files/TooGood_txt')
tg_textgrid_files = sorted(os.listdir(tg_textgrid_dir_path))
tg_wav_len = len(tg_wav_files)

#Crump Textgrid and Wav filenames list#
c_wav_dir_path = 'dataset/wav_files/crump_wav'
c_textgrid_dir_path = 'dataset/textgrid_files/crump_txt'
c_wav_files = sorted(os.listdir('dataset/wav_files/crump_wav'))
c_textgrid_files = sorted(os.listdir('dataset/textgrid_files/crump_txt'))
c_wav_len = len(c_wav_files)

#Hillary Textgrid and Wav filenames list#
h_wav_dir_path = 'dataset/wav_files/hillary_wav'
h_textgrid_dir_path = 'dataset/textgrid_files/hillary_txt'
h_wav_files = sorted(os.listdir('dataset/wav_files/hillary_wav'))
h_textgrid_files = sorted(os.listdir('dataset/textgrid_files/hillary_txt'))
h_wav_len = len(h_wav_files)

#Nordmeyer Textgrid and Wav filenames list#
nr_wav_dir_path = 'dataset/wav_files/nordmeyer_wav'
nr_textgrid_dir_path = 'dataset/textgrid_files/nordmeyer_txt'
nr_wav_files = sorted(os.listdir('dataset/wav_files/nordmeyer_wav'))
nr_textgrid_files = sorted(os.listdir('dataset/textgrid_files/nordmeyer_txt'))
nr_wav_len = len(nr_wav_files)

#Initialize the list to store the all wav and textgrid files data#
wav_files = []
textgrid_files = []

wav_len = len(wav_files)

#Looping over the wav files in a wav_files directory to estimate the vowels and its formants in each wav file
for i in range(wav_len):
	formants_file = os.path.abspath('output/vowel_formants/formants.csv')	
	feature_filename = 'output/features/extracted_features.txt'
	#print str(wav_files[i])
	
	#Getting the start-time, end_time, peak_time and vowels form text_grid file
	start_time, end_time, vowels, peak_time =  tg.text_grid_vowel_extraction(textgrid_files[i])
	
	#Looping over the wav files to calculate the vowels and formants in each wav file
	for j in range(len(peak_time)):
		wav.append(wav_files[i])		#Listing all wav_files
		begin.append(start_time[j])		#Listing all start_times of each wav file
		end.append(end_time[j])			#Listing all end_times of each wav file
		vowel.append(vowels[j])			#Listing all vowels in each wav file
		target.append(peak_time[j])		#Listing all target times in each vowel
		
	
		#From the formants.py we are receiving the LPC Features and quasi features of each vowel in each wav file and store it in 2 variables
		lpc, quasi = f.predict_from_times(wav_files[i], formants_file, start_time[j], end_time[j], feature_filename)
		lpc_features.append(lpc)		#Listing of all lpc features
		quasi_features.append(quasi)		#listing of all quasi features


#Create and open the estimated formants file to store the predicted data
nz_formants_file = open('output/vowel_formants/nz_estimated_formants.csv', 'a')

#Write something the estimated formants file.
nz_formants_file.write('Filename,Vowel,LPC_Features,Quasi_Features,F1,F2,F3,F4\n')


for i in range(len(dl_formants1)):
	nz_formants_file.write(str(wav[i])+','+str(vowel[i])+','+'"'+str(lpc_features[i])+'"'+','+'"'+str(quasi_features[i])+'"'+','+str(dl_formants1[i])+','+str(dl_formants2[i])+','+str(dl_formants3[i])+','+str(dl_formants4[i])+'\n')

#Create and Open the estimated formatns file to store the predicted formants along with times.
nz_time_formants = open('output/vowel_formants/nz_time_formants.csv', 'a')

#Write something in the estimated formants file.
nz_time_formants.write('Filename,Vowel,Begin,End,Target,F1,F2,F3,F4\n')

for i in range(len(dl_formants1)):

	nz_time_formants.write(str(wav[i])+','+str(vowel[i])+','+str(begin[i])+','+str(end[i])+','+str(target[i])+','+str(dl_formants1[i])+','+str(dl_formants2[i])+','+str(dl_formants3[i])+','+str(dl_formants4[i])+'\n')



	
