file = open('gall2.html', 'w')

for zae in range(60):
#for zae in range(10):
    zs = str(zae).rjust(2, "0")
    s = f'''<h3>Fall {zs}</h3>
    <a href="Data/teile_{zs}.html" class="gallery-item">
    <img src="Data/teile_{zs}.png" alt="Image {zs}">
    </a>
    <a href="Data/tet_{zs}.html" class="gallery-item">
    <img src="Data/tet_{zs}.png" alt="Image {zs}">
    </a><br>'''    
    file.write(s + '\n')
file.close()

