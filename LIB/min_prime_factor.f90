! **
 ! ------------------------------------------------------------

    ! 返回参数number的最小素因子

    ! Author: Ren Dexin
    ! Date: 2016/5/26

 ! ------------------------------------------------------------

  include"isPrime.f90"

  Integer Function min_prime_factor(number)
    
    Implicit none
    Integer number, i
    Logical,External :: isPrime

    Do i = 2 , number
      If(mod(number,i) == 0)Then
        min_prime_factor = i
        exit
      Endif
    Enddo

  End Function
