import qrcode
import qrcode.image.svg

data = """https://github.com/zhtluo/purdue-slide-template"""

factory = qrcode.image.svg.SvgPathImage
img = qrcode.make(data, image_factory=factory)

img.save('qrcode.svg')