
/*
	4 by 4 matrix multiplication
*/

// set up inlets/outlets/assist strings
inlets = 2;
outlets = 1;
setinletassist(0,"Vector");
setinletassist(1,"Matrix");
setoutletassist(0,"MatrixB x VectorA = VectorAB");

var MatrixB = 0;
var VectorA = 0;

var VectorAB = new Array();

function list()
{
	if (inlet==1){
		MatrixB = arrayfromargs(messagename,arguments);
	}
	if (inlet==0){
		VectorA = arrayfromargs(messagename,arguments);
	}


	if ((inlet==0 && MatrixB != 0)){

		VectorAB[0] = MatrixB[0] * VectorA[0] + MatrixB[1] * VectorA[1] + MatrixB[2] * VectorA[2] + MatrixB[3] * VectorA[3];

		VectorAB[1] = MatrixB[4] * VectorA[0] + MatrixB[5] * VectorA[1] + MatrixB[6] * VectorA[2] + MatrixB[7] * VectorA[3];

		VectorAB[2] = MatrixB[8] * VectorA[0] + MatrixB[9] * VectorA[1] + MatrixB[10] * VectorA[2] + MatrixB[11] * VectorA[3];

		VectorAB[3] = MatrixB[12] * VectorA[0] + MatrixB[13] * VectorA[1] + MatrixB[14] * VectorA[2] + MatrixB[15] * VectorA[3];
		
		outlet(0,VectorAB);
	}
}
