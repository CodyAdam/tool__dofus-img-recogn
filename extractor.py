import cv2
import math
import os
import json
import time

LINE_COUNT = 14
NAME_POS = [0.07475, 0.26667, 0.36212, 0.46667]
CATEGORY_POS = [0.4485, 0.28260, 0.21926, 0.47826]


def ocr_get(filename, img):
    TEMP_FILE = f"./temp/ocr/{filename}.png"
    cv2.imwrite(TEMP_FILE, img)
    config = "--psm 7 --dpi 140 -c page_separator=\"\" -c tessedit_char_whitelist=\"\'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz -\" -l eng"
    output = os.popen(f'tesseract {TEMP_FILE} stdout  {config}').read()
    return output.replace('\n', '')


def img_crop_p(img, W, H, pos):
    x = math.floor(pos[0] * W)
    y = math.floor(pos[1] * H)
    w = math.floor(pos[2] * W)
    h = math.floor(pos[3] * H)
    return img_line[y:y + h, x:x + w]


# TODO clear capture folders first before looping
img = cv2.imread("./temp/captures/0.png")

H = img.shape[0]
W = img.shape[1]
lineW = W
lineH = H / LINE_COUNT

data = dict()

start = time.time()
for i in range(0, LINE_COUNT):
    item = dict()
    img_line = img[math.floor(lineH * i):math.floor(lineH * (i + 1)),
                   0:0 + lineW].copy()
    cv2.imwrite("./temp/ocr/ref.png", img_line)

    img_name = img_crop_p(img_line, lineW, lineH, NAME_POS)
    item["name"] = ocr_get("name", img_name)
    img_category = img_crop_p(img_line, lineW, lineH, CATEGORY_POS)
    item["category"] = ocr_get("category", img_category)
    # cv2.imshow("img", img_name)
    # cv2.waitKey(0)
    # print(item["name"] + "  " + item["category"])
    data[item["name"]] = item
print(str(time.time() - start))

with open('data.json', 'w') as outfile:
    json.dump(data, outfile, indent=4)
