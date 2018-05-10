import os
nb = 5 if (__file__ != "Sully.py") else 6
if nb == 0: exit()
s = 'import os\nnb = %d if (__file__ != "Sully.py") else %d\nif nb == 0: exit()\ns = %r\nwith open("Sully_%%d.py" %% (nb - 1), "w") as fd: fd.write(s %% (nb - 1, nb, s)); fd.close(); os.system("python Sully_%%d.py" %% (nb - 1)) if nb > 0 else None'
with open("Sully_%d.py" % (nb - 1), "w") as fd: fd.write(s % (nb - 1, nb, s)); fd.close(); os.system("python Sully_%d.py" % (nb - 1)) if nb > 0 else None