subroutine results

use globals
use potential

implicit none
integer i

write(10,*) 'A positions in the unit cell:'

do i=1,nA
write(10,*) apositions(i,:)
enddo

write(10,*) 'B positions in the unit cell:'
do i=1,nB
write(10,*) bpositions(i,:)
enddo

write(10,*) 'Convergence at', conv, 'cells'
write(10,*) 'AA intensity parameter:', A_AA
write(10,*) 'AA decay parameters:', alphaAA, betaAA, gammaAA
write(10,*) 'AB intensity parameter:', A_AB
write(10,*) 'AB decay parameters:', alphaAB, betaAB, gammaAB
write(10,*) 'BB intensity parameter:', A_BB
write(10,*) 'BB decay parameters:', alphaBB, betaBB, gammaBB 

write(10,*) 'Lattice parameters:'
do i=1,3
 write(10,*) lattice(i,:)
enddo

write(10,*) 'Self energy (original cell):', selfE
write(10,*) 'Energy with the replicas:', otherE
write(10,*) 'Total Energy:', totalE

end subroutine
