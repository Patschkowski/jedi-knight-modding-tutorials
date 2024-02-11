fn createJK2Skeleton = 
(
	-- model_root
	model_root = dummy name:"model_root" pos:[0,0,0]
	model_root.boxsize = [0.02,0.02,0.02]
	-- mesh_root
	mesh_root = dummy name:"mesh_root" pos:[0,0,0]
	mesh_root.boxsize = [0.02,0.02,0.02]
	mesh_root.parent  = model_root
	-- skeleton_root
	skeleton_root = dummy name:"skeleton_root" pos:[0,0,0]
	skeleton_root.boxsize = [0.02,0.02,0.02]
	skeleton_root.parent  = model_root
	-- pelvis
	pelvis = boneSys.createBone [-1.3e-005,0.601804,55.6041] [-1.30171e-005,0.601804,58.1794] [-1.30171e-005,0.601804,58.1794]
	pelvis.name   = "pelvis"
	pelvis.width  = 1
	pelvis.height = 1
	pelvis.parent = skeleton_root
	-- lfemurYZ
	lfemurYZ = boneSys.createBone [5.64399,-0.322196,55.6041] [8.61438,0.476542,44.5231] [8.61438,0.476542,44.5231]
	lfemurYZ.name   = "lfemurYZ"
	lfemurYZ.width  = 1
	lfemurYZ.height = 1
	lfemurYZ.parent = pelvis
	-- lfemurX
	lfemurX = boneSys.createBone [8.61438,0.476542,44.5231] [11.5848,1.27528,33.442] [11.5848,1.27528,33.442]
	lfemurX.name   = "lfemurX"
	lfemurX.width  = 1
	lfemurX.height = 1
	lfemurX.parent = lfemurYZ
	-- ltibia
	ltibia = boneSys.createBone [11.5848,1.27528,33.442] [17.4221,2.85566,11.6662] [17.4221,2.85566,11.6662]
	ltibia.name   = "ltibia"
	ltibia.width  = 1
	ltibia.height = 1
	ltibia.parent = lfemurX
	-- ltalus
	ltalus = boneSys.createBone [17.4221,2.85566,11.6662] [18.7506,-3.98449,6.62562] [18.7506,-3.98449,6.62562]
	ltalus.name   = "ltalus"
	ltalus.width  = 1
	ltalus.height = 1
	ltalus.parent = ltibia
	-- ltarsal
	ltarsal = boneSys.createBone [18.7506,-3.98449,6.62562] [18.7866,-6.97948,6.45595] [18.7866,-6.97948,6.45595]
	ltarsal.name   = "ltarsal"
	ltarsal.width  = 1
	ltarsal.height = 1
	ltarsal.parent = ltalus
	-- lleg_eff
	lleg_eff = boneSys.createBone [18.7866,-6.97948,6.45595] [18.7986,-7.9778,6.3994] [18.7986,-7.9778,6.3994]
	lleg_eff.name   = "lleg_eff"
	lleg_eff.width  = 1
	lleg_eff.height = 1
	lleg_eff.parent = ltarsal
	-- rfemurYZ
	rfemurYZ = boneSys.createBone [-5.64401,-0.322196,55.6041] [-8.61438,0.479233,44.5232] [-8.61438,0.479233,44.5232]
	rfemurYZ.name   = "rfemurYZ"
	rfemurYZ.width  = 1
	rfemurYZ.height = 1
	rfemurYZ.parent = pelvis
	-- rfemurX
	rfemurX = boneSys.createBone [-8.61438,0.479233,44.5232] [-11.5847,1.28066,33.4424] [-11.5847,1.28066,33.4424]
	rfemurX.name   = "rfemurX"
	rfemurX.width  = 1
	rfemurX.height = 1
	rfemurX.parent = rfemurYZ
	-- rtibia
	rtibia = boneSys.createBone [-11.5847,1.28066,33.4424] [-17.4221,2.85564,11.6662] [-17.4221,2.85564,11.6662]
	rtibia.name   = "rtibia"
	rtibia.width  = 1
	rtibia.height = 1
	rtibia.parent = rfemurX
	-- rtalus
	rtalus = boneSys.createBone [-17.4221,2.85564,11.6662] [-18.7502,-3.98574,6.62716] [-18.7502,-3.98574,6.62716]
	rtalus.name   = "rtalus"
	rtalus.width  = 1
	rtalus.height = 1
	rtalus.parent = rtibia
	-- rtarsal
	rtarsal = boneSys.createBone [-18.7502,-3.98574,6.62716] [-18.786,-6.98075,6.45818] [-18.786,-6.98075,6.45818]
	rtarsal.name   = "rtarsal"
	rtarsal.width  = 1
	rtarsal.height = 1
	rtarsal.parent = rtalus
	-- rleg_eff
	rleg_eff = boneSys.createBone [-18.786,-6.98075,6.45818] [-18.7979,-7.97913,6.40173] [-18.7979,-7.97913,6.40173]
	rleg_eff.name   = "rleg_eff"
	rleg_eff.width  = 1
	rleg_eff.height = 1
	rleg_eff.parent = rtarsal
	-- Motion
	Motion = boneSys.createBone [0,0.601804,56.9053] [1,0.601804,56.9053] [1,0.601804,56.9053]
	Motion.name   = "Motion"
	Motion.width  = 1
	Motion.height = 1
	Motion.parent = pelvis
	-- Motion_eff
	Motion_eff = boneSys.createBone [1,0.601804,56.9053] [2,0.601804,56.9053] [2,0.601804,56.9053]
	Motion_eff.name   = "Motion_eff"
	Motion_eff.width  = 1
	Motion_eff.height = 1
	Motion_eff.parent = Motion
	-- lower_lumbar
	lower_lumbar = boneSys.createBone [-1.32682e-005,0.601806,64.6041] [-1.35066e-005,0.601808,72.6041] [-1.35066e-005,0.601808,72.6041]
	lower_lumbar.name   = "lower_lumbar"
	lower_lumbar.width  = 1
	lower_lumbar.height = 1
	lower_lumbar.parent = pelvis
	-- upper_lumbar
	upper_lumbar = boneSys.createBone [-1.35066e-005,0.601808,72.6041] [-1.37451e-005,0.60181,80.6041] [-1.37451e-005,0.60181,80.6041]
	upper_lumbar.name   = "upper_lumbar"
	upper_lumbar.width  = 1
	upper_lumbar.height = 1
	upper_lumbar.parent = lower_lumbar
	-- thoracic
	thoracic = boneSys.createBone [-1.37451e-005,0.60181,80.6041] [-1.38727e-005,0.601811,86.3148] [-1.38727e-005,0.601811,86.3148]
	thoracic.name   = "thoracic"
	thoracic.width  = 1
	thoracic.height = 1
	thoracic.parent = upper_lumbar
	-- lclavical
	lclavical = boneSys.createBone [-1.38811e-005,0.601811,85.1702] [9.25443,1.77092,85.1702] [9.25443,1.77092,85.1702]
	lclavical.name   = "lclavical"
	lclavical.width  = 1
	lclavical.height = 1
	lclavical.parent = thoracic
	-- lhumerus
	lhumerus = boneSys.createBone [9.25443,1.77092,85.1702] [14.9291,1.62232,78.8436] [14.9291,1.62232,78.8436]
	lhumerus.name   = "lhumerus"
	lhumerus.width  = 1
	lhumerus.height = 1
	lhumerus.parent = lclavical
	-- lhumerusX
	lhumerusX = boneSys.createBone [14.9291,1.62232,78.8436] [20.6037,1.47372,72.5169] [20.6037,1.47372,72.5169]
	lhumerusX.name    = "lhumerusX"
	lhumerusX.width  = 1
	lhumerusX.height = 1
	lhumerusX.parent = lhumerus
	-- lradius
	lradius = boneSys.createBone [20.6037,1.47372,72.5169] [25.1467,0.979318,67.441] [25.1467,0.979318,67.441]
	lradius.name   = "lradius"
	lradius.width  = 1
	lradius.height = 1
	lradius.parent = lhumerusX
	-- lradiusX
	lradiusX = boneSys.createBone [25.1467,0.979318,67.441] [29.6897,0.484915,62.365] [29.6897,0.484915,62.365]
	lradiusX.name   = "lradiusX"
	lradiusX.width  = 1
	lradiusX.height = 1
	lradiusX.parent = lradius
	-- lhand
	lhand = boneSys.createBone [29.6897,0.484915,62.365] [31.9212,-0.140114,59.322] [31.9212,-0.140114,59.322]
	lhand.name   = "lhand"
	lhand.width  = 1
	lhand.height = 1
	lhand.parent = lradiusX
	-- rclavical
	rclavical = boneSys.createBone [-1.38811e-005,0.601811,85.1702] [-9.25446,1.77092,85.1702] [-9.25446,1.77092,85.1702]
	rclavical.name   = "rclavical"
	rclavical.width  = 1
	rclavical.height = 1
	rclavical.parent = thoracic
	-- rhumerus
	rhumerus = boneSys.createBone [-9.25446,1.77092,85.1702] [-14.9291,1.62233,78.8436] [-14.9291,1.62233,78.8436]
	rhumerus.name   = "rhumerus"
	rhumerus.width  = 1
	rhumerus.height = 1
	rhumerus.parent = rclavical
	-- rhumerusX
	rhumerusX = boneSys.createBone [-14.9291,1.62233,78.8436] [-20.6037,1.47373,72.5169] [-20.6037,1.47373,72.5169]
	rhumerusX.name   = "rhumerusX"
	rhumerusX.width  = 1
	rhumerusX.height = 1
	rhumerusX.parent = rhumerus
	-- rradius
	rradius = boneSys.createBone [-20.6037,1.47373,72.5169] [-25.1467,0.979329,67.441] [-25.1467,0.979329,67.441]
	rradius.name   = "rradius"
	rradius.width  = 1
	rradius.height = 1
	rradius.parent = rhumerusX
	-- rradiusX
	rradiusX = boneSys.createBone [-25.1467,0.979329,67.441] [-29.6898,0.484928,62.365] [-29.6898,0.484928,62.365]
	rradiusX.name   = "rradiusX"
	rradiusX.width  = 1
	rradiusX.height = 1
	rradiusX.parent = rradius
	-- rhand
	rhand = boneSys.createBone [-29.6898,0.484928,62.365] [-31.921,-0.140095,59.322] [-31.921,-0.140095,59.322]
	rhand.name   = "rhand"
	rhand.width  = 1
	rhand.height = 1
	rhand.parent = rradiusX
	-- cervical
	cervical = boneSys.createBone [-1.39835e-005,0.601811,88.6041] [-1.41182e-005,0.601812,93.1241] [-1.41182e-005,0.601812,93.1241]
	cervical.name   = "cervical"
	cervical.width  = 1
	cervical.height = 1
	cervical.parent = thoracic
	-- cranium
	cranium = boneSys.createBone [-1.41182e-005,0.601812,93.1241] [0.0539063,0.601813,96.2127] [0.0539063,0.601813,96.2127]
	cranium.name   = "cranium"
	cranium.width  = 1
	cranium.height = 1
	cranium.parent = cervical
	-- spine_eff
	spine_eff = boneSys.createBone [0.0697959,0.601805,97.1235] [0.0872448,0.601805,98.1233] [0.0872448,0.601805,98.1233]
	spine_eff.name   = "spine_eff"
	spine_eff.width  = 1
	spine_eff.height = 1
	spine_eff.parent = cranium
	-- larm_eff
	larm_eff = boneSys.createBone [31.4398,-0.00531004,59.9782] [32.0232,-0.168738,59.1826] [32.0232,-0.168738,59.1826]
	larm_eff.name   = "larm_eff"
	larm_eff.width  = 1
	larm_eff.height = 1
	larm_eff.parent = lhand
	-- l_d1_j1
	l_d1_j1 = boneSys.createBone [29.8517,-0.998676,61.2874] [29.6818,-2.12699,59.176] [29.6818,-2.12699,59.176]
	l_d1_j1.name   = "l_d1_j1"
	l_d1_j1.width  = 1
	l_d1_j1.height = 1
	l_d1_j1.parent = lhand
	-- l_d1_j2
	l_d1_j2 = boneSys.createBone [29.6818,-2.12699,59.176] [30.1072,-2.43375,57.1426] [30.1072,-2.43375,57.1426]
	l_d1_j2.name   = "l_d1_j2"
	l_d1_j2.width  = 1
	l_d1_j2.height = 1
	l_d1_j2.parent = l_d1_j1
	-- l_d1_j3
	l_d1_j3 = boneSys.createBone [30.1072,-2.43375,57.1426] [30.5746,-2.59245,55.2044] [30.5746,-2.59245,55.2044]
	l_d1_j3.name   = "l_d1_j3"
	l_d1_j3.width  = 1
	l_d1_j3.height = 1
	l_d1_j3.parent = l_d1_j2
	-- ld1_eff
	ld1_eff = boneSys.createBone [30.5746,-2.59245,55.2044] [30.8082,-2.67181,54.2354] [30.8082,-2.67181,54.2354]
	ld1_eff.name   = "ld1_eff"
	ld1_eff.width  = 1
	ld1_eff.height = 1
	ld1_eff.parent = l_d1_j3
	-- l_d2_j1
	l_d2_j1 = boneSys.createBone [32.7965,-1.47547,58.3907] [32.4736,-1.8124,56.3945] [32.4736,-1.8124,56.3945]
	l_d2_j1.name   = "l_d2_j1"
	l_d2_j1.width  = 1
	l_d2_j1.height = 1
	l_d2_j1.parent = lhand
	-- l_d2_j2
	l_d2_j2 = boneSys.createBone [32.4736,-1.8124,56.3945] [31.9964,-2.00657,55.1143] [31.9964,-2.00657,55.1143]
	l_d2_j2.name   = "l_d2_j2"
	l_d2_j2.width  = 1
	l_d2_j2.height = 1
	l_d2_j2.parent = l_d2_j1
	-- l_d2_j3
	l_d2_j3 = boneSys.createBone [31.9964,-2.00657,55.1143] [31.6346,-2.15976,54.1947] [31.6346,-2.15976,54.1947]
	l_d2_j3.name   = "l_d2_j3"
	l_d2_j3.width  = 1
	l_d2_j3.height = 1
	l_d2_j3.parent = l_d2_j2
	-- ld2_eff
	ld2_eff = boneSys.createBone [31.6346,-2.15976,54.1947] [31.2728,-2.31298,53.2751] [31.2728,-2.31298,53.2751]
	ld2_eff.name   = "ld2_eff"
	ld2_eff.width  = 1
	ld2_eff.height = 1
	ld2_eff.parent = l_d2_j3
	-- l_d3_j1
	l_d3_j1 = boneSys.createBone [32.9667,-0.44679,58.1594] [32.5191,-0.717878,55.8582] [32.5191,-0.717878,55.8582]
	l_d3_j1.name   = "l_d3_j1"
	l_d3_j1.width  = 1
	l_d3_j1.height = 1
	l_d3_j1.parent = lhand
	-- l_d3_j2
	l_d3_j2 = boneSys.createBone [32.5191,-0.717878,55.8582] [31.3323,-0.850263,54.6765] [31.3323,-0.850263,54.6765]
	l_d3_j2.name   = "l_d3_j2"
	l_d3_j2.width  = 1
	l_d3_j2.height = 1
	l_d3_j2.parent = l_d3_j1
	-- l_d3_j3
	l_d3_j3 = boneSys.createBone [31.3323,-0.850263,54.6765] [30.4769,-0.865523,54.2878] [30.4769,-0.865523,54.2878]
	l_d3_j3.name   = "l_d3_j3"
	l_d3_j3.width  = 1
	l_d3_j3.height = 1
	l_d3_j3.parent = l_d3_j2
	-- ld3_eff
	ld3_eff = boneSys.createBone [30.4769,-0.865523,54.2878] [29.5667,-0.881779,53.8742] [29.5667,-0.881779,53.8742]
	ld3_eff.name   = "ld3_eff"
	ld3_eff.width  = 1
	ld3_eff.height = 1
	ld3_eff.parent = l_d3_j3
	-- l_d4_j1
	l_d4_j1 = boneSys.createBone [32.8586,0.594565,58.0519] [32.191,0.510376,56.1897] [32.191,0.510376,56.1897]
	l_d4_j1.name   = "l_d4_j1"
	l_d4_j1.width  = 1
	l_d4_j1.height = 1
	l_d4_j1.parent = lhand
	-- l_d4_j2
	l_d4_j2 = boneSys.createBone [32.191,0.510376,56.1897] [31.0055,0.393491,55.3456] [31.0055,0.393491,55.3456]
	l_d4_j2.name   = "l_d4_j2"
	l_d4_j2.width  = 1
	l_d4_j2.height = 1
	l_d4_j2.parent = l_d4_j1
	-- l_d4_j3
	l_d4_j3 = boneSys.createBone [31.0055,0.393491,55.3456] [30.1411,0.330779,54.8543] [30.1411,0.330779,54.8543]
	l_d4_j3.name   = "l_d4_j3"
	l_d4_j3.width  = 1
	l_d4_j3.height = 1
	l_d4_j3.parent = l_d4_j2
	-- ld4_eff
	ld4_eff = boneSys.createBone [30.1411,0.330779,54.8543] [29.2736,0.267828,54.3611] [29.2736,0.267828,54.3611]
	ld4_eff.name   = "ld4_eff"
	ld4_eff.width  = 1
	ld4_eff.height = 1
	ld4_eff.parent = l_d4_j3
	-- mc5
	mc5 = boneSys.createBone [30.954,1.65819,60.7393] [32.2978,1.78763,58.0603] [32.2978,1.78763,58.0603]
	mc5.name   = "mc5"
	mc5.width  = 1
	mc5.height = 1
	mc5.parent = lhand
	-- l_d5_j1
	l_d5_j1 = boneSys.createBone [32.2978,1.78763,58.0603] [31.702,1.74526,56.5976] [31.702,1.74526,56.5976]
	l_d5_j1.name   = "l_d5_j1"
	l_d5_j1.width  = 1
	l_d5_j1.height = 1
	l_d5_j1.parent = mc5
	-- l_d5_j2
	l_d5_j2 = boneSys.createBone [31.702,1.74526,56.5976] [30.9609,1.57234,55.8741] [30.9609,1.57234,55.8741]
	l_d5_j2.name   = "l_d5_j2"
	l_d5_j2.width  = 1
	l_d5_j2.height = 1
	l_d5_j2.parent = l_d5_j1
	-- l_d5_j3
	l_d5_j3 = boneSys.createBone [30.9609,1.57234,55.8741] [30.144,1.35209,55.6526] [30.144,1.35209,55.6526]
	l_d5_j3.name   = "l_d5_j3"
	l_d5_j3.width  = 1
	l_d5_j3.height = 1
	l_d5_j3.parent = l_d5_j2
	-- ld5_eff
	ld5_eff = boneSys.createBone [30.144,1.35209,55.6526] [29.2099,1.10024,55.3994] [29.2099,1.10024,55.3994]
	ld5_eff.name   = "ld5_eff"
	ld5_eff.width  = 1
	ld5_eff.height = 1
	ld5_eff.parent = l_d5_j3
	-- lhang_tag_bone
	lhang_tag_bone = boneSys.createBone [31.3692,-0.171098,57.7313] [34.1101,0.19451,58.8948] [34.1101,0.19451,58.8948]
	lhang_tag_bone.name   = "lhang_tag_bone"
	lhang_tag_bone.width  = 1
	lhang_tag_bone.height = 1
	lhang_tag_bone.parent = lhand
	-- lhand_tag_eff
	lhand_tag_eff = boneSys.createBone [34.1101,0.19451,58.8948] [35.0238,0.316297,59.2826] [35.0238,0.316297,59.2826]
	lhand_tag_eff.name   = "lhand_tag_eff"
	lhand_tag_eff.width  = 1
	lhand_tag_eff.height = 1
	lhand_tag_eff.parent = lhang_tag_bone
	-- rarm_eff
	rarm_eff = boneSys.createBone [-31.4398,-0.00530147,59.9782] [-32.0232,-0.168746,59.1826] [-32.0232,-0.168746,59.1826]
	rarm_eff.name   = "rarm_eff"
	rarm_eff.width  = 1
	rarm_eff.height = 1
	rarm_eff.parent = rhand
	-- r_d1_j1
	r_d1_j1 = boneSys.createBone [-29.8517,-0.998661,61.2874] [-29.6818,-2.12698,59.176] [-29.6818,-2.12698,59.176]
	r_d1_j1.name   = "r_d1_j1"
	r_d1_j1.width  = 1
	r_d1_j1.height = 1
	r_d1_j1.parent = rhand
	-- r_d1_j2
	r_d1_j2 = boneSys.createBone [-29.6818,-2.12698,59.176] [-30.1072,-2.43373,57.1426] [-30.1072,-2.43373,57.1426]
	r_d1_j2.name   = "r_d1_j2"
	r_d1_j2.width  = 1
	r_d1_j2.height = 1
	r_d1_j2.parent = r_d1_j1
	-- r_d1_j3
	r_d1_j3 = boneSys.createBone [-30.1072,-2.43373,57.1426] [-30.5749,-2.59247,55.2045] [-30.5749,-2.59247,55.2045]
	r_d1_j3.name   = "r_d1_j3"
	r_d1_j3.width  = 1
	r_d1_j3.height = 1
	r_d1_j3.parent = r_d1_j2
	-- rd_eff
	rd_eff = boneSys.createBone [-30.5749,-2.59247,55.2045] [-30.8087,-2.67183,54.2355] [-30.8087,-2.67183,54.2355]
	rd_eff.name   = "rd_eff"
	rd_eff.width  = 1
	rd_eff.height = 1
	rd_eff.parent = r_d1_j3
	-- r_d2_j1
	r_d2_j1 = boneSys.createBone [-32.7965,-1.47545,58.3907] [-32.4736,-1.81238,56.3945] [-32.4736,-1.81238,56.3945]
	r_d2_j1.name   = "r_d2_j1"
	r_d2_j1.width  = 1
	r_d2_j1.height = 1
	r_d2_j1.parent = rhand
	-- r_d2_j2
	r_d2_j2 = boneSys.createBone [-32.4736,-1.81238,56.3945] [-31.9964,-2.00656,55.1143] [-31.9964,-2.00656,55.1143]
	r_d2_j2.name   = "r_d2_j2"
	r_d2_j2.width  = 1
	r_d2_j2.height = 1
	r_d2_j2.parent = r_d2_j1
	-- r_d2_j3
	r_d2_j3 = boneSys.createBone [-31.9964,-2.00656,55.1143] [-31.6346,-2.15974,54.1947] [-31.6346,-2.15974,54.1947]
	r_d2_j3.name   = "r_d2_j3"
	r_d2_j3.width  = 1
	r_d2_j3.height = 1
	r_d2_j3.parent = r_d2_j2
	-- rd2_eff
	rd2_eff = boneSys.createBone [-31.6346,-2.15974,54.1947] [-31.2728,-2.31292,53.2751] [-31.2728,-2.31292,53.2751]
	rd2_eff.name   = "rd2_eff"
	rd2_eff.width  = 1
	rd2_eff.height = 1
	rd2_eff.parent = r_d2_j3
	-- r_d3_j1
	r_d3_j1 = boneSys.createBone [-32.9667,-0.446775,58.1594] [-32.5191,-0.717859,55.8582] [-32.5191,-0.717859,55.8582]
	r_d3_j1.name   = "r_d3_j1"
	r_d3_j1.width  = 1
	r_d3_j1.height = 1
	r_d3_j1.parent = rhand
	-- r_d3_j2
	r_d3_j2 = boneSys.createBone [-32.5191,-0.717859,55.8582] [-31.3323,-0.850242,54.6765] [-31.3323,-0.850242,54.6765]
	r_d3_j2.name   = "r_d3_j2"
	r_d3_j2.width  = 1
	r_d3_j2.height = 1
	r_d3_j2.parent = r_d3_j1
	-- r_d3_j3
	r_d3_j3 = boneSys.createBone [-31.3323,-0.850242,54.6765] [-30.422,-0.866482,54.2629] [-30.422,-0.866482,54.2629]
	r_d3_j3.name   = "r_d3_j3"
	r_d3_j3.width  = 1
	r_d3_j3.height = 1
	r_d3_j3.parent = r_d3_j2
	-- rd3_eff
	rd3_eff = boneSys.createBone [-30.422,-0.866482,54.2629] [-29.5117,-0.88272,53.8492] [-29.5117,-0.88272,53.8492]
	rd3_eff.name   = "rd3_eff"
	rd3_eff.width  = 1
	rd3_eff.height = 1
	rd3_eff.parent = r_d3_j3
	-- r_d4_j1
	r_d4_j1 = boneSys.createBone [-32.8586,0.594581,58.0519] [-32.191,0.510396,56.1897] [-32.191,0.510396,56.1897]
	r_d4_j1.name   = "r_d4_j1"
	r_d4_j1.width  = 1
	r_d4_j1.height = 1
	r_d4_j1.parent = rhand
	-- r_d4_j2
	r_d4_j2 = boneSys.createBone [-32.191,0.510396,56.1897] [-31.0055,0.393513,55.3456] [-31.0055,0.393513,55.3456]
	r_d4_j2.name   = "r_d4_j2"
	r_d4_j2.width  = 1
	r_d4_j2.height = 1
	r_d4_j2.parent = r_d4_j1
	-- r_d4_j3
	r_d4_j3 = boneSys.createBone [-31.0055,0.393513,55.3456] [-30.1378,0.330561,54.8524] [-30.1378,0.330561,54.8524]
	r_d4_j3.name   = "r_d4_j3"
	r_d4_j3.width  = 1
	r_d4_j3.height = 1
	r_d4_j3.parent = r_d4_j2
	-- rd4_eff
	rd4_eff = boneSys.createBone [-30.1378,0.330561,54.8524] [-29.2703,0.267616,54.3592] [-29.2703,0.267616,54.3592]
	rd4_eff.name   = "rd4_eff"
	rd4_eff.width  = 1
	rd4_eff.height = 1
	rd4_eff.parent = r_d4_j3
	-- mc7
	mc7 = boneSys.createBone [-30.954,1.65821,60.7393] [-32.2978,1.78765,58.0603] [-32.2978,1.78765,58.0603]
	mc7.name   = "mc7"
	mc7.width  = 1
	mc7.height = 1
	mc7.parent = rhand
	-- r_d5_j1
	r_d5_j1 = boneSys.createBone [-32.2978,1.78765,58.0603] [-31.702,1.74528,56.5976] [-31.702,1.74528,56.5976]
	r_d5_j1.name   = "r_d5_j1"
	r_d5_j1.width  = 1
	r_d5_j1.height = 1
	r_d5_j1.parent = mc7
	-- r_d5_j2
	r_d5_j2 = boneSys.createBone [-31.702,1.74528,56.5976] [-30.9609,1.57236,55.8741] [-30.9609,1.57236,55.8741]
	r_d5_j2.name   = "r_d5_j2"
	r_d5_j2.width  = 1
	r_d5_j2.height = 1
	r_d5_j2.parent = r_d5_j1
	-- r_d5_j3
	r_d5_j3 = boneSys.createBone [-30.9609,1.57236,55.8741] [-30.0269,1.32054,55.6209] [-30.0269,1.32054,55.6209]
	r_d5_j3.name   = "r_d5_j3"
	r_d5_j3.width  = 1
	r_d5_j3.height = 1
	r_d5_j3.parent = r_d5_j2
	-- rd5_eff
	rd5_eff = boneSys.createBone [-30.0269,1.32054,55.6209] [-29.0928,1.06871,55.3677] [-29.0928,1.06871,55.3677]
	rd5_eff.name   = "rd5_eff"
	rd5_eff.width  = 1
	rd5_eff.height = 1
	rd5_eff.parent = r_d5_j3
	-- rhang_tag_bone
	rhang_tag_bone = boneSys.createBone [-31.3692,-0.171081,57.7313] [-28.6282,-0.536688,56.5679] [-28.6282,-0.536688,56.5679]
	rhang_tag_bone.name   = "rhang_tag_bone"
	rhang_tag_bone.width  = 1
	rhang_tag_bone.height = 1
	rhang_tag_bone.parent = rhand
	-- rhang_tag_eff
	rhang_tag_eff = boneSys.createBone [-28.6282,-0.536688,56.5679] [-27.7146,-0.658557,56.1801] [-27.7146,-0.658557,56.1801]
	rhang_tag_eff.name   = "rhang_tag_eff"
	rhang_tag_eff.width  = 1
	rhang_tag_eff.height = 1
	rhang_tag_eff.parent = rhang_tag_bone
	-- ceyebrow
	ceyebrow = boneSys.createBone [0.0634473,-5.53055,98.6676] [0.0634469,-8.68043,99.5116] [0.0634469,-8.68043,99.5116]
	ceyebrow.name   = "ceyebrow"
	ceyebrow.width  = 1
	ceyebrow.height = 1
	ceyebrow.parent = cranium
	-- ceyebrow_eff
	ceyebrow_eff = boneSys.createBone [0.0634469,-8.68043,99.5116] [0.0634459,-9.82187,99.8174] [0.0634459,-9.82187,99.8174]
	ceyebrow_eff.name   = "ceyebrow_eff"
	ceyebrow_eff.width  = 1
	ceyebrow_eff.height = 1
	ceyebrow_eff.parent = ceyebrow
	-- chin
	chin = boneSys.createBone [0.0634466,-5.46429,92.1372] [0.0634453,-8.68555,91.6296] [0.0634453,-8.68555,91.6296]
	chin.name   = "chin"
	chin.width  = 1
	chin.height = 1
	chin.parent = cranium
	-- chin_eff
	chin_eff = boneSys.createBone [0.0634453,-8.68555,91.6296] [0.0634477,-9.85272,91.4457] [0.0634477,-9.85272,91.4457]
	chin_eff.name   = "chin_eff"
	chin_eff.width  = 1
	chin_eff.height = 1
	chin_eff.parent = chin
	-- cnose
	cnose = boneSys.createBone [0.0634606,-6.07404,95.7169] [0.0634607,-9.33504,95.7169] [0.0634607,-9.33504,95.7169]
	cnose.name   = "cnose"
	cnose.width  = 1
	cnose.height = 1
	cnose.parent = cranium
	-- cnose_eff
	cnose_eff = boneSys.createBone [0.0634607,-9.33504,95.7169] [0.0634596,-10.5166,95.7176] [0.0634596,-10.5166,95.7176]
	cnose_eff.name   = "cnose_eff"
	cnose_eff.width  = 1
	cnose_eff.height = 1
	cnose_eff.parent = cnose
	-- forehead
	forehead = boneSys.createBone [0.0634492,-4.89248,101.176] [0.0634473,-7.79806,102.657] [0.0634473,-7.79806,102.657]
	forehead.name   = "forehead"
	forehead.width  = 1
	forehead.height = 1
	forehead.parent = cranium
	-- forehead_eff
	forehead_eff = boneSys.createBone [0.0634473,-7.79806,102.657] [0.0634501,-8.85076,103.193] [0.0634501,-8.85076,103.193]
	forehead_eff.name   = "forehead_eff"
	forehead_eff.width  = 1
	forehead_eff.height = 1
	forehead_eff.parent = forehead
	-- jaw
	jaw = boneSys.createBone [0.0634288,-0.827941,94.9733] [0.0634269,-5.92793,91.8536] [0.0634269,-5.92793,91.8536]
	jaw.name   = "jaw"
	jaw.width  = 1
	jaw.height = 1
	jaw.parent = cranium
	-- jaw_eff
	jaw_eff = boneSys.createBone [0.0634269,-5.92793,91.8536] [0.0634256,-6.93603,91.237] [0.0634256,-6.93603,91.237]
	jaw_eff.name   = "jaw_eff"
	jaw_eff.width  = 1
	jaw_eff.height = 1
	jaw_eff.parent = jaw
	-- lblip1
	lblip1 = boneSys.createBone [0.0634444,-6.38401,93.7242] [0.890569,-6.05359,93.8039] [0.890569,-6.05359,93.8039]
	lblip1.name   = "lblip1"
	lblip1.width  = 1
	lblip1.height = 1
	lblip1.parent = cranium
	-- lblip2
	lblip2 = boneSys.createBone [0.890569,-6.05359,93.8039] [1.95532,-5.29456,93.9185] [1.95532,-5.29456,93.9185]
	lblip2.name   = "lblip2"
	lblip2.width  = 1
	lblip2.height = 1
	lblip2.parent = lblip1
	-- lblip_eff
	lblip_eff = boneSys.createBone [1.95532,-5.29456,93.9185] [2.91381,-4.61125,94.0216] [2.91381,-4.61125,94.0216]
	lblip_eff.name   = "lblip_eff"
	lblip_eff.width  = 1
	lblip_eff.height = 1
	lblip_eff.parent = lblip2
	-- lcheek
	lcheek = boneSys.createBone [2.23745,-5.20331,95.3852] [4.107878,-7.874565,95.385170] [4.107878,-7.874565,95.385170]
	lcheek.name   = "lcheek"
	lcheek.width  = 1
	lcheek.height = 1
	lcheek.parent = cranium
	-- lcheek_eff
	lcheek_eff = boneSys.createBone [4.107878,-7.874565,95.385170] [4.7856,-8.84245,95.3852] [4.7856,-8.84245,95.3852]
	lcheek_eff.name   = "lcheek_eff"
	lcheek_eff.width  = 1
	lcheek_eff.height = 1
	lcheek_eff.parent = lcheek
	-- lcheekfix
	lcheekfix = boneSys.createBone [3.32445,-4.11949,96.6829] [6.14855,-5.75,96.6829] [6.14855,-5.75,96.6829]
	lcheekfix.name   = "lcheekfix"
	lcheekfix.width  = 1
	lcheekfix.height = 1
	lcheekfix.parent = cranium
	-- lcheekfix_eff
	lcheekfix_eff = boneSys.createBone [6.14855,-5.75,96.6829] [7.17183,-6.34078,96.6829] [7.17183,-6.34078,96.6829]
	lcheekfix_eff.name   = "lcheekfix_eff"
	lcheekfix_eff.width  = 1
	lcheekfix_eff.height = 1
	lcheekfix_eff.parent = lcheekfix
	-- leyebrow3
	leyebrow3 = boneSys.createBone [0.715645,-6.06061,98.9151] [1.90904,-5.94412,98.9201] [1.90904,-5.94412,98.9201]
	leyebrow3.name   = "leyebrow3"
	leyebrow3.width  = 1
	leyebrow3.height = 1
	leyebrow3.parent = cranium
	-- leyebrow2
	leyebrow2 = boneSys.createBone [1.90904,-5.94412,98.9201] [2.90961,-4.84715,98.7654] [2.90961,-4.84715,98.7654]
	leyebrow2.name   = "leyebrow2"
	leyebrow2.width  = 1
	leyebrow2.height = 1
	leyebrow2.parent = leyebrow3
	-- leyebrow_eff
	leyebrow_eff = boneSys.createBone [2.90961,-4.84715,98.7654] [3.70158,-3.9789,98.643] [3.70158,-3.9789,98.643]
	leyebrow_eff.name   = "leyebrow_eff"
	leyebrow_eff.width  = 1
	leyebrow_eff.height = 1
	leyebrow_eff.parent = leyebrow2
	-- ljaw
	ljaw = boneSys.createBone [2.23743,-4.38233,92.4936] [0.859268,-7.27893,91.9067] [0.859268,-7.27893,91.9067]
	ljaw.name   = "ljaw"
	ljaw.width  = 1
	ljaw.height = 1
	ljaw.parent = cranium
	-- ljaw_eff
	ljaw_eff = boneSys.createBone [0.859268,-7.27893,91.9067] [0.359936,-8.32833,91.694] [0.359936,-8.32833,91.694]
	ljaw_eff.name   = "ljaw_eff"
	ljaw_eff.width  = 1
	ljaw_eff.height = 1
	ljaw_eff.parent = ljaw
	-- lnose
	lnose = boneSys.createBone [0.987397,-5.80533,95.5278] [1.55366,-9.01678,95.5278] [1.55366,-9.01678,95.5278]
	lnose.name   = "lnose"
	lnose.width  = 1
	lnose.height = 1
	lnose.parent = cranium
	-- lnose_eff
	lnose_eff = boneSys.createBone [1.55366,-9.01678,95.5278] [1.75884,-10.1804,95.5278] [1.75884,-10.1804,95.5278]
	lnose_eff.name   = "lnose_eff"
	lnose_eff.width  = 1
	lnose_eff.height = 1
	lnose_eff.parent = lnose
	-- ltlip1
	ltlip1 = boneSys.createBone [0.0634448,-6.38401,94.0836] [0.890568,-6.05294,94.0166] [0.890568,-6.05294,94.0166]
	ltlip1.name   = "ltlip1"
	ltlip1.width  = 1
	ltlip1.height = 1
	ltlip1.parent = cranium
	-- ltlip2
	ltlip2 = boneSys.createBone [0.890568,-6.05294,94.0166] [1.95515,-5.29295,93.8857] [1.95515,-5.29295,93.8857]
	ltlip2.name   = "ltlip2"
	ltlip2.width  = 1
	ltlip2.height = 1
	ltlip2.parent = ltlip1
	-- ltlip_eff
	ltlip_eff = boneSys.createBone [1.95515,-5.29295,93.8857] [2.91204,-4.60989,93.768] [2.91204,-4.60989,93.768]
	ltlip_eff.name   = "ltlip_eff"
	ltlip_eff.width  = 1
	ltlip_eff.height = 1
	ltlip_eff.parent = ltlip2
	-- nosefix
	nosefix = boneSys.createBone [0.0634536,-6.04418,97.6628] [0.0634536,-9.30518,97.6628] [0.0634536,-9.30518,97.6628]
	nosefix.name   = "nosefix"
	nosefix.width  = 1
	nosefix.height = 1
	nosefix.parent = cranium
	-- nosefix_eff
	nosefix_eff = boneSys.createBone [0.0634536,-9.30518,97.6628] [0.0634534,-10.4867,97.6628] [0.0634534,-10.4867,97.6628]
	nosefix_eff.name   = "nosefix_eff"
	nosefix_eff.width  = 1
	nosefix_eff.height = 1
	nosefix_eff.parent = nosefix
	-- rblip1
	rblip1 = boneSys.createBone [0.0634444,-6.38401,93.7242] [-0.763629,-6.05345,93.8039] [-0.763629,-6.05345,93.8039]
	rblip1.name   = "rblip1"
	rblip1.width  = 1
	rblip1.height = 1
	rblip1.parent = cranium
	-- rblip2
	rblip2 = boneSys.createBone [-0.763629,-6.05345,93.8039] [-1.82827,-5.29424,93.9183] [-1.82827,-5.29424,93.9183]
	rblip2.name   = "rblip2"
	rblip2.width  = 1
	rblip2.height = 1
	rblip2.parent = rblip1
	-- rblip_eff
	rblip_eff = boneSys.createBone [-1.82827,-5.29424,93.9183] [-2.7866,-4.61079,94.0213] [-2.7866,-4.61079,94.0213]
	rblip_eff.name   = "rblip_eff"
	rblip_eff.width  = 1
	rblip_eff.height = 1
	rblip_eff.parent = rblip2
	-- rcheek
	rcheek = boneSys.createBone [-2.11055,-5.20331,95.3852] [-3.98099,-7.87456,95.3852] [-3.98099,-7.87456,95.3852]
	rcheek.name   = "rcheek"
	rcheek.width  = 1
	rcheek.height = 1
	rcheek.parent = cranium
	-- rcheek_eff
	rcheek_eff = boneSys.createBone [-3.98099,-7.87456,95.3852] [-4.65871,-8.84245,95.3852] [-4.65871,-8.84245,95.3852]
	rcheek_eff.name   = "rcheek_eff"
	rcheek_eff.width  = 1
	rcheek_eff.height = 1
	rcheek_eff.parent = rcheek
	-- rcheekfix
	rcheekfix = boneSys.createBone [-3.19755,-4.11949,96.6829] [-6.02166,-5.74999,96.6829] [-6.02166,-5.74999,96.6829]
	rcheekfix.name   = "rcheekfix"
	rcheekfix.width  = 1
	rcheekfix.height = 1
	rcheekfix.parent = cranium
	-- rcheekfix_eff
	rcheekfix_eff = boneSys.createBone [-6.02166,-5.74999,96.6829] [-7.04493,-6.34077,96.6829] [-7.04493,-6.34077,96.6829]
	rcheekfix_eff.name   = "rcheekfix_eff"
	rcheekfix_eff.width  = 1
	rcheekfix_eff.height = 1
	rcheekfix_eff.parent = rcheekfix
	-- reyebrow1
	reyebrow1 = boneSys.createBone [-0.588755,-6.06061,98.9151] [-1.78214,-5.94401,98.9195] [-1.78214,-5.94401,98.9195]
	reyebrow1.name   = "reyebrow1"
	reyebrow1.width  = 1
	reyebrow1.height = 1
	reyebrow1.parent = cranium
	-- reyebrow2
	reyebrow2 = boneSys.createBone [-1.78214,-5.94401,98.9195] [-2.78263,-4.84764,98.7601] [-2.78263,-4.84764,98.7601]
	reyebrow2.name   = "reyebrow2"
	reyebrow2.width  = 1
	reyebrow2.height = 1
	reyebrow2.parent = reyebrow1
	-- reyebrow_eff
	reyebrow_eff = boneSys.createBone [-2.78263,-4.84764,98.7601] [-3.57452,-3.97985,98.634] [-3.57452,-3.97985,98.634]
	reyebrow_eff.name   = "reyebrow_eff"
	reyebrow_eff.width  = 1
	reyebrow_eff.height = 1
	reyebrow_eff.parent = reyebrow2
	-- rjaw
	rjaw = boneSys.createBone [-2.11057,-4.38235,92.4936] [-0.732415,-7.27895,91.9067] [-0.732415,-7.27895,91.9067]
	rjaw.name   = "rjaw"
	rjaw.width  = 1
	rjaw.height = 1
	rjaw.parent = cranium
	-- rjaw_eff
	rjaw_eff = boneSys.createBone [-0.732415,-7.27895,91.9067] [-0.233057,-8.32855,91.694] [-0.233057,-8.32855,91.694]
	rjaw_eff.name   = "rjaw_eff"
	rjaw_eff.width  = 1
	rjaw_eff.height = 1
	rjaw_eff.parent = rjaw
	-- rnose_bone
	rnose_bone = boneSys.createBone [-0.860504,-5.80533,95.5278] [-1.42677,-9.01678,95.5278] [-1.42677,-9.01678,95.5278]
	rnose_bone.name   = "rnose_bone"
	rnose_bone.width  = 1
	rnose_bone.height = 1
	rnose_bone.parent = cranium
	-- rnose_eff
	rnose_eff = boneSys.createBone [-1.42677,-9.01678,95.5278] [-1.63195,-10.1804,95.5278] [-1.63195,-10.1804,95.5278]
	rnose_eff.name   = "rnose_eff"
	rnose_eff.width  = 1
	rnose_eff.height = 1
	rnose_eff.parent = rnose_bone
	rtlip1 = boneSys.createBone [0.0634448,-6.38401,94.0836] [-0.763629,-6.05283,94.0165] [-0.763629,-6.05283,94.0165]
	rtlip1.name   = "rtlip1"
	rtlip1.width  = 1
	rtlip1.height = 1
	rtlip1.parent = cranium
	-- rtlip2
	rtlip2 = boneSys.createBone [-0.763629,-6.05283,94.0165] [-1.8281,-5.29272,93.8854] [-1.8281,-5.29272,93.8854]
	rtlip2.name   = "rtlip2"
	rtlip2.width  = 1
	rtlip2.height = 1
	rtlip2.parent = rtlip1
	-- rtlip_eff
	rtlip_eff = boneSys.createBone [-1.8281,-5.29272,93.8854] [-2.78494,-4.6095,93.7676] [-2.78494,-4.6095,93.7676]
	rtlip_eff.name   = "rtlip_eff"
	rtlip_eff.width  = 1
	rtlip_eff.height = 1
	rtlip_eff.parent = rtlip2
	-- lbeyelid
	lbeyelid = boneSys.createBone [1.77873,-4.44898,97.7772] [1.77873,-7.51332,96.6619] [1.77873,-7.51332,96.6619]
	lbeyelid.name   = "lbeyelid"
	lbeyelid.width  = 1
	lbeyelid.height = 1
	lbeyelid.parent = cranium
	-- lbeyelid_eff
	lbeyelid_eff = boneSys.createBone [1.77873,-7.51332,96.6619] [1.77873,-8.62368,96.2578] [1.77873,-8.62368,96.2578]
	lbeyelid_eff.name   = "lbeyelid_eff"
	lbeyelid_eff.width  = 1
	lbeyelid_eff.height = 1
	lbeyelid_eff.parent = lbeyelid
	-- leye
	leye = boneSys.createBone [1.77873,-4.44898,97.7772] [1.77873,-7.70998,97.7772] [1.77873,-7.70998,97.7772]
	leye.name   = "leye"
	leye.width  = 1
	leye.height = 1
	leye.parent = cranium
	-- leye_eff
	leye_eff = boneSys.createBone [1.77873,-7.70998,97.7772] [1.77872,-8.89155,97.7772] [1.77872,-8.89155,97.7772]
	leye_eff.name   = "leye_eff"
	leye_eff.width  = 1
	leye_eff.height = 1
	leye_eff.parent = leye
	-- lteyelid
	lteyelid = boneSys.createBone [1.77873,-4.44898,97.7772] [1.77873,-7.51332,98.8925] [1.77873,-7.51332,98.8925]
	lteyelid.name   = "lteyelid"
	lteyelid.width  = 1
	lteyelid.height = 1
	lteyelid.parent = cranium
	-- lteyelid_eff
	lteyelid_eff = boneSys.createBone [1.77873,-7.51332,98.8925] [1.77873,-8.62347,99.2967] [1.77873,-8.62347,99.2967]
	lteyelid_eff.name   = "lteyelid_eff"
	lteyelid_eff.width  = 1
	lteyelid_eff.height = 1
	lteyelid_eff.parent = lteyelid
	-- rbeyelid
	rbeyelid = boneSys.createBone [-1.77902,-4.44898,97.7772] [-1.77902,-7.51332,96.6619] [-1.77902,-7.51332,96.6619]
	rbeyelid.name   = "rbeyelid"
	rbeyelid.width  = 1
	rbeyelid.height = 1
	rbeyelid.parent = cranium
	-- rbeyelid_eff
	rbeyelid_eff = boneSys.createBone [-1.77902,-7.51332,96.6619] [-1.77902,-8.62379,96.2578] [-1.77902,-8.62379,96.2578]
	rbeyelid_eff.name   = "rbeyelid_eff"
	rbeyelid_eff.width  = 1
	rbeyelid_eff.height = 1
	rbeyelid_eff.parent = rbeyelid
	-- reye
	reye = boneSys.createBone [-1.77902,-4.44898,97.7772] [-1.77902,-7.70998,97.7772] [-1.77902,-7.70998,97.7772]
	reye.name   = "reye"
	reye.width  = 1
	reye.height = 1
	reye.parent = cranium
	-- reye_eff
	reye_eff = boneSys.createBone [-1.77902,-7.70998,97.7772] [-1.77903,-8.89155,97.7772] [-1.77903,-8.89155,97.7772]
	reye_eff.name   = "reye_eff"
	reye_eff.width  = 1
	reye_eff.height = 1
	reye_eff.parent = reye
	-- rteyelid
	rteyelid = boneSys.createBone [-1.77902,-4.44898,97.7772] [-1.77902,-7.51332,98.8925] [-1.77902,-7.51332,98.8925]
	rteyelid.name   = "rteyelid"
	rteyelid.width  = 1
	rteyelid.height = 1
	rteyelid.parent = cranium
	-- rteyelid_eff
	rteyelid_eff = boneSys.createBone [-1.77902,-7.51332,98.8925] [-1.77902,-8.62363,99.2967] [-1.77902,-8.62363,99.2967]
	rteyelid_eff.name   = "rteyelid_eff"
	rteyelid_eff.width  = 1
	rteyelid_eff.height = 1
	rteyelid_eff.parent = rteyelid
	
	-- stupidtriangle_off
	stupidtriangle_off = mesh vertices:#([0.516751,-3.89914,77.2993],[-0.259798,-3.89914,77.2993],[-0.259798,-2.15191,77.2993]) faces:#([2,3,1])
	stupidtriangle_off.name   = "stupidtriangle_off"
	stupidtriangle_off.pivot  = [0.063826,-3.283810,77.517433]
	stupidtriangle_off.parent = mesh_root
	-- bolt_head_eyes
	bolt_head_eyes = mesh vertices:#([0.0638291,-7.46322,94.9089],[1.01657,-7.46322,94.9089],[0.0638291,-5.36725,94.9089]) faces:#([2,1,3])
	bolt_head_eyes.name  = "bolt_head_eyes"
	bolt_head_eyes.pivot = [0.063826,-5.1339,98.5602]
	-- bolt_l_arm_elbow
	bolt_l_arm_elbow = mesh vertices:#([20.6697,2.9569,72.3948],[20.0025,2.95204,73.075],[20.6793,0.860958,72.3893]) faces:#([2,1,3])
	bolt_l_arm_elbow.name  = "bolt_l_arm_elbow"
	bolt_l_arm_elbow.pivot = [20.6958,2.92259,72.4046]
	-- bolt_l_hand
	bolt_l_hand = mesh vertices:#([31.433,-0.160104,57.7437],[32.3035,-0.0439951,58.1132],[30.5915,0.0934262,59.6465]) faces:#([2,1,3])
	bolt_l_hand.name  = "bolt_l_hand"
	bolt_l_hand.pivot = [31.433,-0.160104,57.7437]
	-- bolt_r_arm_elbow
	bolt_r_arm_elbow = mesh vertices:#([-20.7258,2.92259,72.4046],[-21.3994,2.92259,71.7309],[-20.7258,0.826617,72.4046]) faces:#([2,1,3])
	bolt_r_arm_elbow.name  = "bolt_r_arm_elbow"
	bolt_r_arm_elbow.pivot = [-20.7258,2.92259,72.4046]
	-- bolt_r_hand
	bolt_r_hand = mesh vertices:#([-31.3054,-0.160102,57.7437],[-30.4349,-0.276211,57.3742],[-30.4638,0.0934289,59.6465]) faces:#([2,1,3])
	bolt_r_hand.name  = "bolt_r_hand"
	bolt_r_hand.pivot = [-31.3054,-0.160104,57.7437]
	-- bolt_l_leg_knee
	bolt_l_leg_knee = mesh vertices:#([11.2781,-0.105162,32.8943],[12.1984,-0.105162,33.1409],[11.2781,1.99081,32.8943]) faces:#([2,1,3])
	bolt_l_leg_knee.name  = "bolt_l_leg_knee"
	bolt_l_leg_knee.pivot = [11.2781,-0.105162,32.8943]
	-- bolt_l_leg_foot
	bolt_l_leg_foot = mesh vertices:#([19.083,-1.0923,6.25763],[19.9878,-1.01764,6.54653],[18.446,-1.10005,8.25446]) faces:#([2,1,3])
	bolt_l_leg_foot.name  = "bolt_l_leg_foot"
	bolt_l_leg_foot.pivot = [19.083,-1.0923,6.25763]
	-- bolt_r_leg_knee
	bolt_r_leg_knee = mesh vertices:#([-11.1527,-0.105705,32.8949],[-10.2324,-0.105705,32.6483],[-11.1527,1.99027,32.8949]) faces:#([2,1,3])
	bolt_r_leg_knee.name  = "bolt_r_leg_knee"
	bolt_r_leg_knee.pivot = [-11.1527,-0.105705,32.8949]
	-- bolt_r_leg_foot
	bolt_r_leg_foot = mesh vertices:#([-19.0712,-1.05538,6.31033],[-18.1614,-1.12267,6.03565],[-18.4654,-1.05538,8.31684]) faces:#([2,1,3])
	bolt_r_leg_foot.name  = "bolt_r_leg_foot"
	bolt_r_leg_foot.pivot = [-19.0712,-1.05538,6.31033]
	
	-- bolt_head_front
	bolt_head_front = mesh vertices:#([0.0638264,-6.58873,93.8371],[1.01656,-6.58873,93.8371],[0.0638264,-4.49276,93.8371]) faces:#([2,1,3])
	bolt_head_front.name  = "bolt_head_front"
	bolt_head_front.pivot = [0.063827,-6.58873,93.8371]
	-- bolt_head_back
	bolt_head_back = mesh vertices:#([0.0638255,6.53814,98.9139],[-0.888912,6.53814,98.9139],[0.0638263,4.44217,98.9139]) faces:#([2,1,3])
	bolt_head_back.name  = "bolt_head_back"
	bolt_head_back.pivot = [0.063826,6.53814,98.9139]
	-- bolt_head_left
	bolt_head_left = mesh vertices:#([4.85442,-0.676646,98.7383],[4.85442,0.276091,98.7383],[2.75845,-0.676646,98.7383]) faces:#([2,1,3])
	bolt_head_left.name  = "bolt_head_left"
	bolt_head_left.pivot = [4.85442,-0.676645,98.7383]
	-- bolt_head_right
	bolt_head_right = mesh vertices:#([-4.33418,-0.676646,98.7383],[-4.33418,-1.62938,98.7383],[-2.23821,-0.676646,98.7383]) faces:#([2,1,3])
	bolt_head_right.name  = "bolt_head_right"
	bolt_head_right.pivot = [-4.33418,-0.676645,98.7383]
	-- bolt_head_top
	bolt_head_top = mesh vertices:#([0.0638252,-1.47298,103.716],[1.01656,-1.47298,103.716],[0.0638252,0.622987,103.716]) faces:#([2,1,3])
	bolt_head_top.name  = "bolt_head_top"
	bolt_head_top.pivot = [0.063826,-1.46211,104.065]
	-- bolt_l_leg_calf
	bolt_l_leg_calf = mesh vertices:#([15.915,3.3696,27.7197],[15.6684,4.28987,27.7197],[13.9594,2.84561,27.1772]) faces:#([2,1,3])
	bolt_l_leg_calf.name  = "bolt_l_leg_calf"
	bolt_l_leg_calf.pivot = [15.915,3.3696,27.7197]
	-- bolt_r_leg_calf
	bolt_r_leg_calf = mesh vertices:#([-15.6649,3.3696,27.7197],[-15.9115,2.44933,27.7197],[-13.7094,2.84561,27.1772]) faces:#([2,1,3])
	bolt_r_leg_calf.name  = "bolt_r_leg_calf"
	bolt_r_leg_calf.pivot = [-15.6649,3.3696,27.7197]
	
	-- bolt_back
	bolt_back = mesh vertices:#([0.0638257,6.56617,81.0634],[-0.888911,6.56617,81.0634],[0.0638265,4.4702,81.0634]) faces:#([2,1,3])
	bolt_back.name  = "bolt_back"
	bolt_back.pivot = [0.063826,6.56617,81.0634]
	-- bolt_chestg
	bolt_chestg = mesh vertices:#([0.0638246,-0.396851,78.6206],[1.01656,-0.396851,78.6206],[0.0638249,1.69912,78.6206]) faces:#([2,1,3])
	bolt_chestg.name  = "bolt_chestg"
	bolt_chestg.pivot = [0.063825,-0.396851,78.6206]
	-- bolt_hip_bl
	bolt_hip_bl = mesh vertices:#([5.90721,4.77165,66.2021],[5.08212,5.24802,66.2021],[4.85923,2.95648,66.2021]) faces:#([2,1,3])
	bolt_hip_bl.name  = "bolt_hip_bl"
	bolt_hip_bl.pivot = [5.90721,4.77165,66.2021]
	-- bolt_hip_br
	bolt_hip_br = mesh vertices:#([-5.77956,4.77165,66.2021],[-6.60466,4.29528,66.2021],[-4.73158,2.95648,66.2021]) faces:#([2,1,3])
	bolt_hip_br.name  = "bolt_hip_br"
	bolt_hip_br.pivot = [-5.77956,4.77165,66.2021]
	-- bolt_hip_fl
	bolt_hip_fl = mesh vertices:#([5.15392,-5.47771,65.2766],[6.00282,-5.04517,65.2766],[4.20237,-3.61018,65.2766]) faces:#([2,1,3])
	bolt_hip_fl.name  = "bolt_hip_fl"
	bolt_hip_fl.pivot = [5.20534,-5.50695,65.2386]
	-- bolt_hip_fr
	bolt_hip_fr = mesh vertices:#([-5.02627,-5.47771,65.2766],[-4.17737,-5.91024,65.2766],[-4.07472,-3.61018,65.2766]) faces:#([2,1,3])
	bolt_hip_fr.name  = "bolt_hip_fr"
	bolt_hip_fr.pivot = [-5.07768,-5.50695,65.2386]
	-- bolt_hip_l
	bolt_hip_l = mesh vertices:#([7.61069,-1.33309,65.3842],[7.77613,-0.394823,65.3842],[5.56665,-0.972666,65.0925]) faces:#([2,1,3])
	bolt_hip_l.name  = "bolt_hip_l"
	bolt_hip_l.pivot = [7.61069,-1.33309,65.3842]
	-- bolt_hip_r
	bolt_hip_r = mesh vertices:#([-7.74138,-1.34349,64.958],[-7.57594,-2.28175,64.958],[-5.69734,-0.983068,64.6663]) faces:#([2,1,3])
	bolt_hip_r.name  = "bolt_hip_r"
	bolt_hip_r.pivot = [-7.68239,-1.33309,65.3842]
	-- bolt_lchest_l
	bolt_lchest_l = mesh vertices:#([4.11007,-6.07346,73.9502],[5.00181,-5.74761,73.8706],[3.40336,-4.10522,74.0904]) faces:#([2,1,3])
	bolt_lchest_l.name  = "bolt_lchest_l"
	bolt_lchest_l.pivot = [4.11007,-6.07346,73.9502]
	-- bolt_lchest_r
	bolt_lchest_r = mesh vertices:#([-3.98242,-6.55414,73.9502],[-3.09069,-6.87999,74.0298],[-3.2757,-4.58589,74.0904]) faces:#([2,1,3])
	bolt_lchest_r.name  = "bolt_lchest_r"
	bolt_lchest_r.pivot = [-3.98242,-6.55414,73.9502]
	-- bolt_shldr_l
	bolt_shldr_l = mesh vertices:#([9.13204,-2.03142,84.7503],[10.0512,-1.98531,84.504],[8.65807,-0.659234,83.2385]) faces:#([2,1,3])
	bolt_shldr_l.name  = "bolt_shldr_l"
	bolt_shldr_l.pivot = [9.19603,-2.04909,84.9267]
	-- bolt_shldr_r
	bolt_shldr_r = mesh vertices:#([-9.59965,-2.05409,84.7503],[-8.68033,-2.09731,84.9966],[-9.12999,-0.680429,83.2385]) faces:#([2,1,3])
	bolt_shldr_r.name  = "bolt_shldr_r"
	bolt_shldr_r.pivot = [-9.67194,-2.04909,84.9267]
	-- bolt_uchest_l
	bolt_uchest_l = mesh vertices:#([4.94946,-5.69981,80.676],[5.86977,-5.53765,80.4905],[4.49909,-3.71444,80.1775]) faces:#([2,1,3])
	bolt_uchest_l.name  = "bolt_uchest_l"
	bolt_uchest_l.pivot = [4.94946,-5.69981,80.676]
	-- bolt_uchest_r
	bolt_uchest_r = mesh vertices:#([-4.82181,-5.69981,80.676],[-3.90149,-5.86198,80.8616],[-4.37144,-3.71444,80.1775]) faces:#([2,1,3])
	bolt_uchest_r.name  = "bolt_uchest_r"
	bolt_uchest_r.pivot = [-4.8218,-5.69981,80.676]
	
	-- bolt_head_cap_torso
	bolt_head_cap_torso = mesh vertices:#([0.0638255,0.483683,90.8855],[-0.888912,0.483683,90.8855],[0.0638255,0.0121929,92.9277]) faces:#([2,1,3])
	bolt_head_cap_torso.name  = "bolt_head_cap_torso"
	bolt_head_cap_torso.pivot = [0.063826,0.618686,90.7227]
	-- bolt_hips_cap_l_leg
	bolt_hips_cap_l_leg = mesh vertices:#([13.1749,2.82097,25.6686],[14.0519,2.82097,26.0409],[12.3559,2.82097,27.598]) faces:#([2,1,3])
	bolt_hips_cap_l_leg.name  = "bolt_hips_cap_l_leg"
	bolt_hips_cap_l_leg.pivot = [13.2639,2.85684,25.4726]
	-- bolt_hips_cap_r_leg
	bolt_hips_cap_r_leg = mesh vertices:#([-13.0473,2.82097,25.6686],[-12.1703,2.82097,25.2964],[-12.2283,2.82097,27.598]) faces:#([2,1,3])
	bolt_hips_cap_r_leg.name  = "bolt_hips_cap_r_leg"
	bolt_hips_cap_r_leg.pivot = [-13.1363,2.85684,25.4726]
	-- bolt_hips_cap_torso
	bolt_hips_cap_torso = mesh vertices:#([-0.00795231,0.333876,65.0738],[0.944785,0.333876,65.0738],[-0.00795273,0.552964,62.9893]) faces:#([2,1,3])
	bolt_hips_cap_torso.name  = "bolt_hips_cap_torso"
	bolt_hips_cap_torso.pivot = [-0.00795216,0.333876,65.0738]
	-- bolt_l_leg_cap_hips
	bolt_l_leg_cap_hips = mesh vertices:#([12.9681,2.87325,26.6659],[12.1046,2.87325,26.2632],[13.8539,2.87325,24.7663]) faces:#([2,1,3])
	bolt_l_leg_cap_hips.name  = "bolt_l_leg_cap_hips"
	bolt_l_leg_cap_hips.pivot = [12.9681,2.87325,26.6659]
	-- bolt_r_leg_cap_hips
	bolt_r_leg_cap_hips = mesh vertices:#([-12.8404,2.87324,26.6659],[-13.7108,2.87324,27.0534],[-13.6929,2.87324,24.7511]) faces:#([2,1,3])
	bolt_r_leg_cap_hips.name  = "bolt_r_leg_cap_hips"
	bolt_r_leg_cap_hips.pivot = [-12.8404,2.87325,26.6659]
	-- bolt_l_hand_cap_l_arm
	bolt_l_hand_cap_l_arm = mesh vertices:#([29.5973,0.315133,62.6668],[29.5953,-0.637578,62.6737],[31.0945,0.301447,61.2001]) faces:#([2,1,3])
	bolt_l_hand_cap_l_arm.name  = "bolt_l_hand_cap_l_arm"
	bolt_l_hand_cap_l_arm.pivot = [29.6053,0.298225,62.6631]
	-- bolt_r_hand_cap_r_arm
	bolt_r_hand_cap_r_arm = mesh vertices:#([-29.4776,0.298227,62.6631],[-29.4776,1.25096,62.6631],[-30.9597,0.298227,61.181]) faces:#([2,1,3])
	bolt_r_hand_cap_r_arm.name  = "bolt_r_hand_cap_r_arm"
	bolt_r_hand_cap_r_arm.pivot = [-29.4776,0.298225,62.6631]
	-- bolt_l_arm_cap_torso
	bolt_l_arm_cap_torso = mesh vertices:#([12.1188,1.21491,81.1733],[12.1241,0.262189,81.1707],[13.6004,1.22714,79.6908]) faces:#([2,1,3])
	bolt_l_arm_cap_torso.name  = "bolt_l_arm_cap_torso"
	bolt_l_arm_cap_torso.pivot = [12.2336,1.19633,81.303]
	-- bolt_l_arm_cap_l_hand
	bolt_l_arm_cap_l_hand = mesh vertices:#([29.1545,0.640597,62.7077],[29.1565,1.59331,62.7008],[27.6573,0.654283,64.1744]) faces:#([2,1,3])
	bolt_l_arm_cap_l_hand.name  = "bolt_l_arm_cap_l_hand"
	bolt_l_arm_cap_l_hand.pivot = [29.1621,0.622429,62.7118]
	-- bolt_r_arm_cap_torso
	bolt_r_arm_cap_torso = mesh vertices:#([-12.0005,1.23437,81.1736],[-12.0005,2.18711,81.1736],[-13.4826,1.23437,79.6915]) faces:#([2,1,3])
	bolt_r_arm_cap_torso.name  = "bolt_r_arm_cap_torso"
	bolt_r_arm_cap_torso.pivot = [-12.106,1.19633,81.303]
	-- bolt_r_arm_cap_r_hand
	bolt_r_arm_cap_r_hand = mesh vertices:#([-29.0344,0.62243,62.7118],[-29.0344,-0.330307,62.7118],[-27.5523,0.62243,64.1939]) faces:#([2,1,3])
	bolt_r_arm_cap_r_hand.name  = "bolt_r_arm_cap_r_hand"
	bolt_r_arm_cap_r_hand.pivot = [-29.0344,0.622428,62.7118]
	-- bolt_torso_cap_head
	bolt_torso_cap_head = mesh vertices:#([0.0638255,0.568683,90.5173],[1.01656,0.568683,90.5173],[0.0638255,1.04017,88.475]) faces:#([2,1,3])
	bolt_torso_cap_head.name  = "bolt_torso_cap_head"
	bolt_torso_cap_head.pivot = [0.063826,0.618686,90.7227]
	-- bolt_torso_cap_hips
	bolt_torso_cap_hips = mesh vertices:#([0.063826,-0.0469857,65.7457],[-0.888911,-0.0469857,65.7457],[0.0638264,-0.266074,67.8302]) faces:#([2,1,3])
	bolt_torso_cap_hips.name  = "bolt_torso_cap_hips"
	bolt_torso_cap_hips.pivot = [0.0638261,-0.0469854,65.7457]
	-- bolt_torso_cap_l_arm
	bolt_torso_cap_l_arm = mesh vertices:#([12.0953,1.13862,81.197],[12.09,2.09134,81.1995],[10.6136,1.12639,82.6794]) faces:#([2,1,3])
	bolt_torso_cap_l_arm.name  = "bolt_torso_cap_l_arm"
	bolt_torso_cap_l_arm.pivot = [12.2336,1.19633,81.303]
	-- bolt_torso_cap_r_arm
	bolt_torso_cap_r_arm = mesh vertices:#([-11.9766,1.15828,81.1975],[-11.9766,0.205543,81.1975],[-10.4945,1.15828,82.6796]) faces:#([2,1,3])
	bolt_torso_cap_r_arm.name  = "bolt_torso_cap_r_arm"
	bolt_torso_cap_r_arm.pivot = [-12.106,1.19633,81.303]

	max modify mode
		-- stupidtriangle_off
		modPanel.setCurrentObject stupidtriangle_off
			addModifier stupidtriangle_off (skin())
			skinOps.addBone stupidtriangle_off.skin thoracic 0
			skinOps.selectBone stupidtriangle_off.skin 1
			skinOps.setVertexWeights stupidtriangle_off.skin 1 1 100
			skinOps.setVertexWeights stupidtriangle_off.skin 2 1 100
			skinOps.setVertexWeights stupidtriangle_off.skin 3 1 100
		-- bolt_head_eyes
		modPanel.setCurrentObject bolt_head_eyes
			addModifier bolt_head_eyes (skin())
			skinOps.addBone bolt_head_eyes.skin cranium 0
			skinOps.selectBone bolt_head_eyes.skin 1
			skinOps.setVertexWeights bolt_head_eyes.skin 1 1 100
			skinOps.setVertexWeights bolt_head_eyes.skin 2 1 100
			skinOps.setVertexWeights bolt_head_eyes.skin 3 1 100
		-- bolt_l_arm_elbow
		modPanel.setCurrentObject bolt_l_arm_elbow
			addModifier bolt_l_arm_elbow (skin())
			skinOps.addBone bolt_l_arm_elbow.skin lradius 0
			skinOps.selectBone bolt_l_arm_elbow.skin 1
			skinOps.setVertexWeights bolt_l_arm_elbow.skin 1 1 100
			skinOps.setVertexWeights bolt_l_arm_elbow.skin 2 1 100
			skinOps.setVertexWeights bolt_l_arm_elbow.skin 3 1 100
		-- bolt_l_hand
		modPanel.setCurrentObject bolt_l_hand
			addModifier bolt_l_hand (skin())
			--skinOps.addBone bolt_l_hand.skin lhang_tag_bone 0
			skinOps.addBone bolt_l_hand.skin lhand 0
			skinOps.selectBone bolt_l_hand.skin 1
			skinOps.setVertexWeights bolt_l_hand.skin 1 1 100
			skinOps.setVertexWeights bolt_l_hand.skin 2 1 100
			skinOps.setVertexWeights bolt_l_hand.skin 3 1 100
		-- bolt_r_arm_elbow
		modPanel.setCurrentObject bolt_r_arm_elbow
			addModifier bolt_r_arm_elbow (skin())
			skinOps.addBone bolt_r_arm_elbow.skin rradius 0
			skinOps.selectBone bolt_r_arm_elbow.skin 1
			skinOps.setVertexWeights bolt_r_arm_elbow.skin 1 1 100
			skinOps.setVertexWeights bolt_r_arm_elbow.skin 2 1 100
			skinOps.setVertexWeights bolt_r_arm_elbow.skin 3 1 100
		-- bolt_r_hand
		modPanel.setCurrentObject bolt_r_hand
			addModifier bolt_r_hand (skin())
			skinOps.addBone bolt_r_hand.skin rhang_tag_bone 0
			skinOps.selectBone bolt_r_hand.skin 1
			skinOps.setVertexWeights bolt_r_hand.skin 1 1 100
			skinOps.setVertexWeights bolt_r_hand.skin 2 1 100
			skinOps.setVertexWeights bolt_r_hand.skin 3 1 100
		-- bolt_l_leg_knee
		modPanel.setCurrentObject bolt_l_leg_knee
			addModifier bolt_l_leg_knee (skin())
			skinOps.addBone bolt_l_leg_knee.skin ltibia 0
			skinOps.selectBone bolt_l_leg_knee.skin 1
			skinOps.setVertexWeights bolt_l_leg_knee.skin 1 1 100
			skinOps.setVertexWeights bolt_l_leg_knee.skin 2 1 100
			skinOps.setVertexWeights bolt_l_leg_knee.skin 3 1 100
		-- bolt_l_leg_foot
		modPanel.setCurrentObject bolt_l_leg_foot
			addModifier bolt_l_leg_foot (skin())
			skinOps.addBone bolt_l_leg_foot.skin ltalus 0
			skinOps.selectBone bolt_l_leg_foot.skin 1
			skinOps.setVertexWeights bolt_l_leg_foot.skin 1 1 100
			skinOps.setVertexWeights bolt_l_leg_foot.skin 2 1 100
			skinOps.setVertexWeights bolt_l_leg_foot.skin 3 1 100
		-- bolt_r_leg_knee
		modPanel.setCurrentObject bolt_r_leg_knee
			addModifier bolt_r_leg_knee (skin())
			skinOps.addBone bolt_r_leg_knee.skin rtibia 0
			skinOps.selectBone bolt_r_leg_knee.skin 1
			skinOps.setVertexWeights bolt_r_leg_knee.skin 1 1 100
			skinOps.setVertexWeights bolt_r_leg_knee.skin 2 1 100
			skinOps.setVertexWeights bolt_r_leg_knee.skin 3 1 100
		-- bolt_r_leg_foot
		modPanel.setCurrentObject bolt_r_leg_foot
			addModifier bolt_r_leg_foot (skin())
			skinOps.addBone bolt_r_leg_foot.skin rtalus 0
			skinOps.selectBone bolt_r_leg_foot.skin 1
			skinOps.setVertexWeights bolt_r_leg_foot.skin 1 1 100
			skinOps.setVertexWeights bolt_r_leg_foot.skin 2 1 100
			skinOps.setVertexWeights bolt_r_leg_foot.skin 3 1 100
			
		-- bolt_head_front
		modPanel.setCurrentObject bolt_head_front
			addModifier bolt_head_front (skin())
			skinOps.addBone bolt_head_front.skin cranium 0
			skinOps.selectBone bolt_head_front.skin 1
			skinOps.setVertexWeights bolt_head_front.skin 1 1 100
			skinOps.setVertexWeights bolt_head_front.skin 2 1 100
			skinOps.setVertexWeights bolt_head_front.skin 3 1 100
		-- bolt_head_back
		modPanel.setCurrentObject bolt_head_back
			addModifier bolt_head_back (skin())
			skinOps.addBone bolt_head_back.skin cranium 0
			skinOps.selectBone bolt_head_back.skin 1
			skinOps.setVertexWeights bolt_head_back.skin 1 1 100
			skinOps.setVertexWeights bolt_head_back.skin 2 1 100
			skinOps.setVertexWeights bolt_head_back.skin 3 1 100
		-- bolt_head_left
		modPanel.setCurrentObject bolt_head_left
			addModifier bolt_head_left (skin())
			skinOps.addBone bolt_head_left.skin cranium 0
			skinOps.selectBone bolt_head_left.skin 1
			skinOps.setVertexWeights bolt_head_left.skin 1 1 100
			skinOps.setVertexWeights bolt_head_left.skin 2 1 100
			skinOps.setVertexWeights bolt_head_left.skin 3 1 100
		-- bolt_head_right
		modPanel.setCurrentObject bolt_head_right
			addModifier bolt_head_right (skin())
			skinOps.addBone bolt_head_right.skin cranium 0
			skinOps.selectBone bolt_head_right.skin 1
			skinOps.setVertexWeights bolt_head_right.skin 1 1 100
			skinOps.setVertexWeights bolt_head_right.skin 2 1 100
			skinOps.setVertexWeights bolt_head_right.skin 3 1 100
		-- bolt_head_top
		modPanel.setCurrentObject bolt_head_top
			addModifier bolt_head_top (skin())
			skinOps.addBone bolt_head_top.skin cranium 0
			skinOps.selectBone bolt_head_top.skin 1
			skinOps.setVertexWeights bolt_head_top.skin 1 1 100
			skinOps.setVertexWeights bolt_head_top.skin 2 1 100
			skinOps.setVertexWeights bolt_head_top.skin 3 1 100
		-- bolt_l_leg_calf
		modPanel.setCurrentObject bolt_l_leg_calf
			addModifier bolt_l_leg_calf (skin())
			skinOps.addBone bolt_l_leg_calf.skin ltibia 0
			skinOps.selectBone bolt_l_leg_calf.skin 1
			skinOps.setVertexWeights bolt_l_leg_calf.skin 1 1 100
			skinOps.setVertexWeights bolt_l_leg_calf.skin 2 1 100
			skinOps.setVertexWeights bolt_l_leg_calf.skin 3 1 100
		-- bolt_r_leg_calf
		modPanel.setCurrentObject bolt_r_leg_calf
			addModifier bolt_r_leg_calf (skin())
			skinOps.addBone bolt_r_leg_calf.skin rtibia 0
			skinOps.selectBone bolt_r_leg_calf.skin 1
			skinOps.setVertexWeights bolt_r_leg_calf.skin 1 1 100
			skinOps.setVertexWeights bolt_r_leg_calf.skin 2 1 100
			skinOps.setVertexWeights bolt_r_leg_calf.skin 3 1 100
		-- bolt_back
		modPanel.setCurrentObject bolt_back
			addModifier bolt_back (skin())
			skinOps.addBone bolt_back.skin thoracic 0
			skinOps.selectBone bolt_back.skin 1
			skinOps.setVertexWeights bolt_back.skin 1 1 100
			skinOps.setVertexWeights bolt_back.skin 2 1 100
			skinOps.setVertexWeights bolt_back.skin 3 1 100
		-- bolt_chestg
		modPanel.setCurrentObject bolt_chestg
			addModifier bolt_chestg (skin())
			skinOps.addBone bolt_chestg.skin upper_lumbar 0
			skinOps.selectBone bolt_chestg.skin 1
			skinOps.setVertexWeights bolt_chestg.skin 1 1 100
			skinOps.setVertexWeights bolt_chestg.skin 2 1 100
			skinOps.setVertexWeights bolt_chestg.skin 3 1 100
		-- bolt_hip_bl
		modPanel.setCurrentObject bolt_hip_bl
			addModifier bolt_hip_bl (skin())
			skinOps.addBone bolt_hip_bl.skin lower_lumbar 0
			skinOps.selectBone bolt_hip_bl.skin 1
			skinOps.setVertexWeights bolt_hip_bl.skin 1 1 100
			skinOps.setVertexWeights bolt_hip_bl.skin 2 1 100
			skinOps.setVertexWeights bolt_hip_bl.skin 3 1 100
		-- bolt_hip_br
		modPanel.setCurrentObject bolt_hip_br
			addModifier bolt_hip_br (skin())
			skinOps.addBone bolt_hip_br.skin lower_lumbar 0
			skinOps.selectBone bolt_hip_br.skin 1
			skinOps.setVertexWeights bolt_hip_br.skin 1 1 100
			skinOps.setVertexWeights bolt_hip_br.skin 2 1 100
			skinOps.setVertexWeights bolt_hip_br.skin 3 1 100
		-- bolt_hip_fl
		modPanel.setCurrentObject bolt_hip_fl
			addModifier bolt_hip_fl (skin())
			skinOps.addBone bolt_hip_fl.skin lower_lumbar 0
			skinOps.selectBone bolt_hip_fl.skin 1
			skinOps.setVertexWeights bolt_hip_fl.skin 1 1 100
			skinOps.setVertexWeights bolt_hip_fl.skin 2 1 100
			skinOps.setVertexWeights bolt_hip_fl.skin 3 1 100
		-- bolt_hip_fr
		modPanel.setCurrentObject bolt_hip_fr
			addModifier bolt_hip_fr (skin())
			skinOps.addBone bolt_hip_fr.skin lower_lumbar 0
			skinOps.selectBone bolt_hip_fr.skin 1
			skinOps.setVertexWeights bolt_hip_fr.skin 1 1 100
			skinOps.setVertexWeights bolt_hip_fr.skin 2 1 100
			skinOps.setVertexWeights bolt_hip_fr.skin 3 1 100
		-- bolt_hip_l
		modPanel.setCurrentObject bolt_hip_l
			addModifier bolt_hip_l (skin())
			skinOps.addBone bolt_hip_l.skin lower_lumbar 0
			skinOps.selectBone bolt_hip_l.skin 1
			skinOps.setVertexWeights bolt_hip_l.skin 1 1 100
			skinOps.setVertexWeights bolt_hip_l.skin 2 1 100
			skinOps.setVertexWeights bolt_hip_l.skin 3 1 100
		-- bolt_hip_r
		modPanel.setCurrentObject bolt_hip_r
			addModifier bolt_hip_r (skin())
			skinOps.addBone bolt_hip_r.skin lower_lumbar 0
			skinOps.selectBone bolt_hip_r.skin 1
			skinOps.setVertexWeights bolt_hip_r.skin 1 1 100
			skinOps.setVertexWeights bolt_hip_r.skin 2 1 100
			skinOps.setVertexWeights bolt_hip_r.skin 3 1 100
		-- bolt_lchest_l
		modPanel.setCurrentObject bolt_lchest_l
			addModifier bolt_lchest_l (skin())
			skinOps.addBone bolt_lchest_l.skin upper_lumbar 0
			skinOps.selectBone bolt_lchest_l.skin 1
			skinOps.setVertexWeights bolt_lchest_l.skin 1 1 100
			skinOps.setVertexWeights bolt_lchest_l.skin 2 1 100
			skinOps.setVertexWeights bolt_lchest_l.skin 3 1 100
		-- bolt_lchest_r
		modPanel.setCurrentObject bolt_lchest_r
			addModifier bolt_lchest_r (skin())
			skinOps.addBone bolt_lchest_r.skin lower_lumbar 0
			skinOps.selectBone bolt_lchest_r.skin 1
			skinOps.setVertexWeights bolt_lchest_r.skin 1 1 100
			skinOps.setVertexWeights bolt_lchest_r.skin 2 1 100
			skinOps.setVertexWeights bolt_lchest_r.skin 3 1 100
		-- bolt_shldr_l
		modPanel.setCurrentObject bolt_shldr_l
			addModifier bolt_shldr_l (skin())
			skinOps.addBone bolt_shldr_l.skin lclavical 0
			skinOps.selectBone bolt_shldr_l.skin 1
			skinOps.setVertexWeights bolt_shldr_l.skin 1 1 100
			skinOps.setVertexWeights bolt_shldr_l.skin 2 1 100
			skinOps.setVertexWeights bolt_shldr_l.skin 3 1 100
		-- bolt_shldr_r
		modPanel.setCurrentObject bolt_shldr_r
			addModifier bolt_shldr_r (skin())
			skinOps.addBone bolt_shldr_r.skin rclavical 0
			skinOps.selectBone bolt_shldr_r.skin 1
			skinOps.setVertexWeights bolt_shldr_r.skin 1 1 100
			skinOps.setVertexWeights bolt_shldr_r.skin 2 1 100
			skinOps.setVertexWeights bolt_shldr_r.skin 3 1 100
		-- bolt_uchest_l
		modPanel.setCurrentObject bolt_uchest_l
			addModifier bolt_uchest_l (skin())
			skinOps.addBone bolt_uchest_l.skin thoracic 0
			skinOps.selectBone bolt_uchest_l.skin 1
			skinOps.setVertexWeights bolt_uchest_l.skin 1 1 100
			skinOps.setVertexWeights bolt_uchest_l.skin 2 1 100
			skinOps.setVertexWeights bolt_uchest_l.skin 3 1 100
		-- bolt_uchest_r
		modPanel.setCurrentObject bolt_uchest_r
			addModifier bolt_uchest_r (skin())
			skinOps.addBone bolt_uchest_r.skin thoracic 0
			skinOps.selectBone bolt_uchest_r.skin 1
			skinOps.setVertexWeights bolt_uchest_r.skin 1 1 100
			skinOps.setVertexWeights bolt_uchest_r.skin 2 1 100
			skinOps.setVertexWeights bolt_uchest_r.skin 3 1 100
		-- bolt_head_cap_torso
		modPanel.setCurrentObject bolt_head_cap_torso
			addModifier bolt_head_cap_torso (skin())
			skinOps.addBone bolt_head_cap_torso.skin cervical 0
			skinOps.selectBone bolt_head_cap_torso.skin 1
			skinOps.setVertexWeights bolt_head_cap_torso.skin 1 1 100
			skinOps.setVertexWeights bolt_head_cap_torso.skin 2 1 100
			skinOps.setVertexWeights bolt_head_cap_torso.skin 3 1 100
		-- bolt_hips_cap_l_leg
		modPanel.setCurrentObject bolt_hips_cap_l_leg
			addModifier bolt_hips_cap_l_leg (skin())
			skinOps.addBone bolt_hips_cap_l_leg.skin ltibia 0
			skinOps.selectBone bolt_hips_cap_l_leg.skin 1
			skinOps.setVertexWeights bolt_hips_cap_l_leg.skin 1 1 100
			skinOps.setVertexWeights bolt_hips_cap_l_leg.skin 2 1 100
			skinOps.setVertexWeights bolt_hips_cap_l_leg.skin 3 1 100
		-- bolt_hips_cap_r_leg
		modPanel.setCurrentObject bolt_hips_cap_r_leg
			addModifier bolt_hips_cap_r_leg (skin())
			skinOps.addBone bolt_hips_cap_r_leg.skin rtibia 0
			skinOps.selectBone bolt_hips_cap_r_leg.skin 1
			skinOps.setVertexWeights bolt_hips_cap_r_leg.skin 1 1 100
			skinOps.setVertexWeights bolt_hips_cap_r_leg.skin 2 1 100
			skinOps.setVertexWeights bolt_hips_cap_r_leg.skin 3 1 100
		-- bolt_hips_cap_torso
		modPanel.setCurrentObject bolt_hips_cap_torso
			addModifier bolt_hips_cap_torso (skin())
			skinOps.addBone bolt_hips_cap_torso.skin lower_lumbar 0
			skinOps.selectBone bolt_hips_cap_torso.skin 1
			skinOps.setVertexWeights bolt_hips_cap_torso.skin 1 1 100
			skinOps.setVertexWeights bolt_hips_cap_torso.skin 2 1 100
			skinOps.setVertexWeights bolt_hips_cap_torso.skin 3 1 100
		-- bolt_l_leg_cap_hips
		modPanel.setCurrentObject bolt_l_leg_cap_hips
			addModifier bolt_l_leg_cap_hips (skin())
			skinOps.addBone bolt_l_leg_cap_hips.skin ltibia 0
			skinOps.selectBone bolt_l_leg_cap_hips.skin 1
			skinOps.setVertexWeights bolt_l_leg_cap_hips.skin 1 1 100
			skinOps.setVertexWeights bolt_l_leg_cap_hips.skin 2 1 100
			skinOps.setVertexWeights bolt_l_leg_cap_hips.skin 3 1 100
		-- bolt_r_leg_cap_hips
		modPanel.setCurrentObject bolt_r_leg_cap_hips
			addModifier bolt_r_leg_cap_hips (skin())
			skinOps.addBone bolt_r_leg_cap_hips.skin rtibia 0
			skinOps.selectBone bolt_r_leg_cap_hips.skin 1
			skinOps.setVertexWeights bolt_r_leg_cap_hips.skin 1 1 100
			skinOps.setVertexWeights bolt_r_leg_cap_hips.skin 2 1 100
			skinOps.setVertexWeights bolt_r_leg_cap_hips.skin 3 1 100
		-- bolt_l_hand_cap_l_arm
		modPanel.setCurrentObject bolt_l_hand_cap_l_arm
			addModifier bolt_l_hand_cap_l_arm (skin())
			skinOps.addBone bolt_l_hand_cap_l_arm.skin lhand 0
			skinOps.selectBone bolt_l_hand_cap_l_arm.skin 1
			skinOps.setVertexWeights bolt_l_hand_cap_l_arm.skin 1 1 100
			skinOps.setVertexWeights bolt_l_hand_cap_l_arm.skin 2 1 100
			skinOps.setVertexWeights bolt_l_hand_cap_l_arm.skin 3 1 100
		-- bolt_r_hand_cap_r_arm
		modPanel.setCurrentObject bolt_r_hand_cap_r_arm
			addModifier bolt_r_hand_cap_r_arm (skin())
			skinOps.addBone bolt_r_hand_cap_r_arm.skin rhand 0
			skinOps.selectBone bolt_r_hand_cap_r_arm.skin 1
			skinOps.setVertexWeights bolt_r_hand_cap_r_arm.skin 1 1 100
			skinOps.setVertexWeights bolt_r_hand_cap_r_arm.skin 2 1 100
			skinOps.setVertexWeights bolt_r_hand_cap_r_arm.skin 3 1 100
		-- bolt_l_arm_cap_torso
		modPanel.setCurrentObject bolt_l_arm_cap_torso
			addModifier bolt_l_arm_cap_torso (skin())
			skinOps.addBone bolt_l_arm_cap_torso.skin lhumerusX 0
			skinOps.selectBone bolt_l_arm_cap_torso.skin 1
			skinOps.setVertexWeights bolt_l_arm_cap_torso.skin 1 1 100
			skinOps.setVertexWeights bolt_l_arm_cap_torso.skin 2 1 100
			skinOps.setVertexWeights bolt_l_arm_cap_torso.skin 3 1 100
		-- bolt_l_arm_cap_l_hand
		modPanel.setCurrentObject bolt_l_arm_cap_l_hand
			addModifier bolt_l_arm_cap_l_hand (skin())
			skinOps.addBone bolt_l_arm_cap_l_hand.skin lradiusX 0
			skinOps.selectBone bolt_l_arm_cap_l_hand.skin 1
			skinOps.setVertexWeights bolt_l_arm_cap_l_hand.skin 1 1 100
			skinOps.setVertexWeights bolt_l_arm_cap_l_hand.skin 2 1 100
			skinOps.setVertexWeights bolt_l_arm_cap_l_hand.skin 3 1 100
		-- bolt_r_arm_cap_torso
		modPanel.setCurrentObject bolt_r_arm_cap_torso
			addModifier bolt_r_arm_cap_torso (skin())
			skinOps.addBone bolt_r_arm_cap_torso.skin rhumerusX 0
			skinOps.selectBone bolt_r_arm_cap_torso.skin 1
			skinOps.setVertexWeights bolt_r_arm_cap_torso.skin 1 1 100
			skinOps.setVertexWeights bolt_r_arm_cap_torso.skin 2 1 100
			skinOps.setVertexWeights bolt_r_arm_cap_torso.skin 3 1 100
		-- bolt_r_arm_cap_r_hand
		modPanel.setCurrentObject bolt_r_arm_cap_r_hand
			addModifier bolt_r_arm_cap_r_hand (skin())
			skinOps.addBone bolt_r_arm_cap_r_hand.skin rradiusX 0
			skinOps.selectBone bolt_r_arm_cap_r_hand.skin 1
			skinOps.setVertexWeights bolt_r_arm_cap_r_hand.skin 1 1 100
			skinOps.setVertexWeights bolt_r_arm_cap_r_hand.skin 2 1 100
			skinOps.setVertexWeights bolt_r_arm_cap_r_hand.skin 3 1 100
		-- bolt_torso_cap_head
		modPanel.setCurrentObject bolt_torso_cap_head
			addModifier bolt_torso_cap_head (skin())
			skinOps.addBone bolt_torso_cap_head.skin cervical 0
			skinOps.selectBone bolt_torso_cap_head.skin 1
			skinOps.setVertexWeights bolt_torso_cap_head.skin 1 1 100
			skinOps.setVertexWeights bolt_torso_cap_head.skin 2 1 100
			skinOps.setVertexWeights bolt_torso_cap_head.skin 3 1 100
		-- bolt_torso_cap_hips
		modPanel.setCurrentObject bolt_torso_cap_hips
			addModifier bolt_torso_cap_hips (skin())
			skinOps.addBone bolt_torso_cap_hips.skin lower_lumbar 0
			skinOps.selectBone bolt_torso_cap_hips.skin 1
			skinOps.setVertexWeights bolt_torso_cap_hips.skin 1 1 100
			skinOps.setVertexWeights bolt_torso_cap_hips.skin 2 1 100
			skinOps.setVertexWeights bolt_torso_cap_hips.skin 3 1 100
		-- bolt_torso_cap_l_arm
		modPanel.setCurrentObject bolt_torso_cap_l_arm
			addModifier bolt_torso_cap_l_arm (skin())
			skinOps.addBone bolt_torso_cap_l_arm.skin lhumerusX 0
			skinOps.selectBone bolt_torso_cap_l_arm.skin 1
			skinOps.setVertexWeights bolt_torso_cap_l_arm.skin 1 1 100
			skinOps.setVertexWeights bolt_torso_cap_l_arm.skin 2 1 100
			skinOps.setVertexWeights bolt_torso_cap_l_arm.skin 3 1 100
		-- bolt_torso_cap_r_arm
		modPanel.setCurrentObject bolt_torso_cap_r_arm
			addModifier bolt_torso_cap_r_arm (skin())
			skinOps.addBone bolt_torso_cap_r_arm.skin rhumerusX 0
			skinOps.selectBone bolt_torso_cap_r_arm.skin 1
			skinOps.setVertexWeights bolt_torso_cap_r_arm.skin 1 1 100
			skinOps.setVertexWeights bolt_torso_cap_r_arm.skin 2 1 100
			skinOps.setVertexWeights bolt_torso_cap_r_arm.skin 3 1 100

	clearSelection()
	max create mode
	messageBox "Created successfully a Jedi Knight 2: Jedi Outcast skeleton.\n" title:"Process finished" beep:false
)

createJK2Skeleton()