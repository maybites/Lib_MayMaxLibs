{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 4
		}
,
		"rect" : [ 354.0, 105.0, 855.0, 695.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"linecount" : 59,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.0, 24.0, 450.0, 821.0 ],
					"text" : "Java code to do conversion\n\npublic final void quatToMatrix(Quat4d q){\n    double sqw = q.w*q.w;\n    double sqx = q.x*q.x;\n    double sqy = q.y*q.y;\n    double sqz = q.z*q.z;\n\n    // invs (inverse square length) is only required if quaternion is not already normalised\n    double invs = 1 / (sqx + sqy + sqz + sqw)\n    m00 = ( sqx - sqy - sqz + sqw)*invs ; // since sqw + sqx + sqy + sqz =1/invs*invs\n    m11 = (-sqx + sqy - sqz + sqw)*invs ;\n    m22 = (-sqx - sqy + sqz + sqw)*invs ;\n    \n    double tmp1 = q.x*q.y;\n    double tmp2 = q.z*q.w;\n    m10 = 2.0 * (tmp1 + tmp2)*invs ;\n    m01 = 2.0 * (tmp1 - tmp2)*invs ;\n    \n    tmp1 = q.x*q.z;\n    tmp2 = q.y*q.w;\n    m20 = 2.0 * (tmp1 - tmp2)*invs ;\n    m02 = 2.0 * (tmp1 + tmp2)*invs ;\n    tmp1 = q.y*q.z;\n    tmp2 = q.x*q.w;\n    m21 = 2.0 * (tmp1 + tmp2)*invs ;\n    m12 = 2.0 * (tmp1 - tmp2)*invs ;      \n}\n\n\nAlternative Java code\n\n    xx      = X * X;\n    xy      = X * Y;\n    xz      = X * Z;\n    xw      = X * W;\n\n    yy      = Y * Y;\n    yz      = Y * Z;\n    yw      = Y * W;\n\n    zz      = Z * Z;\n    zw      = Z * W;\n\nm00  = 1 - 2 * ( yy + zz );\nm01  =     2 * ( xy - zw );\nm02 =     2 * ( xz + yw );\n\nm10  =     2 * ( xy + zw );\nm11  = 1 - 2 * ( xx + zz );\nm12  =     2 * ( yz - xw );\n\nm20  =     2 * ( xz - yw );\nm21  =     2 * ( yz + xw );\nm22 = 1 - 2 * ( xx + yy );\n\nm03  = m13 = m23 = m30 = m31 = m32 = 0;\nm33 = 1;"
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [  ]
	}

}
