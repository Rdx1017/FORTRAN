!**
  ! --------------------------------------------------------------------

  ! 判断是否为素数
  
  ! Author: Ren Dexin
  ! Date: 2016/5/26

  !--------------------------------------------------------------------

  Logical Function isPrime(number)

    Implicit none
    Integer i,number

    Do i = 2 , number/2
      If(mod(number,i) == 0) Then
        isPrime = .FALSE.
        return
      Endif
    Enddo

    isPrime = .TRUE.

  End Function
