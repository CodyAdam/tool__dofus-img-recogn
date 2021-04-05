import cv2
import math
import os

LINE_COUNT = 14
XP_NAME = 0.07475
YP_NAME = 0.26667
WP_NAME = 0.36212
HP_NAME = 0.46667


def ocr_get(img):
    TEMP_FILE = "./ocr/ocr.png"
    cv2.imwrite(TEMP_FILE, img)
    config = "-c page_separator=\"\" -c tessedit_char_whitelist=\"\'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -\" -l eng"
    output = os.popen(
        f'tesseract {TEMP_FILE} stdout --dpi 140 {config}').read()
    return output.replace('\n', '')


def img_crop_p(img, W, H, xp, yp, wp, hp):
    x = math.floor(xp * W)
    y = math.floor(yp * H)
    w = math.floor(wp * W)
    h = math.floor(hp * H)
    return img_line[y:y + h, x:x + w]


img = cv2.imread("./temp/0.png")
H = img.shape[0]
W = img.shape[1]

lineW = W
lineH = H / LINE_COUNT

data = dict()

for i in range(0, LINE_COUNT):
    img_line = img[math.floor(lineH * i):math.floor(lineH * (i + 1)),
                   0:0 + lineW].copy()

    img_name = img_crop_p(img_line, lineW, lineH, XP_NAME, YP_NAME, WP_NAME,
                          HP_NAME)
    name = ocr_get(img_name)
    img_category = 0
    # cv2.imshow("img", img_name)
    # cv2.waitKey(0)
    print(name)
