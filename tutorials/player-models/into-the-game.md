# Bringing the finished model into the game

## Goal

Now we will assimilate the model here, write a \*.skin file and wrap everything in a \*.pk3 to bring it into play.

## Prerequisites

- Assimilate.exe, as configured in [the first chapter](work-environment-setup.md)
- A file archiver like [7-Zip](http://www.7-zip.org/)
- A text editor like Notepad

## Steps

1. [Create car File](#create-car-file)
2. [Assimilate](#assimilate)
3. [Create skin File](#create-skin-file)
4. [Create pk3 File](#create-pk3-file)

### Create car File

We will now write a \*.car file. This is a configuration file for carcass.exe. Write the following content in a new text file:

    $aseanimgrabinit
    $aseanimgrab_gla models/players/_humanoid/_humanoid.gla
    $aseanimgrabfinalize
    $aseanimconvertmdx_noask models/players/my_first_model/root -makeskin -smooth

Save this file under *C:\base\models\players\my_first_model* as *model.car*.

![\*.car file](car-file.png)

### Assimilate

![Assimilate confirming success](assimilate-info.png)

### Create skin File

![\*.skin file](skin-file.png)

    hips,models/players/mein_erstes_model/hips.tga
    hips_cap_l_leg_off,models/players/mein_erstes_model/caps.tga
    hips_cap_r_leg_off,models/players/mein_erstes_model/caps.tga
    hips_cap_torso_off,models/players/mein_erstes_model/caps.tga
    l_leg,models/players/mein_erstes_model/legs_hands.tga
    l_leg_cap_hips_off,models/players/mein_erstes_model/caps.tga
    r_leg,models/players/mein_erstes_model/legs_hands.tga
    r_leg_cap_hips_off,models/players/mein_erstes_model/caps.tga
    torso,models/players/mein_erstes_model/torso.tga
    torso_cap_head_off,models/players/mein_erstes_model/caps.tga
    torso_cap_hips_off,models/players/mein_erstes_model/caps.tga
    torso_cap_l_arm_off,models/players/mein_erstes_model/caps.tga
    torso_cap_r_arm_off,models/players/mein_erstes_model/caps.tga
    torso_cap_l_arm_off,models/players/mein_erstes_model/caps.tga
    head,models/players/mein_erstes_model/head.tga
    head_cap_torso_off,models/players/mein_erstes_model/caps.tga
    l_arm,models/players/mein_erstes_model/arms.tga
    l_arm_cap_l_hand_off,models/players/mein_erstes_model/caps.tga
    l_arm_cap_torso_off,models/players/mein_erstes_model/caps.tga
    r_arm,models/players/mein_erstes_model/arms.tga
    r_arm_cap_r_hand_off,models/players/mein_erstes_model/caps.tga
    r_arm_cap_torso_off,models/players/mein_erstes_model/caps.tga
    l_hand,models/players/mein_erstes_model/legs_hands.tga
    land_cap_l_arm_off,models/players/mein_erstes_model/caps.tga
    r_hand,models/players/mein_erstes_model/legs_hands.tga
    r_hand_cap_r_arm_off,models/players/mein_erstes_model/caps.tga

### Create pk3 File

![Final pk3 file](final-pk3.png)

![In-game screenshot of the player model](in-the-game.jpg)

