
# What is this ?

This is an image recognition based data sniffer for the game Dofus. It read a large amount of data using [OCR](https://en.wikipedia.org/wiki/Optical_character_recognition) to then generate a JSON containing all the captured data.  

The algorithm is split in 2 different parts, the capture and the processing (image recognition).

# 1/2 Capture
To capture, I used AHK with the [Gdip](https://github.com/tariqporter/Gdip/blob/master/Gdip.ahk) library to be able to take screenshots. AHK also allow me to easily make a user interface and key bindings.

During this step, you will have to place a grid on the HUD to match the Auction window in-game. And then just press start. This will automatically scroll and take screenshots of the window.



### Demo
![demo capture](Demo1.gif)

# 2/2 Image processing and recognition
To obtain the text and values within the different images, I used [tesseract OCR API](https://github.com/tesseract-ocr/tesseract) with a python script to automate the recognition for all the items in the captures. 

The program then generate a `data.json` that sums up all the values.
### Demo
![demo capture](Demo2.gif)


# Restrictions
- You have to launch the AHK script using AHK 32 bits executable. (64 bits is not compatible with Gdip)
- For the OCR to work, you need to use the following HUD theme : `Xelorium`
![Theme](Theme.png)

# Requirements
- python
- auto hotkey 32bits
- tesseract
