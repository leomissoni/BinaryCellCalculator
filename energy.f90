subroutine energy_calculator

use globals

implicit none
integer i, j, k, ii, counter
real*8 totalE, selfE, otherE
real*8 distance
real*8 dist
real*8 potentialAA, potentialAB, potentialBB

!Create positions of unit cell in real space

do i=1,nA
 arealpositions(i,1) = apositions(i,1)*(lattice(1,1) + lattice(2,1) + lattice(3,1))
 arealpositions(i,2) = apositions(i,2)*(lattice(1,2) + lattice(2,2) + lattice(3,2))
 arealpositions(i,3) = apositions(i,3)*(lattice(1,3) + lattice(2,3) + lattice(3,3))
enddo

do i=1,nB
 brealpositions(i,1) = bpositions(i,1)*(lattice(1,1) + lattice(2,1) + lattice(3,1))
 brealpositions(i,2) = bpositions(i,2)*(lattice(1,2) + lattice(2,2) + lattice(3,2))
 brealpositions(i,3) = bpositions(i,3)*(lattice(1,3) + lattice(2,3) + lattice(3,3))
enddo

! Create all translated cells in the real space

counter = 1
do ii=1,nA
 do i=-conv,conv
  do j=-conv,conv
   do k=-conv,conv
    if ((i.ne.0).or.(j.ne.0).or.(k.ne.0)) then
     atrasl(counter,1) = (apositions(ii,1)+i)*lattice(1,1) + (apositions(ii,1)+j)*lattice(2,1) + (apositions(ii,1)+k)*lattice(3,1)
     atrasl(counter,2) = (apositions(ii,2)+i)*lattice(1,2) + (apositions(ii,2)+j)*lattice(2,2) + (apositions(ii,2)+k)*lattice(3,2)
     atrasl(counter,3) = (apositions(ii,3)+i)*lattice(1,3) + (apositions(ii,3)+j)*lattice(2,3) + (apositions(ii,1)+k)*lattice(3,3)
     counter = counter + 1
    endif
   enddo
  enddo
 enddo
enddo

counter = 1
do ii=1,nB
 do i=-conv,conv
  do j=-conv,conv
   do k=-conv,conv
    if ((i.ne.0).or.(j.ne.0).or.(k.ne.0)) then
     btrasl(counter,1) = (bpositions(ii,1)+i)*lattice(1,1) + (bpositions(ii,1)+j)*lattice(2,1) + (bpositions(ii,1)+k)*lattice(3,1)
     btrasl(counter,2) = (bpositions(ii,2)+i)*lattice(1,2) + (bpositions(ii,2)+j)*lattice(2,2) + (bpositions(ii,2)+k)*lattice(3,2)
     btrasl(counter,3) = (bpositions(ii,3)+i)*lattice(1,3) + (bpositions(ii,3)+j)*lattice(2,3) + (bpositions(ii,1)+k)*lattice(3,3)
     counter = counter + 1
    endif
   enddo
  enddo
 enddo
enddo

selfE = 0.0
otherE = 0.0

!Energy intra-cell

do i=1,nA
 do j=1,nA
  if (i.ne.j) then
   dist = distance(arealpositions(i,:),arealpositions(j,:))
   selfE = selfE + potentialAA(dist)
  endif
 enddo
enddo

do i=1,nB
 do j=1,nB
  if (i.ne.j) then
   dist = distance(brealpositions(i,:),brealpositions(j,:))
   selfE = selfE + potentialBB(dist)
  endif
 enddo
enddo

do i=1,nA
 do j=1,nB
  dist = distance(arealpositions(i,:),brealpositions(j,:))
  selfE = selfE + potentialAB(dist)
 enddo
enddo

!Energy of original unit cell with all other cells

do i=1,nA
 do j=1,nA*((conv*2 + 1)**3 - 1)
  dist = distance(arealpositions(i,:),atrasl(j,:))
  otherE = otherE + potentialAA(dist)
 enddo
 do j=1,nB*((conv*2 + 1)**3 - 1)
  dist = distance(arealpositions(i,:),btrasl(j,:))
  otherE = otherE + potentialAB(dist)
 enddo
enddo

do i=1,nB
 do j=1,nA*((conv*2 + 1)**3 - 1)
  dist = distance(brealpositions(i,:),atrasl(j,:))
  otherE = otherE + potentialAB(dist)
 enddo
 do j=1,nB*((conv*2 + 1)**3 - 1)
  dist = distance(brealpositions(i,:),btrasl(j,:))
  otherE = otherE + potentialBB(dist)
 enddo
enddo

totalE = selfE + otherE

print*, 'Self Energy:', selfE
print*, 'Other Energy:', otherE
print*, 'Total Energy:', totalE

end subroutine

double precision function potentialAA(r)

use potential

implicit none

real*8 r

potentialAA = A_AA*exp(-alphaAA*r**2 - betaAA*r - gammaAA*r**(0.5))

end function

double precision function potentialAB(r)

use potential

implicit none

real*8 r

potentialAB = A_AB*exp(-alphaAB*r**2 - betaAB*r - gammaAB*r**(0.5))

end function

double precision function potentialBB(r)

use potential

implicit none

real*8 r

potentialBB = A_BB*exp(-alphaBB*r**2 - betaBB*r - gammaBB*r**(0.5))

end function

double precision function distance(x,y)

real*8 x(3), y(3)

distance = ((x(1) - y(1))**2 + (x(2) - y(2))**2 + (x(3) - y(3))**2)**(0.5)

end function
