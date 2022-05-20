with open('tmp/tmp_metrics.log') as f:
    lines = f.readlines()
    print(lines)
span = 2
words = lines[1].split(' |')
z=[]
z.append(lines[0])
listt=z+[" | ".join(words[i:i+span]) for i in range(0, len(words), span)]
textfile = open("tmp/metrics.log", "w")
for element in listt:
    textfile.write(element + "\n")
textfile.close()