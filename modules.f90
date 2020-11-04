module globals

integer conv
integer nA, nB
real*8, allocatable :: apositions(:,:)
real*8, allocatable :: bpositions(:,:)
real*8, allocatable :: arealpositions(:,:)
real*8, allocatable :: brealpositions(:,:)
real*8, allocatable :: atrasl(:,:)
real*8, allocatable :: btrasl(:,:)
real*8 lattice(3,3)
real*8 selfE, otherE, totalE

endmodule globals

module potential

real*8 A_AA, A_AB, A_BB
real*8 alphaAA, alphaAB, alphaBB
real*8 betaAA,  betaAB, betaBB
real*8 gammaAA, gammaAB, gammaBB

endmodule potential
