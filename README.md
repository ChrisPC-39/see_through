# see_through

A Windows app made in Flutter.
"see_through" gives you the ability to always render the app on the screen. Check the examples for more details.

## How to use

Right-click anywhere on the app to open a popup menu. You will be presented with a few options to draw on the screen (e.g: display the Rule of Thirds).

### Selecting "Rule of Thirds", "Symmetry" or "Phi" will draw default grey lines on the screen. Keep in mind the following:
  - You can enable multiple of them at once.
  - You can change their color and opacity by *holding* righ-click anywhere on the screen (will prompt you to a picker).

### Selecting "Pick image" will prompt you to "upload" a file from your computer. Keep in mind the following: 
  - Only image file extensions are supported (png, jpg, webp, GIF, etc.) are supported. If you upload a video (mp4, webm, etc.) the app will not do anything, so it's not the end of the world, but you will not be told that something went wrong.
  - After uploading the image, you can resize the window to be smaller, but you won't be able to stretch the image past it's maximum width and height.
  - You'll be able to left-click *on the image* to change its opacity.
  - You'll still be able to enable any other function (e.g: display the Rule of Thirds on top of the image). 

### Selecting "Always on top" will force draw the app on top of any other apps you are currently running (it will always be visible).
### Selecting "Close app" will exit the app.

## Keybinds (recap)

  - Right-click to open popup menu
  - *Hold* right-click to change color/opacity of the first 3 options
  - Left-click *only on the image* to change its opacity.

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

Rendering "Rule of Thirds" on top of the image:
![custom_image_3](example_assets/custom_image_3.png?raw=true "Rendering Rule of Thirds on top of the image")

Changing the opacity of the image:
![custom_image_4](example_assets/custom_image_4.png?raw=true "Changing the opacity of the image")

Changing the opacity of the image and of the "Rule of Thirds" (example 1):
![custom_image_5](example_assets/custom_image_5.png?raw=true "Changing the opacity of the image and of the Rule of Thirds (example 1)")

Changing the opacity of the image and of the "Rule of Thirds" (example 2):
![custom_image_6](example_assets/custom_image_6.png?raw=true "Changing the opacity of the image and of the Rule of Thirds (example 2)")
