!**
    ! ------------------------------------------------------------------------------
    
    !题目6．4 对已知自然数n，设计一个判断n是否为素数的子程序，并调用该子程序：
    !（1）将100～120共11个偶数分解为两个素数和的形式
    !（2）用READ语句读入一个自然数n，对n进行素因子分解。

    ! Author: Ren Dexin
    ! Date: 2016/5/5    
    
    ! ------------------------------------------------------------------------------
    
    Program hw6_4
    
    Implicit none
    Logical,external :: isPrime
    Integer,external :: min_primer_factor
    External dis_primer
    Integer number
    Integer i,j
    
    Print*,'Factor a number to a sum of two prime number'
    Do i = 100,120,2
        Do  j = 2,i/2
            If(isPrime(j) == .TRUE. .AND. isPrime(i - j) == .TRUE.)Then
                Print 10,i,' = ',j,' + ',i-j
                Exit
            Endif
        Enddo
    Enddo
    
10  Format(2X,I4,A4,I4,A4,I4)    

    Print*,'Please input a number'
    Read *,number
    Print 20,'Factors of ',number,'are :'
20  Format(2X,A12,I6,A8)    
    Call dis_primer(number)
    
    End Program
    
    !最小素因子
    Integer Function min_primer_factor(number)
    
    Implicit none
    Integer number,i
    
    DO i = 2,number
        If(mod(number,i) == 0)then
            min_primer_factor = i
            return
        Endif
    Enddo
    
    End function
    
    !递归进行素因子分解
    Recursive Subroutine dis_primer(number)
    
    Implicit none
    Integer number,now_min_fact
    Logical,external :: isPrime
    Integer,external :: min_primer_factor
    
    If(isPrime(number) == .TRUE.)then
        Print*,number
    Else
        now_min_fact = min_primer_factor(number)
        print*,now_min_fact
        Call dis_primer(number/now_min_fact)
    Endif    
    
    End subroutine