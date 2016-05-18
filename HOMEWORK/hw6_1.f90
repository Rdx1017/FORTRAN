!**
    ! ---------------------------------------------------------------------------------
    
    !题目6.1 设计一个求向量叉乘的子程序，用主程序调用求任意两个向量的数学叉乘值。

    ! Author: Ren Dexin
    ! Date: 2016/5/5
    
    ! ---------------------------------------------------------------------------------
    
    Program hw6_1
    
    Implicit None
    
    Integer :: a(3),b(3),c(3)
    External cross
    
    Print*,'Please the first vector:'
    Read*,a
    
    Print*,'Please the second vector:'
    Read*,b
    
    Call cross(a,b,c)
    
    Print*,'Result: ',c
    
    End Program
    
    Subroutine cross(a,b,c)
        Implicit none
        
        Integer a(:),b(:),c(:)
        
        c(1) = a(2)*b(3) - a(3)*b(2)
        c(2) = a(1)*b(3) - a(3)*b(1)
        c(3) = a(1)*b(2) - a(2)*b(1)    
    
    End subroutine
    
    
