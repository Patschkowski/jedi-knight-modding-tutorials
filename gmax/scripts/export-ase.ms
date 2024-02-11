global ASC2ExporterVersion = "0.0.4"

---------------------------------------
-- exportSceneToConsoleAsASE / Start --
---------------------------------------
fn exportSceneToConsoleAsASE =
(
	clearListener()
	
	format "*3DSMAX_ASCIIEXPORT 200\n"
	format "*COMMENT \"Gmax ASCII Export Version % - %\"\n" ASC2ExporterVersion localTime
	format "*SCENE {\n"
	format "\t*SCENE_FILENAME \"%\"\n" 			maxFileName
	format "\t*SCENE_FIRSTFRAME %\n" 		 	animationRange.start -- as Integer)
	format "\t*SCENE_LASTFRAME %\n" 		 	animationRange.end -- as Integer)
	format "\t*SCENE_FRAMESPEED %\n" 		 	frameRate
	format "\t*SCENE_TICKSPERFRAME %\n" 		ticksPerFrame
	format "\t*SCENE_BACKGROUND_STATIC % % %\n" backgroundColor.red backgroundColor.green backgroundColor.blue
	format "\t*SCENE_AMBIENT_STATIC % % %\n"  	ambientColor.red ambientColor.green ambientColor.blue
	format "\t}\n\n"
	
	format "*MATERIAL_LIST {\n"
	format "\t*MATERIAL_COUNT %\n" 				sceneMaterials.count
	for i in 1 to sceneMaterials.count do
	(
		format "\t*MATERIAL % {\n" (i-1)
		--format "\n"
		format "\t\t*MATERIAL_NAME \"%\"\n" 	 sceneMaterials[i].name
		format "\t\t*MATERIAL_CLASS \"Standard\"\n"	 --FIXME gmax unterstuetzt eh nur standard und multilayer
		format "\t\t*MATERIAL_AMBIENT % % %\n"	 (sceneMaterials[i].ambient.red/255)  (sceneMaterials[i].ambient.green/255)  (sceneMaterials[i].ambient.blue/255)
		format "\t\t*MATERIAL_DIFFUSE % % %\n"	 (sceneMaterials[i].diffuse.red/255)  (sceneMaterials[i].diffuse.green/255)  (sceneMaterials[i].diffuse.blue/255)
		format "\t\t*MATERIAL_SPECULAR % % %\n"	 (sceneMaterials[i].specular.red/255) (sceneMaterials[i].specular.green/255) (sceneMaterials[i].specular.blue/255)
		format "\t\t*MATERIAL_SHINE %\n"		 sceneMaterials[i].specularLevel
		format "\t\t*MATERIAL_SHINESTRENGTH %\n" sceneMaterials[i].glossiness
		format "\t\t*MATERIAL_TRANSPARENCY %\n"	 sceneMaterials[i].opacity
		format "\t\t*MATERIAL_WIRESIZE %\n"		 1 --FIXME sceneMaterials[i].wireSize (Wie es aussieht kennt Gmax das hier nicht, in der Dokumentation ist dazu aber nichts vermerkt...
		format "\t\t*MATERIAL_SHADING %\n"		 sceneMaterials[i].shaderByName
		format "\t\t*MATERIAL_XP_FALLOFF %\n"	 sceneMaterials[i].opacityFallOff
		format "\t\t*MATERIAL_SELFILLUM %\n"	 sceneMaterials[i].selfIllumAmount
		case sceneMaterials[i].opacityFallOffType of
		(
			0: format "\t\t*MATERIAL_FALLOFF In\n" 
			1: format "\t\t*MATERIAL_FALLOFF Out\n"
		)
		case sceneMaterials[i].opacityType of
		(
			0: format "\t\t*MATERIAL_XP_TYPE Filter\n"	
			1: format "\t\t*MATERIAL_XP_TYPE Subtractive\n"	
			2: format "\t\t*MATERIAL_XP_TYPE Additive\n"	
		)	 
		if( sceneMaterials[i].mapEnables[1] ) then --AmbientMap
		(
		)
		if( sceneMaterials[i].mapEnables[2] ) then --DiffuseMap
		(
			format "\t\t*MAP_DIFFUSE {\n"
			format "\t\t\t*MAP_NAME \"%\"\n"	 sceneMaterials[i].diffuseMap.name
			format "\t\t\t*MAP_CLASS %\n"		 Bitmap --FIXME
			--format "\t\t\t*MAP_SUBNO %\n"		--FIXME
			format "\t\t\t*MAP_AMOUNT %\n"	 	 sceneMaterials[i].diffuseMapAmount
			format "\t\t\t*BITMAP \"%\"\n"		 sceneMaterials[i].diffuseMap.fileName
			case sceneMaterials[i].diffuseMap.coordinates.mappingType of
			(
				0: case sceneMaterials[i].diffuseMap.coordinates.mapping of
				   (
					   0: format "\t\t\t*MAP_TYPE Explicit Map Channel\n"
					   1: format "\t\t\t*MAP_TYPE Vertex Color Channel\n"
					   2: format "\t\t\t*MAP_TYPE Planar from Object XYZ\n"
					   3: format "\t\t\t*MAP_TYPE Planar from World XYZ\n"
				   )
				1: case sceneMaterials[i].diffuseMap.coordinates.mapping of
				   (
					   0: format "\t\t\t*MAP_TYPE Spherical\n"
					   1: format "\t\t\t*MAP_TYPE Cylindrical\n"
					   2: format "\t\t\t*MAP_TYPE Shrink-Wrap\n"
					   3: format "\t\t\t*MAP_TYPE Screen\n"
				   )
			)
			format "\t\t\t*UVW_U_OFFSET %\n"	 sceneMaterials[i].diffuseMap.coordinates.U_Offset
			format "\t\t\t*UVW_V_OFFSET %\n"	 sceneMaterials[i].diffuseMap.coordinates.V_Offset
			format "\t\t\t*UVW_U_TILING %\n"	 sceneMaterials[i].diffuseMap.coordinates.U_Tiling
			format "\t\t\t*UVW_V_TILING %\n"	 sceneMaterials[i].diffuseMap.coordinates.V_Tiling
			format "\t\t\t*UVW_ANGLE %\n"		 0 --FIXME
			format "\t\t\t*UVW_BLUR %\n"		 sceneMaterials[i].diffuseMap.coordinates.Blur
			format "\t\t\t*UVW_BLUR_OFFSET %\n"	 sceneMaterials[i].diffuseMap.coordinates.Blur_Offset
			format "\t\t\t*UVW_NOISE_AMT %\n"	 sceneMaterials[i].diffuseMap.coordinates.Noise_Amount
			format "\t\t\t*UVW_NOISE_SIZE %\n"	 sceneMaterials[i].diffuseMap.coordinates.Noise_Levels
			format "\t\t\t*UVW_NOISE_LEVEL %\n"	 sceneMaterials[i].diffuseMap.coordinates.Noise_Size
			format "\t\t\t*UVW_NOISE_PHASE %\n"	 sceneMaterials[i].diffuseMap.coordinates.Phase
			case sceneMaterials[i].maps[2].filtering of
			(
				0: format "\t\t\t*BITMAP_FILTER Pyramidel\n"
				1: format "\t\t\t*BITMAP_FILTER Summed Area\n"
				2: format "\t\t\t*BITMAP_FILTER None\n"
			)
			format "\t\t\t}\n"
		)
		if( sceneMaterials[i].mapEnables[3] ) then --SpecularMap
		(
		)
		if( sceneMaterials[i].mapEnables[4] ) then --SpecularLevelMap
		(
		)
		if( sceneMaterials[i].mapEnables[5] ) then --GlossinessMap
		(
		)
		if( sceneMaterials[i].mapEnables[6] ) then --SelfIllumMap
		(
		)
		if( sceneMaterials[i].mapEnables[7] ) then --OpacityMap
		(
		)
		if( sceneMaterials[i].mapEnables[8] ) then --FilterMap
		(
		)
		if( sceneMaterials[i].mapEnables[9] ) then --BumpMap
		(
		)
		if( sceneMaterials[i].mapEnables[10] ) then --ReflectionMap
		(
		)
		if( sceneMaterials[i].mapEnables[11] ) then --RefractionMap
		(
		)
		if( sceneMaterials[i].mapEnables[12] ) then --DisplacementMap
		(
		)
		format "\t}\n"
	)	
	format "\t\t}\n\n"
	
	for i in 1 to ($geometry/*).count do --*/
	(
		geometryObject = ($geometry/*)[i] --*/
		format "*GEOMOBJECT {\n"
		format "\t*NODE_NAME \"%\"\n" geometryObject.name
		format "\t*NODE_TM {\n"
		format "\t\t*NODE_NAME \"%\"\n" geometryObject.name
		if( (getInheritanceFlags geometryObject)[1] ) then ( inherit_pos_x = 1 ) else ( inherit_pos_x = 0 )
		if( (getInheritanceFlags geometryObject)[2] ) then ( inherit_pos_y = 1 ) else ( inherit_pos_y = 0 )
		if( (getInheritanceFlags geometryObject)[3] ) then ( inherit_pos_z = 1 ) else ( inherit_pos_z = 0 )
		format "\t\t*INHERIT_POS % % %\n" 	 inherit_pos_x inherit_pos_y inherit_pos_z
		if( (getInheritanceFlags geometryObject)[4] ) then ( inherit_rot_x = 1 ) else ( inherit_rot_x = 0 )
		if( (getInheritanceFlags geometryObject)[5] ) then ( inherit_rot_y = 1 ) else ( inherit_rot_y = 0 )
		if( (getInheritanceFlags geometryObject)[6] ) then ( inherit_rot_z = 1 ) else ( inherit_rot_z = 0 )
		format "\t\t*INHERIT_ROT % % %\n" 	 inherit_rot_x inherit_rot_y inherit_rot_z 
		if( (getInheritanceFlags geometryObject)[7] ) then ( inherit_scl_x = 1 ) else ( inherit_scl_x = 0 )
		if( (getInheritanceFlags geometryObject)[8] ) then ( inherit_scl_y = 1 ) else ( inherit_scl_y = 0 )
		if( (getInheritanceFlags geometryObject)[9] ) then ( inherit_scl_z = 1 ) else ( inherit_scl_z = 0 )
		format "\t\t*INHERIT_SCL % % %\n"	 inherit_scl_x inherit_scl_y inherit_scl_z
		
		transformMatrix = geometryObject.transform
		format "\t\t*TM_ROW0 % % %\n" 		 (transformMatrix.row1)[1] (transformMatrix.row1)[2] (transformMatrix.row1)[3]
		format "\t\t*TM_ROW1 % % %\n" 		 (transformMatrix.row2)[1] (transformMatrix.row2)[2] (transformMatrix.row2)[3]
		format "\t\t*TM_ROW2 % % %\n" 		 (transformMatrix.row3)[1] (transformMatrix.row3)[2] (transformMatrix.row3)[3]
		format "\t\t*TM_ROW3 % % %\n" 		 (transformMatrix.row4)[1] (transformMatrix.row4)[2] (transformMatrix.row4)[3]
		format "\t\t*TM_POS % % %\n" 		 geometryObject.pivot.x geometryObject.pivot.y geometryObject.pivot.z
		format "\t\t*TM_ROTAXIS % % %\n"	 geometryObject.rotation.x geometryObject.rotation.y geometryObject.rotation.z
		format "\t\t*TM_ROT_ANGLE %\n" 		 geometryObject.rotation.angle
		/*format "\t\t*TM_SCALE % % %\n"
		format "\t\t*TM_SCALEAXIS % % %\n"
		format "\t\t*TM_SCALEAXISANG %\n"*/
		format "\t}\n"
		
		format "\t*MESH {\n"
		format "\t\t*TIMEVALUE %\n"			 0 --FIXME
		format "\t\t*MESH_NUMVERTEX %\n"	 geometryObject.mesh.numVerts
		format "\t\t*MESH_NUMFACES %\n"		 geometryObject.mesh.numFaces
		format "\t\t*MESH_VERTEX_LIST {\n"
		for k in 1 to geometryObject.mesh.numVerts do
		(
			vertexIndex = k-1
			format "\t\t\t*MESH_VERTEX %\t\t% % %\n" vertexIndex geometryObject.mesh.verts[k].pos.x geometryObject.mesh.verts[k].pos.y geometryObject.mesh.verts[k].pos.z
		)
		format "\t\t\t}\n"
		
		format "\t\t*MESH_FACE_LIST {\n"
		for k in 1 to geometryObject.mesh.numFaces do
		(
			faceIndex = k-1
			a = ((getFace geometryObject.mesh k)[1] as Integer)-1
			b = ((getFace geometryObject.mesh k)[2] as Integer)-1
			c = ((getFace geometryObject.mesh k)[3] as Integer)-1
			format "\t\t\t*MESH_FACE %:\t\tA: % B: % C: %" faceIndex a b c
			if( (getFaceSmoothGroup geometryObject.mesh k) != undefined ) then
			(
				format "\t\t*MESH_SMOOTHING %" (getFaceSmoothGroup geometryObject.mesh k)
			)
			if( (getFaceMatID geometryObject.mesh k) != undefined ) then
			(
				format "\t\t*MESH_MTLID %" (getFaceMatID geometryObject.mesh k)
			)
			format "\n"
		)
		format "\t\t\t}\n"
		
		-->------------------------------------------->--
		-->-----*MESH_TVERTLIST  *MESH_TVFACELIST----->--
		-->------------------------------------------->--
		if( (rolloutASEExport.mappingCoords.checked == true) and (geometryObject.mesh.numtverts > 0) ) then
		(
			format "\t\t*MESH_NUMTVERTEX %\n" geometryObject.mesh.numtverts
			format "\t\t*MESH_TVERT_LIST {\n"
			for k in 1 to geometryObject.mesh.numtverts do
			(
				tVertexIndex = k-1
				uCoordinate  = (getTVert geometryObject.mesh k).x
				vCoordinate  = (getTVert geometryObject.mesh k).y
				wCoordinate  = (getTVert geometryObject.mesh k).z
				format "\t\t\t*MESH_TVERT %\t\t% % %\n" tVertexIndex uCoordinate vCoordinate wCoordinate 
			)
			format "\t\t\t}\n"
			format "\t\t*MESH_NUMTVFACES %\n" geometryObject.mesh.numFaces
			format "\t\t*MESH_TFACELIST {\n"
			for h in 1 to geometryObject.mesh.numFaces do
			(
				tFaceIndex = h-1
				tFaceVertexA = ((getTVFace geometryObject.mesh h)[1] as Integer)-1
				tFaceVertexB = ((getTVFace geometryObject.mesh h)[2] as Integer)-1
				tFaceVertexC = ((getTVFace geometryObject.mesh h)[3] as Integer)-1
				format "\t\t\t*MESH_TFACE %\t\t% % %\n" tFaceIndex tFaceVertexA tFaceVertexB tFaceVertexC
			)
			format "\t\t\t}\n"
		)
		--<-------------------------------------------<--
		--<-----*MESH_TVERTLIST  *MESH_TVFACELIST-----<--
		--<-------------------------------------------<--
		
		-->------------------------------------------->--
		-->---------------*MESH_NORMALS--------------->--
		-->------------------------------------------->--
		if( rolloutASEExport.meshNormals.checked == true) then
		(
			format "\t\t*MESH_NORMALS {\n"
			for k in 1 to geometryObject.mesh.numFaces do
			(
				faceIndex = k-1
				faceNormals = (getFaceNormal geometryObject.mesh k)
							format "\t\t\t*MESH_FACENORMAL %\t% % %\n" faceIndex faceNormals.x faceNormals.y faceNormals.z
				vertexIndexA = (getFace geometryObject.mesh k).x  as Integer
					vertexANormals = getNormal geometryObject.mesh vertexIndexA
						vertexANormals_x = vertexANormals.x
						vertexANormals_y = vertexANormals.y
						vertexANormals_z = vertexANormals.z
							format "\t\t\t\t*MESH_VERTEXNORMAL %\t\t% % %\n" (vertexIndexA-1) vertexANormals_x vertexANormals_y vertexANormals_z
				vertexIndexB = (getFace geometryObject.mesh k).y  as Integer
					vertexBNormals = getNormal geometryObject.mesh vertexIndexB
						vertexBNormals_x = vertexBNormals.x
						vertexBNormals_y = vertexBNormals.y
						vertexBNormals_z = vertexBNormals.z
							format "\t\t\t\t*MESH_VERTEXNORMAL %\t\t% % %\n" (vertexIndexB-1) vertexBNormals_x vertexBNormals_y vertexBNormals_z
				vertexIndexC = (getFace geometryObject.mesh k).z  as Integer
					vertexCNormals = getNormal geometryObject.mesh vertexIndexC
						vertexCNormals_x = vertexCNormals.x
						vertexCNormals_y = vertexCNormals.y
						vertexCNormals_z = vertexCNormals.z
							format "\t\t\t\t*MESH_VERTEXNORMAL %\t\t% % %\n" (vertexIndexC-1) vertexCNormals_x vertexCNormals_y vertexCNormals_z			
			)
			format "\t\t\t}\n"
		)
		--<-------------------------------------------<--
		--<---------------*MESH_NORMALS---------------<--
		--<-------------------------------------------<--
	
		format "\t\t}\n" --end mesh
		case geometryObject.motionBlurOn of
		(
			false: format "\t*PROP_MOTIONBLUR 0\n"
			true:  format "\t*PROP_MOTIONBLUR 1\n"
		)
		case geometryObject.castShadows of
		(
			false: format "\t*PROP_CASTSHADOW 0\n" 
			true:  format "\t*PROP_CASTSHADOW 1\n" 
		)
		case geometryObject.receiveShadows of
		(
			false: format "\t*PROP_RECVSHADOW 0\n" 
			true:  format "\t*PROP_RECVSHADOW 1\n" 
		)
		if( geometryObject.material != undefined ) then
		(
			format "\t*MATERIAL_REF %\n" geometryObject.material
		)
		if( false ) then --animation block
		(
			format "\t*TM_ANIMATION {\n"
			format "\t\t}\n"
		)
		format "\t*WIREFRAME_COLOR % % %\n" (geometryObject.wireColor.r/255) (geometryObject.wireColor.g/255) (geometryObject.wireColor.b/255)
		format "\t}\n" --end geomobject
	)
)
-------------------------------------
-- exportSceneToConsoleAsASE / End --
-------------------------------------

-----------------------------
-- Window Creation / Start --
-----------------------------
rollout rolloutASEExport "ASCII Scene Export"
rolledUp: false
silentErrors: false
(
	groupBox outpOpts "Output Options" 		pos:[10,10]   width: 200 height: 160
		checkbox sdf "Mesh Definition" 					pos:[25,35]
		checkbox rtz "Materials" 						pos:[25,56]
		checkbox sfr "Transform Animation Keys" 		pos:[25,77]
		checkbox tuu "Animated Mesh" 					pos:[25,98]
		checkbox wer "Animated Camera/Light Settings"	pos:[25,119]
		checkbox tzu "Inverse Kinematics Joints" 		pos:[25,140]
		
	groupBox meshOpts "Mesh Options" 		pos:[10,175]  width: 200 height: 90
		checkbox meshNormals 	"Mesh Normals"			pos:[25,197]
		checkbox mappingCoords 	"Mapping Coordinates" 	pos:[25,218]
		checkbox vertexColors 	"Vertex Colors"			pos:[25,239]
	
	groupBox objTypes "Object Types" 		pos:[220,10]  width: 130 height: 160
		checkbox uio "Geometric" 						pos:[235,35]
		checkbox puz "Shapes" 							pos:[235,56]
		checkbox ase "Cameras" 							pos:[235,77]
		checkbox zxq "Lights" 							pos:[235,98]
		checkbox rux "Helpers" 							pos:[235,119]
	
	groupBox statoutp "Static Output" 		pos:[360,75]  width: 130 height: 45
		spinner isp "Frame#: " range:[animationRange.start,animationRange.end,0] type:#integer scale: 1 fieldWidth: 40 pos:[382,95]
		
	groupBox precisin "Precision" 			pos:[360,125] width: 130 height: 45
		spinner rpz "Decimals: " range:[0,100,0] type:#integer scale: 1 fieldWidth: 40 pos:[375,145]
		
	groupBox conOutpt "Controller Output" 	pos:[220,175] width: 270 height: 90
		label textLabel "Frames Per Sample:" pos:[382,190]
		radiobuttons tbp labels:#("Use Keys","Force Sample") default: 1 columns: 1 pos:[235,211]
		spinner gpa "Controllers: " range:[0,100,5] type: #integer scale: 1 fieldWidth: 40 pos:[369,211]
		spinner www "Animated Objects: " range:[0,100,5] type: #integer scale: 1 fieldWidth: 40 pos:[335,238]

	button startExport "OK" width: 70 pos:[420,10]
	on startExport pressed do
	(
		exportSceneToConsoleAsASE()
	)
	button cancelExport "Cancel" width: 70 pos:[420,40]
	on cancelExport pressed do
	(
		closeRolloutFloater aseExporter
	)
	--bild = openbitmap "ase-export.jpg"
	--image:#("$scripts\\ase-export.bmp",undefined,1,1,1,1,1)
	/*button credits "About" toolTip:"Get information about the author and version of this utility." pos:[360,10] width:50 height:51
	on credits pressed do
	(
		messageBox "ASCII Scene Export for Gmax\nDeveloped by Felix \"FeBrex\" Patschkowski" title:"About" beep:false
	)*/
)

if( aseExporter != undefined ) then
(
	closeRolloutFloater aseExporter
)
aseExporter = newRolloutFloater "ASCII Export" 528 332 21 34
addRollout rolloutASEExport aseExporter
---------------------------
-- Window Creation / End --
---------------------------