fn generateJKHierarchy =
(
	if( ($bolt_l_leg_* != undefined) and ($l_leg_* != undefined) ) then
	(
		l_leg_array = $bolt_l_leg* as array
		l_leg_array += $l_leg_* as array
		for i in 1 to l_leg_array.count do
		(
			l_leg_array[i].parent = $l_leg
		)
	)
	if( ($bolt_r_leg_* != undefined) and ($r_leg_* != undefined) ) then
	(
		r_leg_array = $bolt_r_leg* as array
		r_leg_array += $r_leg_* as array
		for i in 1 to r_leg_array.count do
		(
			r_leg_array[i].parent = $r_leg
		)
	)
	if( ($bolt_l_hand_* != undefined) and ($l_hand_* != undefined) ) then
	(
		l_hand_array = $bolt_l_hand* as array
		l_hand_array += $l_hand_* as array
		for i in 1 to l_hand_array.count do
		(
			l_hand_array[i].parent = $l_hand
		)
	)
	if( ($bolt_r_hand_* != undefined) and ($r_hand_* != undefined) ) then
	(
		r_hand_array = $bolt_r_hand* as array
		r_hand_array += $r_hand_* as array
		for i in 1 to r_hand_array.count do
		(
			r_hand_array[i].parent = $r_hand
		)
	)
	if( ($bolt_head_* != undefined) and ($head_* != undefined) ) then
	(
		head_array = $bolt_head* as array
		head_array += $head_* as array
		for i in 1 to head_array.count do
		(
			head_array[i].parent = $head
		)
	)
	if( ($bolt_l_arm_* != undefined) and ($l_arm_* != undefined) and ($l_hand != undefined ) ) then
	(
		l_arm_array = $bolt_l_arm* as array
		l_arm_array += $l_arm_* as array
		--l_arm_array += $l_hand_* as array
		append l_arm_array $l_hand
		for i in 1 to l_arm_array.count do
		(
			l_arm_array[i].parent = $l_arm
		)
	)
	if( ($bolt_r_arm_* != undefined) and ($r_arm_* != undefined) and ($r_hand != undefined ) ) then
	(
		r_arm_array = $bolt_r_arm* as array
		r_arm_array += $r_arm_* as array
		--r_arm_array += $r_hand as array
		append r_arm_array $r_hand
		for i in 1 to r_arm_array.count do
		(
			r_arm_array[i].parent = $r_arm
		)
	)
	if( ($bolt_torso_* != undefined) and ($torso_* != undefined) and ($head != undefined ) and ($l_arm != undefined ) and ($r_arm != undefined ) ) then
	(
		torso_array = $bolt_torso* as array
		torso_array += $torso_* as array
		--torso_array += $head --as array
		--torso_array += $l_arm --as array
		--torso_array += $r_arm --as array
		append torso_array $head
		append torso_array $l_arm
		append torso_array $r_arm
		for i in 1 to torso_array.count do
		(
			torso_array[i].parent = $torso
		)
	)
	if( ($bolt_hips_* != undefined) and ($hips_* != undefined) and ($l_leg != undefined ) and ($r_leg != undefined ) and ($torso != undefined ) ) then
	(
		hips_array = $bolt_hips* as array
		hips_array += $hips_* as array
		--hips_array += $l_leg as array
		--hips_array += $r_leg as array
		--hips_array += $torso as array
		append hips_array $l_leg
		append hips_array $r_leg
		append hips_array $torso
		for i in 1 to hips_array.count do
		(
			hips_array[i].parent = $hips
		)
	)
	if( $hips != undefined ) then
	(
		$hips.parent = $stupidtriangle_off
	)
	$stupidtriangle_off.parent = $mesh_root
	try
	(
		$bolt_back.parent   = $torso
		$bolt_chestg.parent = $torso
		$bolt_hip_bl.parent = $torso
		$bolt_hip_br.parent = $torso
		$bolt_hip_fl.parent = $torso
		$bolt_hip_fr.parent = $torso
		$bolt_hip_l.parent  = $torso
		$bolt_hip_r.parent  = $torso
		$bolt_lchest_l.parent = $torso
		$bolt_lchest_r.parent = $torso
		$bolt_shldr_l.parent = $torso
		$bolt_shldr_r.parent = $torso
		$bolt_uchest_l.parent = $torso
		$bolt_uchest_r.parent = $torso
	) catch (
	)
	messageBox "Generated the playermodel's hierarchy.\n" title:"Process finished" beep:false
)

generateJKHierarchy()

















