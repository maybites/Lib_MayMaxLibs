{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 4
		}
,
		"rect" : [ 25.0, 69.0, 1323.0, 674.0 ],
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
					"id" : "obj-3",
					"linecount" : 36,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 840.0, 30.0, 389.0, 504.0 ],
					"text" : "\nC/C++ are examples of languages that store data in row-major order. OpenGL is an example of an API that uses a column-major storage-order convention.\n\nRight now you're probably thinking, oh crap, what do I do about that. But when you sit down and think for a second you realize this is no big deal:\n\ncolumn-major operator-on-the-left == row-major operator-on-the-right\n\nSay what?\n\nRemember OpenGL transform order looks like this: P*V*M * v1 = v2\nThis is operator-on-the-left (i.e. matrix on the left of the vector). Also recall OpenGL presumes column-major matrix element storage order. So this is column-major operator-on-the-left.\n\nTurns out, if in C++ you think of the math this way instead: v1 * M*V*P = v2 (i.e. operator-on-the-right)\nand use standard C/C++ row-major element storage order, you get exactly the same data elements in exactly the same memory locations. This is row-major operator-on-the-right. So again:\n\ncolumn-major operator-on-the-left == row-major operator-on-the-right\n\nSo to your question as to how you can do OpenGL matrix math in C++ code, you can beat your head against the wall trying to do column-major storage math in row-major C/C++, or you can just flip the thing around to row-major and it's easy. For instance, instead of post-multiplying transforms in P*V*M*v1=v2 using column-major, you \"pre-multiply\" transforms in v1*M*V*P=v2 using row-major C++.\n\nDo a little 2x2 matrix * 2x2 matrix example on paper and convince yourself it works. It'll probably clear up your confusion, or at least refine it into a definite question. "
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"linecount" : 38,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 433.0, 15.0, 394.0, 531.0 ],
					"text" : "A projection matrix does the necessary divide by w which turns 3D into 2D and brings the system into clip space.\n\nA local/model matrix contains all the necessary translation, rotation, skewing, scaling, etc. information. A model matrix represents the sum total of the data necessary to orient the object correctly in local space.\n\nA world matrix contains all the necessary information to orient the object in world space.\n\nA view matrix is used to push the world matrices into view space or camera space. This is how the world looks from the viewpoint of the camera.\n\nThe final transform is:\n\nModel * World * View * Projection\n\nModel * World = World space\nModel * World * View = Camera/View space\nModel * World * View * Projection = Clip space\n\nHowever you will see a worldviewprojection matrix used in many books and API docs. The WVP matrix is: world * view * projection. Often it is more efficient to pass in the WVP to a shader as a pre-concatenated matrix which is why it is done this way.\n\nAs well remember that an inverse matrix will effectively undo the transform. So an inverse world matrix will undo a world transform and will bring the system back into local/model space.\n\nMost of the time when people refer to a modelview the model matrix is actually the concatenation of the local and world matrices for that particular object which has been concatenated with the view matrix from the camera.\n\nhttp://cboard.cprogramming.com/game-programming/118838-matrices-confusion-modelview-projection.html"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-90",
					"linecount" : 46,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 15.0, 373.0, 641.0 ],
					"text" : "Object Coordinates are transformed by the ModelView matrix to produce Eye Coordinates.\n\nEye Coordinates are transformed by the Projection matrix to produce Clip Coordinates.\n\nClip Coordinate X, Y, and Z are divided by Clip Coordinate W to produce Normalized Device Coordinates.\n\nNormalized Device Coordinates are scaled and translated by the viewport parameters to produce Window Coordinates.\n\nObject coordinates are the raw coordinates you submit to OpenGL with a call to glVertex*() or glVertexPointer(). They represent the coordinates of your object or other geometry you want to render.\n\nMany programmers use a World Coordinate system. Objects are often modeled in one coordinate system, then scaled, translated, and rotated into the world you're constructing. World Coordinates result from transforming Object Coordinates by the modelling transforms stored in the ModelView matrix. However, OpenGL has no concept of World Coordinates. World Coordinates are purely an application construct.\n\nEye Coordinates result from transforming Object Coordinates by the ModelView matrix. The ModelView matrix contains both modelling and viewing transformations that place the viewer at the origin with the view direction aligned with the negative Z axis.\n\nClip Coordinates result from transforming Eye Coordinates by the Projection matrix. Clip Coordinate space ranges from -Wc to Wc in all three axes, where Wc is the Clip Coordinate W value. OpenGL clips all coordinates outside this range.\n\nPerspective division performed on the Clip Coordinates produces Normalized Device Coordinates, ranging from -1 to 1 in all three axes.\n\nWindow Coordinates result from scaling and translating Normalized Device Coordinates by the viewport. The parameters to glViewport() and glDepthRange() control this transformation. With the viewport, you can map the Normalized Device Coordinate cube to any location in your window and depth buffer.\n\nhttp://www.opengl.org/archives/resources/faq/technical/transformations.htm"
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [  ]
	}

}
