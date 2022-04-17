# -*- coding: utf-8 -*-
import os , sys , csv, yaml

if len(sys.argv) > 3:
    # Loading GloVe Vocabulary Count File:
    wordCountDict = {}
    with open(sys.argv[1], 'r') as file:
        for line in file:
            token = line.split()
            wordCountDict[token[0]] = token[1]

    # Loading Old Profession Set Yaml File:
    oldProfessionSet = []
    with open(sys.argv[2], "r") as stream:
        try:
            oldProfessionSetDict = yaml.safe_load(stream)
        except yaml.YAMLError as exception:
            print(exception)

    # Loading Modern Profession Set Yaml File:
    modernProfessionSet = []
    with open(sys.argv[3], "r") as stream:
        try:
            modernProfessionSetDict = yaml.safe_load(stream)
        except yaml.YAMLError as exception:
            print(exception)

    # Defining Defining Set:
    DefiningSet = ['امرأة' , 'رجل' , 'ابنة' , 'ولد' , 'أم' , 'أب' , 'فتاة' , 'فتى' , 'ملكة' , 'ملك' , 'زوجة' , 'زوج' , 'سيدة' , 'سيد']
    DefiningSetDict = {'woman': 'امرأة', 'man': 'رجل', 'daughter':'ابنة', 'son':'ولد', 'mother':'أم', 'father':'أب', 'girl':'فتاة',
                       'boy':'فتى', 'queen':'ملكة', 'king':'ملك', 'wife':'زوجة', 'husband':'زوج', 'madam':'سيدة', 'sir':'سيد'}

else:
    print("     ⚠ Error: No Files/Arguments Have Been Specified!!  You Need 3 Files!!  The  Correct  Usage: ")
    print("      >> python countAPCD.py <vocab_count_file> <old_profession_yaml> <modern_profession_yaml>")
    exit()


# Helper Functions:
def GetValue(k):
    for key, value in wordCountDict.items():
        if k == key: return value
    return 0

def GetKeyDS(v):
    for key, value in DefiningSetDict.items():
        if v == value: return key
    return "Key doesn't exist!"

def GetAllDictKeysOPS(v):
    for key, value in oldProfessionSetDict.items():
        if isinstance(value, dict):
            for key, value in value.items():
                if v == value: return key
            return "Key doesn't exist!"

def GetAllDictValuesOPS():
    global oldProfessionSet
    for key, value in oldProfessionSetDict.items():
        if isinstance(value, dict):
            for k, v in value.items():
                oldProfessionSet=list(value.values())

def GetAllDictKeysMPS(v):
    for key, value in modernProfessionSetDict.items():
        if isinstance(value, dict):
            for key, value in value.items():
                if v == value: return key
            return "Key doesn't exist!"

def GetAllDictValuesMPS():
    global modernProfessionSet
    for key, value in modernProfessionSetDict.items():
        if isinstance(value, dict):
            for k, v in value.items():
                modernProfessionSet=list(value.values())


# Exporting Counts of Defining Set Words To CSV File:
basename = [f'{os.path.basename(sys.argv[1])}']
filename = basename[0].split('_')
filename = str('count_'+filename[1])
header = ['Ara/Eng Word', 'Word Count', 'Vocab Size', 'Word Frequency']
with open(f'{filename}_DS.csv', 'w', encoding='UTF8') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    for word in DefiningSet:
        wordFrequency = (int(GetValue(word))/int(len(wordCountDict)))
        data = [f'{word}/{GetKeyDS(word)}', f'{GetValue(word)}', f'{len(wordCountDict)}', f'{round(wordFrequency, 5)}']
        writer.writerow(data)
    print(f'      >> File `{filename}_DS.csv` has been written.')

# Exporting Counts Of Old Profession Set Words To CSV File:
basename = [f'{os.path.basename(sys.argv[1])}']
filename = basename[0].split('_')
filename = str('count_'+filename[1])
header = ['Ara/Eng Word', 'Word Count', 'Vocab Size', 'Word Frequency']
with open(f'{filename}_{sys.argv[2][:3]}.csv', 'w', encoding='UTF8') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    GetAllDictValuesOPS()
    for word in oldProfessionSet:
        wordFrequency = (int(GetValue(word))/int(len(wordCountDict)))
        data = [f'{word}/{GetAllDictKeysOPS(word)}', f'{GetValue(word)}', f'{len(wordCountDict)}', f'{round(wordFrequency, 5)}']
        writer.writerow(data)
    print(f'      >> File `{filename}_{sys.argv[2][:3]}.csv` has been written.')

# Exporting Counts Of Modern Profession Set Words To CSV File:
basename = [f'{os.path.basename(sys.argv[1])}']
filename = basename[0].split('_')
filename = str('count_'+filename[1])
header = ['Ara/Eng Word', 'Word Count', 'Vocab Size', 'Word Frequency']
with open(f'{filename}_{sys.argv[3][:3]}.csv', 'w', encoding='UTF8') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    GetAllDictValuesMPS()
    for word in modernProfessionSet:
        wordFrequency = (int(GetValue(word))/int(len(wordCountDict)))
        data = [f'{word}/{GetAllDictKeysMPS(word)}', f'{GetValue(word)}', f'{len(wordCountDict)}', f'{round(wordFrequency, 5)}']
        writer.writerow(data)
    print(f'      >> File `{filename}_{sys.argv[3][:3]}.csv` has been written.')
