subroutine preprint

use globals
use potential

implicit none
integer i

print*,'A positions in the unit cell:'

do i=1,nA
print*, apositions(i,:)
enddo

print*,'B positions in the unit cell:'
do i=1,nB
print*, bpositions(i,:)
enddo

print*, 'Convergence at', conv, 'cells'
print*, 'AA intensity parameter:', A_AA
print*, 'AA decay parameters:', alphaAA, betaAA, gammaAA
print*, 'AB intensity parameter:', A_AB
print*, 'AB decay parameters:', alphaAB, betaAB, gammaAB
print*, 'BB intensity parameter:', A_BB
print*, 'BB decay parameters:', alphaBB, betaBB, gammaBB 

print*, 'Lattice parameters:'
do i=1,3
 print*, lattice(i,:)
enddo

end subroutine
