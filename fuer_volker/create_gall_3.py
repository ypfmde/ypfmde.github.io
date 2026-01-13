file = open('gall3.html', 'w')

for zae in range(396):
#for zae in range(10):
    zs = str(zae).rjust(3, "0")
    s = f'''        <a href="Data/fall_58_{zs}.html" class="gallery-item">
            <img src="Data/fall_58_{zs}.png" loading="lazy" alt="Image {zs}">
            <p>Fall {zs}</p>
        </a>'''
    file.write(s + '\n')
file.close()

