------------------------------------------------------------------------------------
--  "XSI Export" enables *.xsi file format export in Gmax 1.2                     --
--  Copyright (C) 2007 Felix Patschkowski                                         --
--                                                                                --
--  This program is free software; you can redistribute it and/or modify          --
--  it under the terms of the GNU General Public License as published by          --
--  the Free Software Foundation; either version 2 of the License, or             --
--  (at your option) any later version.                                           --
--                                                                                --
--  This program is distributed in the hope that it will be useful,               --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of                --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                 --
--  GNU General Public License for more details.                                  --
--                                                                                --
--  You should have received a copy of the GNU General Public License along       --
--  with this program; if not, write to the Free Software Foundation, Inc.,       --
--  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.                   --
------------------------------------------------------------------------------------
-- Contact                                                                        --
--  felix.patschkowski@googlemail.com                                             --
------------------------------------------------------------------------------------
-- Version history                                                                --
--  0.0.1 | 2007/03/02 | first public release                                     --
--  0.0.2 | 2007/03/18 | bugfixed envelope export                                 --
--  0.0.3 | 2007/04/03 | better normal export; dublicates are deleted             --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- Globals                                                                        --
global baseposeTransformsStatus      = false
global SRTTransformsStatus           = false
global generateShaderNamesPSetStatus = false
global pointWeightsStatus            = true
global bonesStatus                   = true
global meshsStatus                   = true
global animationsStatus              = false
global lightsStatus                  = false
global IKChainsStatus                = false
global bonesAsNullsStatus            = false
global flattenHierarchyStatus        = false
global AnimationSubRangeStatus       = false
global RescaleStatus                 = false
global useLocalFileNamesStatus       = true
global stripOutPathBeforeValue       = "\\base\\"
-- Globals                                                                        --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
-- Functions                                                                      --
fn removeSpacesfromString stringValue =
(
	cutAtSpaces = filterString stringValue " "
	nbStringElements = cutAtSpaces.count
	newString = ""
	for t in 1 to nbStringElements do
	(
		newString += "_" + cutAtSpaces[t]
	)
	clearedString = subString newString 2 newString.count
	return clearedString
)
------------------------------------------------------------------------------------
fn generateCustomPSet sceneObject tabs =
(
	ObjectMaterialTexture = sceneObject.material.maps[2].bitmap.filename
	filePath     = trimLeft (rolloutXSIExport.stripOutPathBefore.text as String)
	nbCharacters = filePath.count
	shaderPath   = replace ObjectMaterialTexture 1 nbCharacters ""

	format "%\tXSI_CustomPSet Game {\n"        tabs
	format "%\t\t\"NODE\",\n"                  tabs
	format "%\t\t1,\n"                         tabs
	format "%\t\t\"Shader\",\"Text\",\"%\",\n" tabs shaderPath
	format "%\t}\n\n"                          tabs
)
------------------------------------------------------------------------------------
fn exportTransforms activeObject tabs =
(
	if( SRTTransformsStatus == true ) then
		(
			format "%\tSI_Transform SRT-% {\n" tabs activeObject.name
			format "%\t\t%,\n"  tabs activeObject.transform.scale.x
			format "%\t\t%,\n"  tabs activeObject.transform.scale.z
			format "%\t\t%,\n"  tabs activeObject.transform.scale.y
			format "%\t\t%,\n"  tabs activeObject.transform.rotation.x
			format "%\t\t%,\n"  tabs activeObject.transform.rotation.z
			format "%\t\t%,\n"  tabs activeObject.transform.rotation.y
			format "%\t\t%,\n"  tabs activeObject.transform.translation.x
			format "%\t\t%,\n"  tabs activeObject.transform.translation.z
			format "%\t\t%,\n"  tabs activeObject.transform.translation.y
			format "%\t}\n\n"   tabs
		)
		if( baseposeTransformsStatus == true ) then
		(
			format "%\tSI_Transform BASEPOSE-% {\n" tabs activeObject.name
			format "%\t\t%,\n"  tabs activeObject.transform.scale.x
			format "%\t\t%,\n"  tabs activeObject.transform.scale.z
			format "%\t\t%,\n"  tabs activeObject.transform.scale.y
			format "%\t\t%,\n"  tabs activeObject.transform.rotation.x
			format "%\t\t%,\n"  tabs activeObject.transform.rotation.z
			format "%\t\t%,\n"  tabs activeObject.transform.rotation.y
			format "%\t\t%,\n"  tabs activeObject.transform.translation.x
			format "%\t\t%,\n"  tabs activeObject.transform.translation.z
			format "%\t\t%,\n"  tabs activeObject.transform.translation.y
			format "%\t}\n\n"   tabs
		)
)
------------------------------------------------------------------------------------
fn exportHelper activeObject tabs =
(
	if( (classOf activeObject == Dummy) or (classOf activeObject == BoneGeometry) ) then
	(
		nullName = activeObject.name
		case activeObject.visibility of
		(
			true:  visibility = 1
			false: visibility = 0
		)		
		format "\n"
		format "%SI_Model MDL-% {\n" tabs nullName
		
		exportTransforms activeObject tabs
		
		format "%\tSI_Visibility {\n" tabs
		format "%\t\t%,\n"            tabs visibility
		format "%\t}\n"               tabs
		format "%\tSI_Null % {\n"     tabs nullName
		format "%\t}\n"               tabs
		
		nbChildren = activeObject.children.count
		if( nbChildren > 0 ) then
		(
			format "\n"
			tabs += "\t"
			for t in 1 to nbChildren do
			(
				getObjectClass activeObject.children[t] tabs
			)
		)
		
		format "%}\n\n"               tabs
	)
)
------------------------------------------------------------------------------------
fn exportGeometry activeObject tabs =
(	
	addModifier	activeObject (Turn_To_Mesh())
			
	activeObjectName = (removeSpacesfromString activeObject.name)
	nbVerts    = activeObject.mesh.numverts
	nbFaces    = activeObject.mesh.numFaces
	nbTVerts   = activeObject.mesh.numtverts
	nbCPVVerts = activeObject.mesh.numcpvverts
	nbChildren = activeObject.children.count
	objectMtl  = activeObject.material
	if( objectMtl != undefined ) then
	(
		objectMtlName = (removeSpacesfromString objectMtl.name)
	) else (
		objectMtlName = ""
	)
	elements  = "NORMAL"
	nbShapeArrays = 2
	if( nbCPVVerts > 0 ) then
	(
		nbShapeArrays += 1
		elements += "|COLOR"
	)
	if( nbTVerts > 0 ) then
	(
		nbShapeArrays += 1
		elements += "|TEX_COORD_UV"
	)
	case activeObject.visibility of
	(
		true:  visibility = 1
		false: visibility = 0
	)
	/*--*/
	vertexNormal = #()
	for i in 1 to nbVerts do ( append vertexNormal (getNormal activeObject.mesh i) )
	faceVertexNormalIndex = #()
	for i in 1 to nbFaces do ( append faceVertexNormalIndex (getFace activeObject.mesh i) )	
	redundantIndices = #()
	for i in 1 to vertexNormal.count do
	(
		if( vertexNormal[i] == undefined ) do ( continue )
		for j in 1 to vertexNormal.count do
		(
			if( i == j) do ( continue )
			if( vertexNormal[i] == vertexNormal[j] ) then
			(
				vertexNormal[j] = undefined
				append redundantIndices [j,i]
			)
		)
	)
	for i in redundantIndices do
	(
		for j in faceVertexNormalIndex do
		(
			if(j.x == i.x) do ( j.x = i.y )
			if(j.y == i.x) do ( j.y = i.y )
			if(j.z == i.x) do ( j.z = i.y )
		)
	)
	for i in 1 to vertexNormal.count do
	(
		if(vertexNormal[i] == undefined) then
		(
			for j in faceVertexNormalIndex do
			(
				if(j.x > i) do ( j.x -= 1)
				if(j.y > i) do ( j.y -= 1)
				if(j.z > i) do ( j.z -= 1)
			)
		)
	)
	vertexNormal = for i in vertexNormal where (i != undefined) collect i
	/*--*/
	format "\n"	
	format "%SI_Model MDL-% {\n" tabs activeObjectName
	--if( superClassOf activeObject == GeometryClass ) then
	--(				
		if( objectMtl != undefined ) then
		(			
			format "%\tSI_GlobalMateterial {\n" tabs
			format "%\t\t\"%\",\n" 				tabs objectMtlName
			format "%\t\t\"BRANCH\",\n" 		tabs
			format "%\t}\n\n" 					tabs
		)
		
		exportTransforms activeObject tabs

		format "%\tSI_Visibility {\n"        tabs
		format "%\t\t%,\n" 			         tabs visibility
		format "%\t}\n\n"			         tabs
		if( (generateShaderNamesPSetStatus == true) and (objectMtl != undefined) ) then
		(
			generateCustomPSet activeObject tabs
		)
		format "%\tSI_Mesh MSH-% {\n" 		 tabs activeObjectName				
		format "%\t\tSI_Shape SHP-%-ORG {\n" tabs activeObjectName
		format "%\t\t\t%,\n"                 tabs nbShapeArrays
		format "%\t\t\t\"ORDERED\",\n"       tabs
		format "\n"
		format "%\t\t\t%,\n"                 tabs nbVerts
		format "%\t\t\t\"POSITION\",\n"      tabs
		for k in 1 to nbVerts do
		(
			vertexPositionX = activeObject.verts[k].pos.x
			vertexPositionY = activeObject.verts[k].pos.y
			vertexPositionZ = activeObject.verts[k].pos.z
			format "%\t\t\t%,%,%,\n" tabs vertexPositionX vertexPositionY vertexPositionZ
		)
		format "\n"
		format "%\t\t\t%,\n"               tabs vertexNormal.count --nbVerts
		format "%\t\t\t\"NORMAL\",\n"      tabs
		/*--*/
		for k in 1 to vertexNormal.count do
		(
			vertexNormalX = vertexNormal[k].x
			vertexNormalY = vertexNormal[k].y
			vertexNormalZ = vertexNormal[k].z
			format "%\t\t\t%,%,%,\n" tabs vertexNormalX vertexNormalY vertexNormalZ
		)
		/*--*/
		/*for k in 1 to nbVerts do
		(
			vertexNormalX = (getNormal activeObject.mesh k).x
			vertexNormalY = (getNormal activeObject.mesh k).z
			vertexNormalZ = (getNormal activeObject.mesh k).y
			format "%\t\t\t%,%,%,\n" tabs vertexNormalX vertexNormalY vertexNormalZ
		)*/
		if( nbCPVVerts > 0 ) then
		(
			format "\n"
			format "%\t\t\t%,\n"         tabs nbCPVVerts
			format "%\t\t\t\"COLOR\",\n" tabs
			for k in 1 to nbCPVVerts do
			(
				r = ((getVertColor activeObject.mesh k).r / 255)
				g = ((getVertColor activeObject.mesh k).g / 255)
				b = ((getVertColor activeObject.mesh k).b / 255)
				w = ((getVertColor activeObject.mesh k).a / 255)
				format "%\t\t\t%,%,%,%,\n" tabs r g b w
			)
		)
		if( nbTVerts > 0 ) then
		(				
			format "\n"
			format "%\t\t\t%,\n"                tabs nbTVerts
			format "%\t\t\t\"TEX_COORD_UV\",\n" tabs
			for k in 1 to nbTVerts do
			(
				vertexCoordinateU = (getTVert activeObject.mesh k).x
				vertexCoordinateV = (getTVert activeObject.mesh k).z
				format "%\t\t\t%,%,\n" tabs vertexCoordinateU vertexCoordinateV
			)
		)		
		format "%\t\t}\n\n" tabs
		(
			format "%\t\tSI_TriangleList {\n" tabs
			format "%\t\t\t%,\n"              tabs nbFaces
			format "%\t\t\t\"%\",\n"          tabs elements
			format "%\t\t\t\"%\",\n"          tabs objectMtlName
			format "\n"
			for k in 1 to nbFaces do
			(
				faceVertexPositionIndexA = ((getFace activeObject.mesh k)[1] as Integer)-1
				faceVertexPositionIndexB = ((getFace activeObject.mesh k)[2] as Integer)-1
				faceVertexPositionIndexC = ((getFace activeObject.mesh k)[3] as Integer)-1
				format "%\t\t\t%,%,%,\n" tabs faceVertexPositionIndexA faceVertexPositionIndexB faceVertexPositionIndexC
			)
			format "\n"
			/*--*/
			for h in 1 to faceVertexNormalIndex.count do
			(
				faceVertexNormalIndexA = (faceVertexNormalIndex[h][1] as Integer)-1
				faceVertexNormalIndexB = (faceVertexNormalIndex[h][2] as Integer)-1
				faceVertexNormalIndexC = (faceVertexNormalIndex[h][3] as Integer)-1
				format "%\t\t\t%,%,%,\n" tabs faceVertexNormalIndexA faceVertexNormalIndexB faceVertexNormalIndexC
			)
			/*--*/
			/*for h in 1 to nbFaces do
			(
				faceVertexNormalIndexA = ((getFace activeObject.mesh h)[1] as Integer)-1
				faceVertexNormalIndexB = ((getFace activeObject.mesh h)[2] as Integer)-1
				faceVertexNormalIndexC = ((getFace activeObject.mesh h)[3] as Integer)-1
				format "%\t\t\t%,%,%,\n" tabs faceVertexNormalIndexA faceVertexNormalIndexB faceVertexNormalIndexC
			)*/
			if( nbCPVVerts > 0 ) then
			(
				format "\n"
				for q in 1 to nbFaces do
				(
					vcFaceVertexIndexA = ((getVCFace activeObject.mesh q)[1] as Integer)-1
					vcFaceVertexIndexB = ((getVCFace activeObject.mesh q)[2] as Integer)-1
					vcFaceVertexIndexC = ((getVCFace activeObject.mesh q)[3] as Integer)-1
					format "%\t\t\t%,%,%,\n" tabs vcFaceVertexIndexA vcFaceVertexIndexB vcFaceVertexIndexC
				)
			)
			if( nbTVerts > 0 ) then
			(
				format "\n"
				for j in 1 to nbFaces do
				(
					tFaceVertexUVIndexA = ((getTVFace activeObject.mesh j)[1] as Integer)-1
					tFaceVertexUVIndexB = ((getTVFace activeObject.mesh j)[2] as Integer)-1
					tFaceVertexUVIndexC = ((getTVFace activeObject.mesh j)[3] as Integer)-1
					format "%\t\t\t%,%,%,\n" tabs tFaceVertexUVIndexA tFaceVertexUVIndexB tFaceVertexUVIndexC
				)
			)
			format "%\t\t}\n" tabs
		)				
		format "%\t}\n" tabs
	--)
	
	if( nbChildren > 0 ) then
	(
		format "\n"
		tabs += "\t"
		for t in 1 to nbChildren do
		(
			getObjectClass activeObject.children[t] tabs
		)
	)
	format "%}\n" tabs
	
	deleteModifier activeObject 1
)
------------------------------------------------------------------------------------
fn exportMaterials =
(
	nbMaterials = sceneMaterials.count

	format "SI_MaterialLibrary MATLIB-% {\n" gmaxFileName
	format "\t%,\n" nbMaterials
	------------------------------------------------------------------------------------
	-- SI_Material                                                                    --
	for i in 1 to nbMaterials do
	(
		faceColorR     = (sceneMaterials[i].diffuse.red   / 255)
		faceColorG     = (sceneMaterials[i].diffuse.green / 255)
		faceColorB     = (sceneMaterials[i].diffuse.blue  / 255)
		faceColorA     = (sceneMaterials[i].diffuse.alpha / 255)
		power          =  sceneMaterials[i].specularLevel
		specularColorR = (sceneMaterials[i].specular.blue  / 255)
		specularColorG = (sceneMaterials[i].specular.green / 255)
		specularColorB = (sceneMaterials[i].specular.blue  / 255)
		MaterialName   = (removeSpacesFromString sceneMaterials[i].name)
		if( sceneMaterials[i].useselfIllumColor == true ) then
		(
			emissiveColorR = (sceneMaterials[i].selfIllumColor.red   / 255)
			emissiveColorG = (sceneMaterials[i].selfIllumColor.green / 255)
			emissiveColorB = (sceneMaterials[i].selfIllumColor.blue  / 255)
		) else (
			emissiveColorR = (sceneMaterials[i].diffuse.red   / 255)
			emissiveColorG = (sceneMaterials[i].diffuse.green / 255)
			emissiveColorB = (sceneMaterials[i].diffuse.blue  / 255)
		)
		case sceneMaterials[i].shaderByName of
		(
			"Blinn": shadingModel = 3
			"Metal": shadingModel = 1
			"Phong": shadingModel = 2
			default: shadingModel = 1
		)
		ambientColorR  = (sceneMaterials[i].ambient.red   / 255)
		ambientColorG  = (sceneMaterials[i].ambient.green / 255)
		ambientColorB  = (sceneMaterials[i].ambient.blue  / 255)
	
		format "\tSI_Material % {\n" MaterialName
		format "\t\t%,\n" faceColorR
		format "\t\t%,\n" faceColorG
		format "\t\t%,\n" faceColorB
		format "\t\t%,\n" faceColorA
		format "\t\t%,\n" power
		format "\t\t%,\n" specularColorR
		format "\t\t%,\n" specularColorG
		format "\t\t%,\n" specularColorB
		format "\t\t%,\n" emissiveColorR
		format "\t\t%,\n" emissiveColorG
		format "\t\t%,\n" emissiveColorB
		format "\t\t%,\n" shadingModel
		format "\t\t%,\n" ambientColorR
		format "\t\t%,\n" ambientColorG
		format "\t\t%,\n" ambientColorB
		if( sceneMaterials[i].maps[2] != undefined ) then
		(
			------------------------------------------------------------------------------------
			-- SI_Texture2D                                                                   --
			imageName   = fileNameFromPath sceneMaterials[i].maps[2].fileName
			mappingType = 4 		
			width       = sceneMaterials[i].maps[2].bitmap.width
			height      = sceneMaterials[i].maps[2].bitmap.height
			cropUMin    = 0
			cropUMax    = (sceneMaterials[i].maps[2].bitmap.width - 1)
			cropVMin    = 0
			cropVMax    = (sceneMaterials[i].maps[2].bitmap.height - 1)
			UVSwap      = 0
			URepeat     = sceneMaterials[i].maps[2].coordinates.U_Tiling
			VRepeat     = sceneMaterials[i].maps[2].coordinates.V_Tiling
			UAlternate  = 0
			VAlternate  = 0
			UScale      = 1
			VScale      = 1
			UOffset     = sceneMaterials[i].maps[2].coordinates.U_Offset
			VOffset     = sceneMaterials[i].maps[2].coordinates.V_Offset
			projectionMatrix = #((quat 1 0 0 0),(quat 0 1 0 0),(quat 0 0 1 0),(quat 0 0 0 1))
			blendingType     = 3
			blending         = 1
			ambient          = 0.75
			diffuse          = 1
			specular         = 0
			transparency     = sceneMaterials[i].opacity
			reflectivity     = 0
			roughness        = sceneMaterials[i].maps[2].output.Bump_Amount

			format "\t\tSI_Texture2D {\n"
			format "\t\t\t\"%\",\n" imageName
			format "\t\t\t%,\n" mappingType
			format "\t\t\t%,\n" width
			format "\t\t\t%,\n" height
			format "\t\t\t%,\n" cropUMin
			format "\t\t\t%,\n" cropUMax
			format "\t\t\t%,\n" cropVMin
			format "\t\t\t%,\n" cropVMax
			format "\t\t\t%,\n" UVSwap
			format "\t\t\t%,\n" URepeat
			format "\t\t\t%,\n" VRepeat
			format "\t\t\t%,\n" UAlternate
			format "\t\t\t%,\n" VAlternate
			format "\t\t\t%,\n" UScale
			format "\t\t\t%,\n" VScale
			format "\t\t\t%,\n" UOffset
			format "\t\t\t%,\n" VOffset
			format "\t\t\t%,%,%,%,\n" projectionMatrix[1].x projectionMatrix[1].y projectionMatrix[1].z projectionMatrix[1].w
			format "\t\t\t%,%,%,%,\n" projectionMatrix[2].x projectionMatrix[2].y projectionMatrix[2].z projectionMatrix[2].w
			format "\t\t\t%,%,%,%,\n" projectionMatrix[3].x projectionMatrix[3].y projectionMatrix[3].z projectionMatrix[3].w
			format "\t\t\t%,%,%,%,\n" projectionMatrix[4].x projectionMatrix[4].y projectionMatrix[4].z projectionMatrix[4].w
			format "\t\t\t%,\n" blendingType
			format "\t\t\t%,\n" blending
			format "\t\t\t%,\n" ambient
			format "\t\t\t%,\n" diffuse
			format "\t\t\t%,\n" specular
			format "\t\t\t%,\n" transparency
			format "\t\t\t%,\n" reflectivity
			format "\t\t\t%,\n" roughness
			format "\t\t}\n"
			-- SI_Texture2D                                                                   --
			------------------------------------------------------------------------------------
		)
		format "\t}\n"
	)
	-- SI_Material                                                                    --
	------------------------------------------------------------------------------------
	format "}\n\n"		
)
------------------------------------------------------------------------------------
fn exportEnvelopes =
(
	envelopedObjects = for obj in $geometry where (obj.modifiers[#skin] != undefined) collect obj
	nbEnvelopes      = 0
	for i in 1 to envelopedObjects.count do
	(
		nbEnvelopes += (skinOps.getNumberBones envelopedObjects[i].skin)
	)
	
	format "SI_EnvelopeList % {\n" gmaxFileName
	format "\t%,\n" nbEnvelopes
	
	max modify mode		
	for s in 1 to envelopedObjects.count do
	(
		select envelopedObjects[s]
		
		nbBonesInSkinModifier = (skinOps.getNumberBones envelopedObjects[s].skin)
		nbWeightedVertices    = (skinOps.getNumberVertices envelopedObjects[s].skin)
		envelopeModel         = (removeSpacesFromString envelopedObjects[s].name)
		
		for z in 1 to nbBonesInSkinModifier do
		(
			deformerBoneModel  = (removeSpacesFromString (skinOps.getBoneName envelopedObjects[s].skin z 1))
			
			format "\tSI_Envelope % {\n" envelopeModel
			format "\t\t\"MDL-%\",\n"    envelopeModel
			format "\t\t\"MDL-%\",\n"    deformerBoneModel
			format "\t\t%,\n"            nbWeightedVertices
			for w in 1 to nbWeightedVertices do
			(
				try
				(
					vertexIndex         = (w-1)
					weightingPercentage = (skinOps.getVertexWeight envelopedObjects[s].skin w z)
					format "\t\t%,%,\n" vertexIndex weightingPercentage
				) catch (
				)
			)
			format "\t}\n"
		)
	)
	format "}\n"
)
------------------------------------------------------------------------------------
fn getObjectClass sceneObject tabs =
(
	ObjectClass = superClassOf sceneObject
	case ObjectClass of
	(
		GeometryClass:
			(
				if( ((classOf sceneObject) == BoneGeometry) and (bonesStatus == true) ) then
				(
					exportHelper sceneObject tabs
				) else (
					if( classOf sceneObject != Targetobject ) then
					(
						if( meshsStatus == true ) then
						(
							exportGeometry sceneObject tabs
						)
					)
				)
			)
		helper:
			(
				if( classOf sceneObject == Dummy ) then
				(
					exportHelper sceneObject tabs
				)
			)
		default:
			(
			)
	)
)
------------------------------------------------------------------------------------
fn exportModelToConsoleAsXSI =
(
	if( (getFileNameFile maxFileName) != "" ) then
	(
		global gmaxFileName = (removeSpacesFromString (getFileNameFile maxFileName))
	) else (
		global gmaxFileName = "unnamedGmaxScene"
	)

	format "xsi 0300txt 0032\n\n"

	if( (fileProperties.findProperty #summary "Title") > 0 ) then
	(
		projectName   = fileProperties.getPropertyValue #summary 1
	) else (
		projectName   = ""
	)
	if( (fileProperties.findProperty #summary "Author") > 0 ) then
	(
		userName      = fileProperties.getPropertyValue #summary 3
	) else (
		userName      = ""
	)
	savedDateTime = localTime
	originator    = "Gmax XSI Export Version 0.0.3"
	
	format "SI_FileInfo {\n"
	format "\t\"%\",\n" projectName
	format "\t\"%\",\n" userName
	format "\t\"%\",\n" savedDateTime
	format "\t\"%\",\n" originator
	format "}\n\n"

	Timing    = "FRAMES"
	if( (animationsStatus == true) and (animationSubRangeStatus == true) ) then
	(
		start = startFrame.value
		end   = endFrame.value
	) else (
		start = animationRange.start.frame
		end   = animationRange.end.frame
	)
	
	format "SI_Scene {\n" gmaxFileName
	format "\t\"%\",\n"   Timing
	format "\t%,\n"       start
	format "\t%,\n"       end
	format "\t%,\n"       frameRate
	format "}\n\n"

	handRotation = 1
	uAxis        = 0			
	vAxis        = 1								
	xAxis        = 0		
	yAxis        = 2		
	zAxis        = 5	
		
	format "SI_CoordinateSystem {\n"
	format "\t%,\n" handRotation
	format "\t%,\n" uAxis
	format "\t%,\n" vAxis
	format "\t%,\n" xAxis
	format "\t%,\n" yAxis
	format "\t%,\n" zAxis
	format "}\n\n"

	type = 0
			
	format "SI_Angle {\n"
	format "\t%,\n" type
	format "}\n\n"

	red   = ambientColor.red
	green = ambientColor.green
	blue  = ambientColor.blue
	
	format "SI_Ambience {\n"
	format "\t%,\n" red
	format "\t%,\n" green
	format "\t%,\n" blue
	format "}\n\n"
	
	exportMaterials()
		
	format "SI_Model MDL-XSIScene_Root {\n"
	format "\tSI_GlobalMateterial {\n"
	format "\t\t\"Scene_Root\",\n" 					
	format "\t\t\"BRANCH\",\n" 					
	format "\t}\n\n"
	if(	SRTTransformsStatus == true ) then
	(
		format "\tSI_Transform SRT-XSIScene_Root {\n"
		format "\t\t1.000000,\n"
		format "\t\t1.000000,\n"
		format "\t\t1.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t}\n\n"
	)
	if( baseposeTransformsStatus == true ) then
	(
		format "\tSI_Transform BASEPOSE-XSIScene_Root {\n"
		format "\t\t1.000000,\n"
		format "\t\t1.000000,\n"
		format "\t\t1.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t\t0.000000,\n"
		format "\t}\n\n"
	)
	format "\tSI_Visibility {\n"
	format "\t\t1,\n"
	format "\t}\n"
	for i in 1 to rootNode.children.count do
	(
		getObjectClass rootNode.children[i] "\t"
	)
	format "}\n\n" 	
	if( pointWeightsStatus == true ) then
	(
		exportEnvelopes()
	)
)
-- Functions                                                                      --
------------------------------------------------------------------------------------
rollout rolloutXSIExport "XSI Export"
rolledUp: false
silentErrors: false
(
	groupBox objects "Objects" pos:[10,10] width: 150 height: 200
		checkbox mesh 						  "Meshs" 			 				 pos:[25,35]  enabled: true  checked: meshsStatus
		checkbox animations 				  "Animations"		 				 pos:[25,56]  enabled: false checked: animationsStatus
		checkbox bones 						  "Bones" 			 				 pos:[25,77]  enabled: true  checked: bonesStatus
		checkbox pointWeights 				  "Point Weights" 	  				 pos:[25,98]  enabled: true  checked: pointWeightsStatus
		checkbox lights 					  "Lights" 			  				 pos:[25,119] enabled: false checked: false
		checkbox IKChains 					  "IK Chains" 		  				 pos:[25,140] enabled: false checked: false
		checkbox baseposeTransforms 		  "Basepose Transforms" 			 pos:[25,161] enabled: true  checked: baseposeTransformsStatus
		checkbox SRTTransforms 				  "SRT Transforms"	  				 pos:[25,182] enabled: true  checked: SRTTransformsStatus
	groupBox options "Options" pos:[170,10] width: 260 height: 200
		checkbox bonesAsNulls 				  "Bones as Nulls" 					 pos:[185,40]  enabled: false checked: bonesAsNullsStatus
		checkbox flattenHierarchy 			  "Flatten Hierarchy" 				 pos:[320,40]  enabled: false checked: flattenHierarchyStatus
		checkbox animationSubRange 			  "Animation Sub-Range" 			 pos:[185,61]  enabled: false checked: AnimationSubRangeStatus
		checkbox rescale 					  "Rescale" 						 pos:[320,61]  enabled: false checked: rescaleStatus
		edittext startFrame 				  "Frame:" 					 		 pos:[235,85]  enabled: false bold: false fieldWidth: 34 offset:[8,0] text: "0" height: 20
		edittext endFrame 					  "to frame:" 						 pos:[310,85]  enabled: false bold: false fieldWidth: 34 offset:[-55,0] text: "1" height: 20
		checkbox useLocalFilenamesForTextures "Use Local Filenames for Textures" pos:[185,119] enabled: true  checked: useLocalFileNamesStatus
		checkbox generateShaderNamesPSet 	  "Generate Shader Names PSet"		 pos:[185,140] enabled: true  checked: generateShaderNamesPSetStatus
		label	 stripOutPathBeforeString	  "Strip out path before:"			 pos:[202,161] enabled: false
		edittext stripOutPathBefore 		  ""		 						 pos:[198,179] enabled: false bold: false fieldWidth: 215  height: 20 text: stripOutPathBeforeValue
		button	 startExport				  "OK"								 pos:[270,220] enabled: true  width: 70
		button	 cancelExport				  "Cancel"							 pos:[360,220] enabled: true  width: 70
	
	on mesh               changed true  do ( meshsStatus = true )
	on mesh               changed false do ( meshsStatus = false )
	on bones              changed true  do ( bonesStatus = true )
	on bones              changed false do ( bonesStatus = false )
	on baseposeTransforms changed true  do ( baseposeTransformsStatus = true )
	on baseposeTransforms changed false do ( baseposeTransformsStatus = false )
	on SRTTransforms      changed true  do ( SRTTransformsStatus = true )
	on SRTTransforms      changed false do ( SRTTransformsStatus = false )
	on pointWeights       changed true  do ( pointWeightsStatus  = true )
	on pointWeights       changed false do ( pointWeightsStatus  = false )
	on cancelExport       pressed       do ( closeRolloutFloater xsiExporter )
	on generateShaderNamesPSet changed true do
	(
		generateShaderNamesPSetStatus        = true
		stripOutPathBeforeString.enabled     = true
		stripOutPathBefore.enabled           = true
	)
	on animations changed false do
	(
		 animationSubRange.enabled = false 
		if( (startFrame.enabled == true) or (endFrame.enabled == true) ) then
		(
			endFrame.enabled   = false
			startFrame.enabled = false
		)
		if( animationSubRange.checked == false ) then
		(
			endFrame.enabled   = false
			startFrame.enabled = false
		)
	)
	on animationSubRange changed true do
	(
		startFrame.enabled = true
		endFrame.enabled   = true
	)
	on startExport pressed do
	(
		clearListener()
		exportModelToConsoleAsXSI()
	)
)

if( xsiExporter != undefined ) then
(
	closeRolloutFloater xsiExporter
)
gmaxWindow       = getMAXWindowSize()
gmaxWindowWidth  = gmaxWindow.x
gmaxWindowHeight = gmaxWindow.y
horizontalPosition = (((gmaxWindowWidth - 467)/2) as Integer)
if( horizontalPosition < 0 ) then
(
	horizontalPosition = 0
)
verticalPosition = (((gmaxWindowHeight - 308)/2) as Integer)
if( verticalPosition < 0 ) then
(
	verticalPosition = 0
)
xsiExporter = newRolloutFloater "XSI Export" 467 308 horizontalPosition verticalPosition
addRollout rolloutXSIExport xsiExporter