subroutine allocatepos

use globals

implicit none

ALLOCATE (apositions(nA,3))
ALLOCATE (bpositions(nB,3))
ALLOCATE (arealpositions(nA,3))
ALLOCATE (brealpositions(nB,3))
ALLOCATE (atrasl(nA*((conv*2 + 1)**3 - 1),3))
ALLOCATE (btrasl(nB*((conv*2 + 1)**3 - 1),3))

end subroutine
