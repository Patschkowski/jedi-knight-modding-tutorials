# What Are Shaders Anyway?

## What Do or Can Shaders Do?

Shaders are small programs that change the properties of a texture. You can do the following things with a shader, for example.

- One can change the color of a texture
- One an define the physical attributes like water and lava
- One can define animate textures
- One can add glow effects
- One can blend textures

## How Shaders Are Structured

Shaders do not follow a standardized structure and syntax. Each graphics engine handles them differently. For this reason, I will only discuss shaders for the Quake 3 engine here.

    textures/my_shader/wall
    {
	    qer_editorimage textures/my_texture/wall
	    {
		    map textures/my_texture/wall
	    }
    }

This is the simplest shader you can write. Its effect is just as simple, because it doesn't actually do anything.

Let's take a look at the shader in detail. Each shader begins with a name and an open, curved bracket. It ends with a closed, curved bracket. The name for the shader can be assigned by the user. The actual shader commands (instructions) are inside the curved brackets.

    textures/my_shader/wall
    {
    }

A shader is divided into different sections. There is a global section and any number of individual sections, known as stages. The global commands are located directly after the open bracket of the shader. Each command is on a new line.

    textures/my_shader/wall
    {
	    // A global command
	    qer_editorimage textures/my_texture/wall
    }

Each stage is surrounded by curved brackets. It is not recommended to use more than 8 stages because each additional stage costs computing power.

    textures/my_shader/wall
    {
	    // Beginning of a stage
	    {
         	// stage command
		    map textures/my_texture/wal
	    }
	    //End of the stage
    }

Comments in a shader are marked as in C++.

    // single line comment
    /*
    multi line
    comment
    */