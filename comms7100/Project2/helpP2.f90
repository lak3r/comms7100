module helpP2
	implicit none
	
	contains
	!general purpose 
		! AV: http://computer-programming-forum.com/49-fortran/4075a24f74fcc9ce.ht
		subroutine lowerCase(word)
		! convert a word to lower case
			character (len=*) , intent(in out) :: word
			integer                            :: i,ic,nlen
			nlen = len(word)
			do i=1,nlen
			   ic = ichar(word(i:i))
			   if (ic >= 65 .and. ic < 90) word(i:i) = char(ic+32)
			end do
		end subroutine lowerCase
		
	!maths
		function makeG(cell) result(G)
			!This is hardcoded
			real(8), intent(in) :: cell(6)
			real(8), dimension(3,3) :: G
			real(8) :: pi
			
			pi = 3.1415927410125732421875
			
			G(1,1) = cell(1) * cell(1) * cos(0.0)
			G(1,2) = cell(1) * cell(2) * cos(cell(6)*(pi/180))
			G(1,3) = cell(1) * cell(3) * cos(cell(5)*(pi/180))
			
			G(2,1) = cell(2) * cell(1) * cos(cell(6)*(pi/180))
			G(2,2) = cell(2) * cell(2) * cos(0.0)
			G(2,3) = cell(2) * cell(3) * cos(cell(4)*(pi/180))
			
			G(3,1) = cell(3) * cell(1) * cos(cell(5)*(pi/180))
			G(3,2) = cell(3) * cell(2) * cos(cell(4)*(pi/180))
			G(3,3) = cell(3) * cell(3) * cos(0.0)
			
		end function makeG
		
		function findM(cell) result(M)
			real(8), intent(in) :: cell(6)
			real(8), dimension(3,3) :: M
			real(8) :: pi, toRad
			
			pi = 3.1415927410125732421875
			toRad = pi/180
			
			M(1,1) = cell(1)
			M(1,2) = cell(2) * cos(cell(6) * toRad)
			M(1,3) = cell(3) * cos(cell(5) * toRad)
			
			M(2,1) = 0.0
			M(2,2) = cell(2) * sin(cell(6) * toRad)
			M(2,3) = (cell(3)*(cos(cell(4)*toRad)-(cos(cell(5)*toRad)*cos(cell(6)*toRad))))/sin(cell(6)*toRad)
			
			M(3,1) = 0.0
			M(3,2) = 0.0
			M(3,3) = (cell(3) * ( &
						sin(cell(6) * toRad) **2 - &
						( cos(cell(4)*toRad)**2 + cos(cell(5)*toRad)**2 - &
						2 * cos(cell(4)*toRad) * cos(cell(5)*toRad) * cos(cell(6)*toRad)))**0.5 )&
						/ sin(cell(6) * toRad)
			
		end function findM
		
		
end module helpP2