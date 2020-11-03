subroutine readinput

use globals
use potential

implicit none
character basura
integer i

read(8,*) basura
read(8,*) conv

read(8,*) basura
read(8,*) nA

read(8,*) basura
read(8,*) nB

call allocatepos

read(8,*) basura
do i=1,nA
 read(8,*) apositions(i,1), apositions(i,2), apositions(i,3)
enddo

read(8,*) basura
do i=1,nB
 read(8,*) bpositions(i,1), bpositions(i,2), bpositions(i,3)
enddo

read(8,*) basura
read(8,*) A_AA
read(8,*) basura
read(8,*) alphaAA, betaAA, gammaAA

read(8,*) basura
read(8,*) A_AB
read(8,*) basura
read(8,*) alphaAB, betaAB, gammaAB

read(8,*) basura
read(8,*) A_BB
read(8,*) basura
read(8,*) alphaBB, betaBB, gammaBB

read(8,*) basura
do i=1,3
 read(8,*) lattice(i,1), lattice(i,2), lattice(i,3)
enddo

end subroutine
