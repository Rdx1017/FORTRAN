!±©¡¶≈≈–Ú
    Subroutine force_sort(x,n_num)
        
        Implicit none
        Integer x(:),n_num
        Integer, Allocatable :: y(:)
        Integer i
        
        Allocate(y(n_num))
        
        forall(i = 1:n_num) y(i) = x(i)
        
        do i = 1,size(y)
            x(i) = minval(y)
            y(minloc(y)) = maxval(y)+1
        end do

        
    Deallocate(y) 
    End Subroutine