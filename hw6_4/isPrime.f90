!**
    ! --------------------------------------------------------------
    
    !判断是否为素数，是素数，返回True
    
    !Author: Ren Dexin
    !Date: 2016/5/5
    
    ! --------------------------------------------------------------
    
    Logical Function isPrime(number)
    
    Implicit None
    Integer i,number
    
    Do i = 2 , number/2
        If(mod(number,i) == 0)Then
            isPrime = .FALSE.
            return
        Endif
    Enddo
    
    isPrime = .TRUE.
    
    End Function
    
    
    
    
    