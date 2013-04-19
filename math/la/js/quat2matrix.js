
/*
	4 by 4 matrix multiplication
*/

// set up inlets/outlets/assist strings
inlets = 1;
outlets = 1;
setinletassist(0,"Quaternio [w x y z]");
setoutletassist(0,"4 x 4 Matrix colum oriented");

var Q = 0;

function list()
{
	var M = new Array();
	Q = arrayfromargs(messagename,arguments);

	var xx = Q[0] * Q[0]; // xx      = X * X;
	var xy = Q[0] * Q[1]; // xy      = X * Y;
    var xz = Q[0] * Q[2]; // xz      = X * Z;
    var xw = Q[0] * Q[3]; // xw      = X * W;

    var yy = Q[1] * Q[1]; // yy      = Y * Y;
    var yz = Q[1] * Q[2]; // yz      = Y * Z;
    var yw = Q[1] * Q[3]; // yw      = Y * W;

    var zz = Q[2] * Q[2]; // zz      = Z * Z;
    var zw = Q[2] * Q[3]; // zw      = Z * W;

	M[0] = 1. - 2. * ( yy + zz );
	M[1] = 2. * ( xy - zw );
	M[2] = 2. * ( xz + yw );

	M[4]  = 2. * ( xy + zw );
	M[5]  = 1. - 2. * ( xx + zz );
	M[6]  = 2. * ( yz - xw );

	M[8]  = 2. * ( xz - yw );
	M[9]  = 2. * ( yz + xw );
	M[10] = 1. - 2. * ( xx + yy );

	M[3] = M[7] = M[11] = M[12] = M[13] = M[14] = 0;
	M[15] = 1.;
	outlet(0,M);
}
