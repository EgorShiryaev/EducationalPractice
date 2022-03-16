import math
from PIL import Image, ImageDraw
import cv2
import matplotlib.pyplot as plt


def search_square(x, y):

    if countPercentageOfSquare(x, y) >= 280:
        removeSquare(x, y)
        return 1
    return 0


def countPercentageOfSquare(x, y):
    count = 0
    for i in range(20):
        for j in range(20):
            if pix[x + i, y + j] == 0 \
                    : count = count + 1

    return count


def removeSquare(x, y):
    for i in range(20):
        for j in range(20):
            im.putpixel((x + i, y + j), 128)


image = cv2.imread("task3.jpg")
image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
gray = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)

_, binary = cv2.threshold(gray, 5, 255, cv2.THRESH_BINARY)
plt.imshow(binary, cmap="gray")
plt.show()

cv2.imwrite('ans.bmp', binary)

im = Image.open('ans.bmp')
pix = im.load()

width = int(math.sqrt(binary.size))
height = width
score = 0

for x in range(width - 19):
    for y in range(height - 19):
        if pix[x, y] == 0 or pix[x, y] == 128:
            score = score + search_square(x, y)
            pix = im.load()

im.save('ans.bmp')
print(score)
