from gallery_template import template

for name in ['schwarz', 'grau', 'grau_kanten', 'bunt']:
    file = open(name + '.html', 'w')
    L = []
    for zae in range(396):
        zs = str(zae).rjust(3, "0")
        s = f'''        <a href="Data/{name}_{zs}.html" class="gallery-item">
                <img src="Data/{name}_{zs}.png" loading="lazy" alt="Image {zs}">
                <p>Fall {zs}</p>
            </a>'''
        L.append(s)
    st = '\n'.join(L)
    t = template.replace('xxx', st)
    file.write(t)
    file.close()

