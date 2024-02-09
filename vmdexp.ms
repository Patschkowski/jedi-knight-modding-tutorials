-- XSI Export script for 3ds Max to export to XSI 3.0 file format.
-- Copyright (C) 2014-2024 Felix Patschkowski <felix.patschkowski@gmail.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
rollout XSIExport "XSI Export" rolledUp:false silentErrors:false (
	local startFrameText = ((animationRange.start.ticks)/ticksPerFrame) as string
	local endFrameText = ((animationRange.end.ticks)/ticksPerFrame) as string
	
	groupBox objects "Objects" pos:[10,10] width:150 height:200
	checkbox meshs "Meshs" pos:[25,35] checked:true
	checkbox animations "Animations" pos:[25,56] checked:true
	checkbox bones "Bones" pos:[25,77] checked:true
	checkbox pointWeights "Point Weights" pos:[25,98] checked:true
	checkbox lights "Lights" pos:[25,119] enabled:false
	checkbox ikChains "IK Chains" pos:[25,140] enabled:false
	checkbox baseposeTransforms "Basepose Transforms" pos:[25,161]
	checkbox srtTransforms "SRT Transforms" pos:[25,182]
	groupBox options "Options" pos:[170,10] width:260 height:200
	checkbox bonesAsNulls "Bones as Nulls" pos:[185,40] enabled:true checked:true
	checkbox flattenHierarchy "Flatten Hierarchy" pos:[320,40]
	checkbox animationSubRange "Animation Sub-Range" enabled:true pos:[185,61]
	checkbox rescale "Rescale" pos:[320,61] enabled:false
	edittext startFrame "Frame:" pos:[235,85] enabled:false bold:false \
		fieldWidth:34 text:startFrameText height:20
	edittext endFrame "to frame:" pos:[310,85] enabled:false bold:false \
		fieldWidth:34 text:endFrameText height:20
	checkbox useLocalFilenamesForTextures "Use Local Filenames For Textures" \
		pos:[185,119]
	checkbox generateShaderNamesPSet "Generate Shader Names PSet" pos:[185,140] checked:true
	label stripOutPathBeforeLabel "Strip out path before:" pos:[202,161]
	edittext stripOutPathBefore "" pos:[199,181] \
		enabled:true bold:false fieldWidth:215 height:20 text:"C:\\base\\"
	button okButton "OK" pos:[270,220] width:70
	button cancel "Cancel" pos:[360,220] width:70
	
	fn clamp x xMin xMax = (
	  if x < xMin then xMin else if x > xMax then xMax else x
	)
	
	on animations changed newState do (
		animationSubRange.enabled = newState
		if animationSubRange.checked do \
			startFrame.enabled = endFrame.enabled = newState			
	)
	
	on startFrame entered txt do (
		try (
			startFrame.text = startFrameText = 
				((clamp ((txt as integer) as time) \
					animationRange.start animationRange.end).ticks /
						ticksPerFrame) as string
		) catch (
			startFrame.text = startFrameText
		)
	)
	
	on endFrame entered txt do (
		try (
			endFrame.text = endFrameText = 
				((clamp ((txt as integer) as time) \
					animationRange.start animationRange.end).ticks /
						ticksPerFrame) as string
		) catch (
			endFrame.text = endFrameText
		)
	)
	
	on animationSubRange changed newState do \
		startFrame.enabled = endFrame.enabled = newState
	
	on generateShaderNamesPSet changed newState do \
		stripOutPathBefore.enabled = stripOutPathBeforeLabel.enabled = newState
	
	on bones changed newState do \
		bonesAsNulls.enabled = newState
	
	local T = matrix3 x_axis  -z_axis y_axis [0,0,0]

	fn trim s = (
		local tmp = ""
		for x in (filterString s " ") do tmp += x + "_"
		return substring tmp 1 (tmp.count-1)
	)
	
	/*fn SI_FCurve objectName fCurve controller = (
		if animations.checked do (
			format "SI_FCurve %-% {\n" objectName fCurve
			format "\"%\"," objectName
			format "\"%\"," fCurve
			
			local range = if animationSubRange.checked then \
				interval ((startFrame.text + "f") as time) \
					((endFrame.text + "f") as time) else animationRange
				
			case classOf controller of (
				Bezier_Float:(
					format "\"HERMITE\",\n1,\n3,\n%,\n" (numKeys controller)
					for key in controller.keys where \
						(range.start <= key.time and key.time <= range.end) do \
						format "%,%,%,%,\n" \
						((key.time.ticks/ticksPerFrame) as float) key.value key.inTangent key.outTangent
				)
				Linear_Float:(
					format "\"LINEAR\",\n1,\n1,\n%,\n" (numKeys controller)
					for key in controller.keys where \
						(range.start <= key.time and key.time <= range.end) do \
						format "%,%,\n" ((key.time.ticks/ticksPerFrame) as float) key.value
				)
				TCB_Float:(
					format "\"CUBIC\",\n1,\n5,\n%,\n" (numKeys controller)
					for i=1 to (numKeys controller) where \
						(range.start <= controller.keys[i].time and \
							controller.keys[i].time <= range.end) do (
						-- TODO Calculate left and right tangents.
						format "%,%,%,0.0,%,0.0\n" \
							((key.time.ticks/ticksPerFrame) as float) key.value leftTan rightTan
					)
				)
				
				default: throw "Type of controller is not supported"
			)
			format "}\n\n"
		)
	)*/
	
	fn SI_FileInfo = (
		local projectName = if fileProperties.findProperty #summary "Title" > 0 \
			then fileProperties.getPropertyValue #summary 1 else ""
		local userName = if fileProperties.findProperty #summary "Author" > 0 \
			then fileProperties.getPropertyValue #summary 3 else ""
		
		format "SI_FileInfo {\n"
		for x in #(projectName,userName,localTime,"gmax XSI Export") do \
			format "\"%\",\n" x
		format "}\n\n"
	)
	
	fn SI_Scene = (
		global sceneName = trim (getFileNameFile maxFileName)
		if "" == sceneName do sceneName = "Untitled"
		local start = if animationSubRange.checked then startFrame.text else \
			(animationRange.start / ticksPerFrame)
		local end = if animationSubRange.checked then endFrame.text else \
			(animationRange.end / ticksPerFrame)
		format "SI_Scene % {\n\"FRAMES\",\n%,\n%,\n%,\n}\n\n" \
			sceneName (start as float) (end as float) (frameRate as float)
	)
	
	fn SI_CoordinateSystem = (
		format "SI_CoordinateSystem {\n1,\n0,\n1,\n0,\n2,\n5,\n}\n\n"
	)
	
	fn SI_Angle = (
		format "SI_Angle {\n0,\n}\n\n"
	)
	
	fn SI_Ambience = (
		format "SI_Ambience {\n%,\n%,\n%,\n}\n\n" ambientColor.red \
			ambientColor.green ambientColor.blue
	)
	
	fn SI_Texture2D nm map = (
		local width = map.bitmap.width
		local height = map.bitmap.height
		format "SI_Texture2D % {\n\"%\",\n" nm map.fileName
		local mappingTypes = #(4,0,1,2,6,5,3,7)
		-- Texture Explicit         4
		-- Texture Vertex           0
		-- Texture Planar Object  1
		-- Texture Planar World   2
		-- Env Spherical              6
		-- Env Cylindrical            5
		-- Env Shrink                  3
		-- Env Screen                 7
		format "%,\n" mappingTypes[1+map.coords.mappingType*4+map.coords.mapping]
		format "%,\n%,\n" width height
		local cropU = [0,width-1]
		format "%,\n%,\n" cropU.x cropU.y
		local cropV = [0,height-1]
		format "%,\n%,\n" cropV.x cropV.y
		format "0,\n" -- UVSwap
		format "%,\n%,\n" map.coords.U_Tiling map.coords.V_Tiling
		format "%,\n%,\n1,\n1,\n" (if map.coords.U_Mirror then 1 else 0) \
			(if map.coords.V_Mirror then 1 else 0) -- Scale
		format "%,\n%,\n" map.coords.U_Offset map.coords.V_Offset
		format "1,0,0,0,\n" -- projection matrix
		format "0,1,0,0,\n"
		format "0,0,1,0,\n"
		format "0,0,0,1,\n"
		format "3,\n1,\n0.75,\n1,\n0,\n%,\n0,\n%,\n" \
			map.output.output_amount map.output.Bump_Amount
		format "}\n\n"
	)
	
	fn SI_Material mtl = (
		format "SI_Material % {\n" (trim mtl.name)
		local faceColor = mtl.diffuse/255
		format "%,%,%,%,\n" faceColor.r faceColor.g faceColor.b faceColor.a
		format "%,\n" mtl.specularLevel
		local specularColor = mtl.specular/255
		format "%,%,%,\n" specularColor.r specularColor.g specularColor.b
		local emissiveColor = if mtl.useSelfIllumColor then \
			mtl.selfIllumColor/255 else faceColor
		format "%,%,%,\n" emissiveColor.r emissiveColor.g emissiveColor.b
		local shadingModel = case mtl.shaderByName of (
			"Blinn":3
			"Metal":1
			"Phong":2
			default:1
		)
		format "%,\n" shadingModel
		local ambient = mtl.ambient/255
		format "%,%,%,\n" ambient.r ambient.g ambient.b
		for map in mtl.maps where undefined != map do \
			SI_Texture2D (trim mtl.name) map
		format "}\n\n"
	)
	
	fn SI_MaterialLibrary = (
		format "SI_MaterialLibrary MATLIB-% {\n%,\n" \
			sceneName sceneMaterials.count
		for mtl in sceneMaterials do SI_Material mtl
		format "}\n\n"
	)
	
	fn SI_Visibility nd = (
		format "SI_Visibility {\n%,\n}\n\n" (if nd.visibility then 1 else 0)
	)
	
	fn SI_Transforms nd = (
		local scal = nd.transform.scale*T
		local rot = nd.transform.rotation*T
		local trans = nd.transform.translation*T
		
		if srtTransforms.checked do (
			format "SI_Transform SRT-% {\n" (trim nd.name)
			for x in \
				#(scal.x,scal.y,scal.z,rot.x,rot.y,rot.z,trans.x,trans.y,trans.z)\
					do format "%,\n" x
			format "}\n\n"
		)
		
		if baseposeTransforms.checked do (
			format "SI_Transform BASEPOSE-% {\n" (trim nd.name)
			for x in \
				#(scal.x,scal.y,scal.z,rot.x,rot.y,rot.z,trans.x,trans.y,trans.z)\
					do format "%,\n" x
			format "}\n\n"
		)
	)
	
	fn SI_Shape nm msh = (
		format "SI_Shape SHP-%-ORG {\n" nm
		local nbShapeArrays = 2
		if msh.numtverts > 0 do nbShapeArrays += 1
		if msh.numcpvverts > 0 do nbShapeArrays += 1
		format "%,\n\"ORDERED\",\n" nbShapeArrays
		format "\n%,\n\"POSITION\",\n" msh.numverts
		for v in msh.verts do (
			local u =v.pos*T
			format "%,%,%,\n" u.x u.y u.z
		)
		format "\n%,\n\"NORMAL\",\n" msh.numverts
		for i=1 to msh.numverts do (
			local u = (getNormal msh i)*T
			format "%,%,%,\n" u.x u.y u.z
		)
		if msh.numcpvverts > 0 do (
			format "\n%,\n\"COLOR\",\n" msh.numcpvverts
			for i=1 to msh.numcpvverts do (
				local col = (getVertColor msh i)/255
				format "%,%,%,\n" col.r col.g col.b col.a
			)
		)
		if msh.numtverts > 0 do (
			format "\n%,\n\"TEX_COORD_UV\",\n" msh.numtverts
			for i=1 to msh.numtverts do (
				local uvw = (getTVert msh i)--*T
				format "%,%,\n" uvw.x uvw.y
			)
		)
		format "}\n\n"
	)
	
	fn SI_TriangleList nm mtl msh = (
		format "SI_TriangleList % {\n%,\n" nm msh.numfaces
		format "\"NORMAL"
		if msh.numcpvverts > 0 do format "|COLOR"
		if msh.numtverts > 0 do format "|TEX_COORD_UV"
		format "\",\n"
		format "\"%\",\n" (if mtl != undefined then mtl.name else "")
		for i=1 to msh.numfaces do (
			local indices = (getFace msh i) - [1,1,1]
			format "%,%,%,\n" (indices.x as integer) \
				(indices.y as integer) (indices.z as integer)
		)
		format "\n"
		for i=1 to msh.numfaces do (
			local indices = (getFace msh i) - [1,1,1]
			format "%,%,%,\n" (indices.x as integer) (indices.y as integer) \
				(indices.z as integer)
		)
		if msh.numcpvverts > 0 do (
			format "\n"
			for i=1 to msh.numfaces do (
				local indices = (getVCFace msh i) - [1,1,1]
				format "%,%,%,\n" (indices.x as integer) (indices.y as integer) \
					(indices.z as integer)
			)
		)
		if msh.numtverts > 0 do (
			format "\n"
			for i=1 to msh.numfaces do (
				local indices = (getTVFace msh i) - [1,1,1]
				format "%,%,%,\n" (indices.x as integer) \
					(indices.y as integer) (indices.z as integer)
			)
		)
		format "}\n\n"
	)
	
	fn SI_GlobalMaterial mtl = (
		if undefined != mtl do \
			format "SI_GlobalMaterial {\n\"NODE\",\n\"%\",\n}\n\n" \
				(trim mtl.name)
	)
	
	fn SI_Mesh nm mtl msh = (
		if meshs.checked do (
			format "SI_Mesh MSH-% {\n" nm
			SI_Shape nm msh
			SI_TriangleList nm mtl msh
			format "}\n\n"
		)
	)
	
	fn SI_Null nm = (
		format  "SI_Null % {\n}\n\n" nm
	)
	
	fn SI_Model nd = (		
		local nm = trim nd.name
		format "SI_Model MDL-% {\n" nm
		SI_GlobalMaterial nd.material
		
		if nd.rotation.isAnimated do (
			-- Loop over all frames that are going to be exported.
			local range = if animationSubRange.checked then \
				interval (startFrame.text as integer) \
					(endFrame.text as integer) else animationRange
					
			format "SI_FCurve %-ROTATION-X {\n" nm fCurve
			format "\"%\"," nm
			format "\"ROTATION-X\"," fCurve
			format "\"LINEAR\",\n1,\n1,\n%,\n" (((range.end-range.start+1)/ticksPerFrame) as integer)
			for ti=range.start to range.end do (
				at time ti
				local r = angleAxis nd.rotation
				r.axis = r.axis * T
				format "%,%,\n" ((ti.ticks/ticksPerFrame) as float) (r as eulerAngles).x
			)
			format "}\n\n"
			
			format "SI_FCurve %-ROTATION-Y {\n" nm fCurve
			format "\"%\"," nm
			format "\"ROTATION-Y\"," fCurve
			format "\"LINEAR\",\n1,\n1,\n%,\n" (((range.end-range.start+1)/ticksPerFrame) as integer)
			for ti=range.start to range.end do (
				at time ti
				local r = angleAxis nd.rotation
				r.axis = r.axis * T
				format "%,%,\n" ((ti.ticks/ticksPerFrame) as float) (r as eulerAngles).y
			)
			format "}\n\n"
			
			format "SI_FCurve %-ROTATION-Z {\n" nm fCurve
			format "\"%\"," nm
			format "\"ROTATION-Z\"," fCurve
			format "\"LINEAR\",\n1,\n1,\n%,\n" (((range.end-range.start+1)/ticksPerFrame) as integer)
			for ti=range.start to range.end do (
				at time ti
				local r = angleAxis nd.rotation
				r.axis = r.axis * T
				format "%,%,\n" ((ti.ticks/ticksPerFrame) as float) (r as eulerAngles).z
			)
			format "}\n\n"
			
			/*local xyzControllers = if classOf nd.rotation.track == Euler_XYZ \
			then (
				nd.rotation
			) else (
				local eulerXyz = Euler_XYZ()
			
				for key in nd.rotation.keys do (
					local tm = key.time
					local rot = (angleAxis key.value.angle (key.value.axis*T)) \
						as eulerAngles
					
					addNewKey eulerXyz.x_rotation.track tm
					local index = getKeyIndex eulerXyz.x_rotation.track tm
					(getKey eulerXyz.x_rotation.track index).value = rot.x
					
					addNewKey eulerXyz.y_rotation.track tm
					local index = getKeyIndex eulerXyz.y_rotation.track tm
					(getKey eulerXyz.y_rotation.track index).value = rot.y
					
					addNewKey eulerXyz.z_rotation.track tm
					local index = getKeyIndex eulerXyz.z_rotation.track tm
					(getKey eulerXyz.z_rotation.track index).value = rot.z
				)
			
				getXYZControllers eulerXyz
			)
			
			
			SI_FCurve nm "ROTATION-X" xyzControllers[1]
			SI_FCurve nm "ROTATION-Y" xyzControllers[2]
			SI_FCurve nm "ROTATION-Z" xyzControllers[3]*/
		)
		
		-- TODO Export translation and scaling animations.
		
		SI_Transforms nd
		SI_Visibility nd
		
		if generateShaderNamesPSet.checked and undefined != nd.material and \
			undefined != nd.material.maps[2] and \
			1 == (findString nd.material.maps[2].bitmap.fileName \
				stripOutPathBefore.text) do (
			format \
"XSI_CustomPSet %.Game {\n\"NODE\",\n1,\n\"Shader\",\"Text\",\"%\",\n}\n\n" \
				nm (substring nd.material.maps[2].bitmap.fileName \
					(stripOutPathBefore.text.count+1) -1)
				-- TODO Strip path.
		)
		
		case superClassOf nd of (
			GeometryClass:
				if (classOf nd != BoneGeometry or (bones.checked and \
					not bonesAsNulls.checked)) then \
						SI_Mesh nm nd.material (/*nd.mesh*/snapshotasmesh nd) else \
					if classOf nd == BoneGeometry and bones.checked and \
						bonesAsNulls.checked do SI_Null nm
			Helper:
				if classOf nd == Dummy do SI_Null nm
		)
		
		if flattenHierarchy.checked then (
			format "}\n\n"
			for child in nd.children do SI_Model child
		) else (
			for child in nd.children do SI_Model child
			format "}\n\n"
		)
	)
	
	fn SI_EnvelopeList=(
		if pointWeights.checked do (		
			local envObjs = for obj in $* where \
				(undefined != obj.modifiers[#skin]) collect obj
			local nEnvelopes = 0
			for obj in envObjs do nEnvelopes += (skinOps.getNumberBones obj.skin)
			
			format "SI_EnvelopeList % {\n%,\n" sceneName nEnvelopes
			max modify mode
			--unfreeze envObjs
			for obj in envObjs do (
				--select obj
				modPanel.setCurrentObject obj.skin
				
				for i = 1 to (skinOps.getNumberBones obj.skin) do (
					-- Loop overall vertices to see which vertices are
					-- affected by the current bone.
					local verts = #()
					for j = 1 to skinOps.getNumberVertices obj.skin do \
						join verts (for k = 1 to skinOps.getVertexWeightCount \
							obj.skin j \
							where i == skinOps.getVertexWeightBoneID \
							obj.skin j k collect j)
					
					format "SI_Envelope % {\n\"MDL-%\",\n\"MDL-%\",\n%,\n" \
						(trim obj.name) \
						(trim obj.name) \
						(trim (skinOps.getBoneName obj.skin i 0)) \
						verts.count
					
					-- For each affected vertex get the weight
					-- of the current bone.
					for j in verts do (
						local weight = 0
						for k = 1 to skinOps.getVertexWeightCount obj.skin j \
							where i == skinOps.getVertexWeightBoneID \
								obj.skin j k do \
								weight = 100 * skinOps.getVertexWeight \
								obj.skin j k
						
						format "%,%,\n" (j-1) weight
					)
					
					format "}\n\n"
				)
			)
			format "}\n\n"
		)
	)
	
	on okButton pressed do (
		clearListener()
		format "xsi 0300txt 0032\n\n"
		SI_FileInfo()
		SI_Scene()
		SI_CoordinateSystem()
		SI_Angle()
		SI_Ambience()
		SI_MaterialLibrary()
		for nd in rootNode.children do SI_Model nd
		SI_EnvelopeList()
	)
	
	on cancel pressed do closeRolloutFloater xsiExporter
)

if xsiExporter != undefined do closeRolloutFloater xsiExporter
global xsiExporter = newRolloutFloater "XSI Export" 467 319
addRollout XSIExport xsiExporter