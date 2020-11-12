import os
import shutil

if os.path.join(os.getenv("HOME"),"public_html") != os.getcwd():
    print("Sie befinden sich im falschen Verzeichnis!")
    exit()

try:
    os.mkdir("./Sicherung")
except OSError:
    pass

for path, dummy, names in os.walk("."):
    if path.count("Sicherung") > 0:
        continue
    for name in [z for z in names if z.endswith((".html",".htm"))]:
        if name.count("impressum") > 0:
            continue
        file = os.path.join(path, name)
        fr = open(file,"r")
        try:
            txt = fr.read()
            anker = ("</body>","</BODY>","</Body>")
            if sum(txt.count(z) for z in anker) != 1:
                print("Falsche Anzahl von </body>:", file)
            if txt.count("impressum.html") > 0:
                continue
            sicfile = os.path.join("./Sicherung", file)
            os.makedirs(os.path.join("./Sicherung", path), exist_ok=True)
            shutil.copy(file, sicfile)
            fr.close()
            repl = '<HR>\n<p>\n<a href="'
            repl += "../"*(file.count("/")-1)
            repl += 'impressum.html">Impressum + Datenschutz</a></p>\n'
            repl += '</body>'
            for body in anker:
                txt = txt.replace(body, repl)
            fw = open(file,"w")
            fw.write(txt)
            fw.close()
        except UnicodeDecodeError:
            print("Geht schief wegen falscher Zeichencodierung:",file)

