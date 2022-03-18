# see_through

A Windows(?) app made in Flutter.
"see_through" gives you the ability to always render the app on the screen. Check the examples for more details.

The app should theoretically work for Windows, Linux and MacOS, however I am unable to build it for MacOS (because I don't own a Macbook) and I can't test it for Linux because I am too lazy to set it up. Oopsie!

## How to use

Right-click anywhere on the app to open a popup menu. You will be presented with a few options to draw on the screen (e.g: display the Rule of Thirds).

### Selecting "Rule of Thirds", "Symmetry" or "Phi" will draw default grey lines on the screen. Keep in mind the following:
  - You can enable multiple of them at once.
  - You can change their color and opacity by *holding* righ-click anywhere on the screen (will prompt you to a picker).

### Selecting "Pick file" will prompt you to "upload" a file from your computer. Keep in mind the following: 
  - You may upload any image or video file (jpg, png, webp, GIF, mp4, webm, etc). 
  - Uploading a file may take some time, depending on its size! The app may appear frozen, but please be patient for a few seconds! 
  - After uploading the file, you can resize the window to be smaller, but you won't be able to stretch the image/video past it's maximum width and height.
  - You'll be able to *hold* left-click *on the image/video* to change its opacity.
  - You'll still be able to enable any other function (e.g: display the Rule of Thirds on top of the file). 

### Selecting "Web view" will open a browser tab in the app. Keep in mind the following:
  - The text field at the top accepts ONLY URLs. Don't try to search for something there, use the Google search bar for that
  - Underneath the text field you will be presented with a slider. Drag to adjust opacity.
  - You'll be able to *hold* left-click to make the text field and the slider dissapear. 
  - You'll still be able to enable any other function (e.g: display the Rule of Thirds on top of the web page). 

### Selecting "Always on top" will force draw the app on top of any other apps you are currently running (it will always be visible).
### Selecting "Close app" will exit the app.

## Keybinds (recap)

  - Right-click to open popup menu
  - *Hold* right-click to change color/opacity of the first 3 options
  - *Hold* left-click on the image/video or web page to change its opacity.

## Download link

Link to [Releases](https://github.com/ChrisPC-39/see_through/releases)

## Examples

When starting the app, this is how the window will look like:
![Starting screen](example_assets/starting_screen.png?raw=true "When starting the app, this is how the window will look like")

When pressing right-click, this popup menu pops up near your cursor:
![Popup menu](example_assets/main_menu.png?raw=true "When pressing right-click, this popup menu pops up near your cursor")

Enabling "Rule of Thirds":
![Rule of Thirds](example_assets/rule_of_thirds.png?raw=true "Enabling Rule of Thirds")

Enabling "Symmetry":
![Symmetry](example_assets/symmetry.png?raw=true "Enabling Symmetry")

Enabling "Phi":
![Phi](example_assets/phi.png?raw=true "Enabling Phi")

Picking an image:
![custom_image_1](example_assets/custom_image_1.png?raw=true "Picking an image")

Resizing the image:
![custom_image_2](example_assets/custom_image_2.png?raw=true "Resizing the image")

Opening a web page:
![web_view_1]((example_assets/web_view_1.png?raw=true "Opening a web page")

Rendering "Rule of Thirds" on top of the image:
![custom_image_3](example_assets/custom_image_3.png?raw=true "Rendering Rule of Thirds on top of the image")

Changing the opacity of the image:
![custom_image_4](example_assets/custom_image_4.png?raw=true "Changing the opacity of the image")

Changing the opacity of the image and of the "Rule of Thirds" (example 1):
![custom_image_5](example_assets/custom_image_5.png?raw=true "Changing the opacity of the image and of the Rule of Thirds (example 1)")

Changing the opacity of the image and of the "Rule of Thirds" (example 2):
![custom_image_6](example_assets/custom_image_6.png?raw=true "Changing the opacity of the image and of the Rule of Thirds (example 2)")
