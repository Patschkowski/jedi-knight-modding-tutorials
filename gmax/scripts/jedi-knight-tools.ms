utility jediKnightTools "Jedi Knight Tools"
rolledUp: false
silentErrors: false
(
	button createJK2SkeletonButton   "Jedi Outcast Skeleton"   width: 120 align:#center
	button createJKASkeletonButton   "Jedi Academy Skeleton"   width: 120 align:#center
	button generateJKHierarchyButton "Playermodel Hierarchy"   width: 120 align:#center offset:[0,10]
	button xsiExportButton           "XSI Export"              width: 120 align:#center offset:[0,10]
	on createJK2SkeletonButton pressed do
	(
		--createJK2Skeleton()
		fileIn "create-skeleton-jk2.ms"
		max utility mode
	)
	on createJKASkeletonButton pressed do
	(
		--createJKASkeleton()
		fileIn "create-skeleton-jka.ms"
		max utility mode
	)
	on generateJKHierarchyButton pressed do
	(
		--generateJKHierarchy()
		fileIn "link-hierarchy-jk.ms"
	)
	on xsiExportButton pressed do
	(
		fileIn "vmdexp.ms"
	)
)
/*rollout jediKnightToolsRollout "Jedi Knight Tools"
rolledUp: false
silentErrors: false
(
	button createJK2SkeletonButton   "Create Jedi Outcast Skeleton"   width: 180 align:#center
	button createJKASkeletonButton   "Create Jedi Academy Skeleton"   width: 180 align:#center
	button generateJKHierarchyButton "Generate Playermodel Hierarchy" width: 180 align:#center offset:[0,10]
	button xsiExportButton           "XSI Export"                     width: 180 align:#center offset:[0,10]
	on createJK2SkeletonButton pressed do
	(
		--createJK2Skeleton()
		fileIn "createJK2skeleton.ms"
	)
	on createJKASkeletonButton pressed do
	(
		--createJKASkeleton()
		fileIn "createJKAskeleton.ms"
	)
	on generateJKHierarchyButton pressed do
	(
		--generateJKHierarchy()
		fileIn "generateJKHierarchy.ms"
	)
	on xsiExportButton pressed do
	(
		fileIn "vmdexp.ms"
	)
)
if( jediKnightTools != undefined ) then
(
	closeRolloutFloater jediKnightTools
)
gmaxWindow = getMAXWindowSize()
gmaxWindowWidth  = gmaxWindow.x
gmaxWindowHeight = gmaxWindow.y
horizontalPosition = (((gmaxWindowWidth - 250)/2) as Integer)
if( horizontalPosition < 0 ) then
(
	horizontalPosition = 0
)
verticalPosition = (((gmaxWindowHeight - 193)/2) as Integer)
if( verticalPosition < 0 ) then
(
	verticalPosition = 0
)
jediKnightTools = newRolloutFloater "Jedi Knight Tools" 250 193 horizontalPosition verticalPosition
addRollout jediKnightToolsRollout jediKnightTools*/