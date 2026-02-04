template = '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Galerie</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .gallery-item {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s;
            cursor: pointer;
        }
        .gallery-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        .gallery-item img {
	    width: 100%;
	    aspect-ratio: 1 / 1;
	    object-fit: cover;
}
.gallery-item p {
            padding: 15px;
            margin: 0;
            text-align: center;
            font-weight: bold;
            color: #555;
        }
    </style>
</head>
<body>
  <h1>Galerie aller 396 Formen mit diesen Teilen:</h1>
  <img src="Data/teile.png" loading="lazy" alt="Image doof" style="display: block; margin: 0 auto; width: 100%; max-width: 100%;">
  <h2>Anklicken eines Bildes liefert 3D-Animation</h2>
    <h3>Rotation:</h3>
    <ul>
        <li><em>Desktop:</em> linke Maustaste gedrückt halten und ziehen</li>
        <li><em>Smartphone / Touchscreen:</em> mit einem Finger wischen</li>
    </ul>

    <h3>Vergrößern / Verkleinern (Zoom):</h3>
    <ul>
        <li><em>Desktop:</em> Mausrad drehen oder gedrückt ziehen (stufenlos)</li>
        <li><em>Smartphone / Touchscreen:</em> mit zwei Fingern auseinander bzw. zueinander ziehen</li>
    </ul>
    <div class="gallery">
xxx
    </div>
</body>
</html>
'''
