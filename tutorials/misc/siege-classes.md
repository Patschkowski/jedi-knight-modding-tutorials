# Classes in Siege

The classes in the *Siege* game mode can be defined via the \*.scl files. These files can also be created and added dynamically. All the important commands in an \*.scl file are listed and explained here.

\*.scl files are located in the folder *base/ext_data/Siege/Classes* and have this structure:

    ClassInfo
    {
        name             "Rocket Trooper"                               // must match the name in the \*.team file
        
        weapons          WP_BLASTER_PISTOL|WP_ROCKET_LAUNCHER
        
        classflags       CFL_EXTRA_AMMO|CFL_STRONGAGAINSTPHYSICAL
        
        forcepowers      FP_HEAL,3|FP_LEVITATION,1|FP_GRIP,2|FP_ABSORB,1
        
        holdables        HI_SEEKER
        
        powerups         0
        
        maxhealth        100                                            // maximum number of health points
        maxarmor         100                                            // maximum armor points
        startarmor       0                                              // armor to start the game
        model            "stormtrooper"                                 // optional command
        skin             "officer"                                      // optional command
        
        uishader         "models/players/stormtrooper/icon_officer"     // image displayed during class selection
        
        class_shader     "gfx/mp/c_icon_heavy_weapons"                  // display icon for the class
        
        speed            0.75                                           // Multiplier for normal running speed
        sabercolor       1                                              // Color of the first lightsaber
        saber2color      3                                              // Color of the second lightsaber
        saberstyle       SS_FAST|SS_MEDIUM                              // Lightsaber style; other possible values: SS_STRONG, SS_DUAL, SS_STAFF
    }
    description
    "Description of the class; is in the character menu"

Some commands already have predefined values. These are explained in more detail here. For all commands where you can enter more than one value, these must be separated by a vertical line.

`weapons`
- WP_STUN_BATON
- WP_MELEE
- WP_SABER
- WP_BRYAR_PISTOL
- WP_BLASTER
- WP_DISRUPTOR
- WP_BOWCASTER
- WP_REPEATER
- WP_DEMP2
- WP_FLECHETTE
- WP_ROCKET_LAUNCHER
- WP_THERMAL
- WP_TRIP_MINE
- WP_DET_PACK

`forcepowers`
- 0
- FP_ALL
- FP_HEAL
- FP_LEVITATION
- FP_SPEED
- FP_PUSH
- FP_PULL
- FP_TELEPATHY
- FP_GRIP
- FP_LIGHTNING
- FP_RAGE
- FP_PROTECT
- FP_ABSORB
- FP_TEAM_HEAL
- FP_TEAM_FORCE
- FP_DRAIN
- FP_SEE
- FP_SABER_OFFENSE
- FP_SABER_DEFENSE
- FP_SABERTHROW

For the powers, you must also enter the level after the ability after a comma. `FP_ALL` sets all powers for the class to level 3. If `0` (zero) is specified, the class has no powers.

`classflags`
- 0 - no bonus ability
- CFL_MORESABERDMG - higher lightsaber damage
- CFL_STRONGAGAINSTPHYSICAL - more resistance to physical damage
- CFL_FASTFORCEREGEN - faster power regeneration
- CFL_STATVIEWER - enemy life energy and ammunition can be seen
- CFL_HEAVYMELEE - increased fist fighting
- CFL_SINGLE_ROCKET - has only one rocket for the rocket launcher
- CFL_CUSTOMSKEL - uses a different skeleton
- CFL_EXTRA_AMMO - can carry double ammunition

`holdables`
- 0 - no items
- HI_SEEKER - Seeker drone
- HI_SHIELD - placeable shield
- HI_MEDPAC - Medipack with 25
- HI_MEDPAC_BIG - Medipack with 50
- HI_BINOCULARS - Binoculars
- HI_SENTRY_GUN - automatic firing system
- HI_JETPACK - Backpack with rocket engine
- HI_HEALTHDISP - Ability to distribute life energy
- HI_AMMODISP - Ability to distribute ammunition

`powerups`
- 0 - no powerup
- PW_FORCE_ENLIGHTENED_LIGHT - each bright power ability increases by one level
- PW_FORCE_ENLIGHTENED_DARK - each dark power ability increases by one level
- PW_FORCE_BOON - unlimited power
- PW_YSALAMIRI - player is protected against any Force attack, but cannot use Force themselves


