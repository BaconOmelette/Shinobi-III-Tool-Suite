Shinobi III Tool Suite by BaconOmelette
-
www.baconomelette.com

![s3ps-image](https://github.com/user-attachments/assets/09d5dce3-e3e5-4ddb-8971-1da85afa522c)

---

This is intended to be used along with the Shinobi III Practice Rom (ips patch file included).
The practice rom enables a level select in the start menu by pressing and holding the A/B/C button and moving the dpad up/down.
It also features area skipping using B button on the player 2 controller.

---

Pos/Speed
-

Displays Joe's position in the level along with a calculation of his speed.
Speed calculation is done by comparing Joe's current position to his position on the previous frame.
Useful to show how actions effect speed.

Position Lines
-

Displays two lines drawn on the screen pointing at Joe's position along with a center pixel box.
Useful for showing positioning when inside a wall.
	
Jump Timing
-

Display an "OK" text beside Joe when a double jump is possible.
There are exceptions to this, for example: after Joe bumps a ceiling during a jump or runs off a floor.
Useful for training your inputs along with a visual of how early or late they can be performed.
	
Fast Divekick
-

Grades your fast dive kick inputs.
"Gap" is the amount of frames between releasing right and pressing down+right+attack. The smaller the number, the better the outcome for distance achieved during a fast divekick.
"Active" is the amount of frames that the divekick is active. This is useful for seeing how much time is spent in the faster 3.75 pixels per frame speed.
This is less useful when moving left and will negatively grade you for doing a fast divekick going left because it works the opposite way and the movement is only 2.75 pixels per frame.
Useful for training your inputs for how tight you can make the gap between releasing forward and divekicking.

Area Timer
-

Displays the Round (R), Scene (S) and Checkpoint (C) spent in the respective areas.
Bottom right display shows previous area's time for R/S/C.
This works best along side the "Lock Warp" tool for practicing. May not function properly with loading savestates.
Useful for figuring out optimal routings.

Current State
-

Displays Joe's action state.
Useful for when inside of walls when you wouldn't normally be able to tell what Joe is doing.

State List
-

Displays the current and previous 10 states of Joe along with a frame count of how long Joe has spent in that state.
Useful for frame data, likely best for TAS recordings.
	*Might require reloading the script if it errors on the first time selecting.
	
Camera
-

Displays the camera's position.
Useful for seeing when the game locks the camera in certain areas, such as the 3-1 brains miniboss.

Checkpoint
-

Displays boxes for where the checkpoint triggers are within levels.
Useful along side the "Position Lines" tool. Touching the box with Joe's center pixel will make the checkpoint active.

Mouse Move
-

Uses your mouse inputs to force Joe's position to the target
Ctrl+Left Click to move Joe
Ctrl+Right Click to move and lock Joe in place
Ctrl+Middle Click to unlock Joe's place (Left Click will also unlock)
Useful for warping Joe into place when practicing specific setups.
	*If you wish to change the default bindings of Ctrl+Click, in the .lua file go to "function MouseMoveScript()" and make changes within.

Hide HUD
-

Removes the HUD from being shown
Useful for seeing further up than normal.
	*To bring the HUD back, uncheck the box and then in the game, pause and unpause.
  
6 Button Mode
-

Toggles the 6 button cheat on or off
Useful for learning the kunai-less speedrun category

Lock Warp
-

Locks the Round, Scene and Checkpoint values so the practice ROM's level select will warp to that destination.
POW can be disabled (0) or enabled (1) on area load.
Useful for practicing specific areas in the game by allowing you to quickly warp where you want.
	*This WILL crash the game if you select areas that are not in the game.
