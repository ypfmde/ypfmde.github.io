file = open('gall.html', 'w')

for zae in range(422):
#for zae in range(10):
    zs = str(zae).rjust(3, "0")
    s = f'''        <a href="Data/example_{zs}.html" class="gallery-item">
            <img src="Data/example_{zs}.png" alt="Image {zs}">
            <p>Fall {zs}</p>
        </a>'''
    file.write(s + '\n')
file.close()

