! **
 ! -----------------------------------------------------------------
 
 ! 两个或三个数的共同的最小素因子
 ! 模块实现重载
 ! 主函数中使用 use mut_MPF，一定要注意，use需要在IMPLICIT之前使用
 ! 即可使用函数 mut_MinPrimerFact

 ! Author: Ren Dexin
 ! Date: 2016/5/26

 ! -----------------------------------------------------------------

 include"isPrime.f90"



  !重载函数
  MODULE mut_MPF
    
    Implicit none
    
    !定义接口，虚拟子函数
    Interface mut_MinPrimerFact
      Module procedure MPF2

      Module procedure MPF3

    End Interface

    Contains

    Integer Function MPF2(a,b)
        Integer a,b
        Integer i
        Logical,external :: isPrime

        Do i = 2 , min(a,b)
          If(isPrime(i) .AND. mod(a,i) == 0 .AND. mod(b,i) == 0)Then
              MPF2 = i
            return
          Endif
        Enddo
  
        MPF2 = 1

    End Function

    Integer Function MPF3(a,b,c)
        Integer a,b,c
        Integer i
        Logical,external :: isPrime

        Do i = 2 , min(a,b,c)
          If(isPrime(i) .AND. mod(a,i) == 0 .AND. mod(b,i) == 0 .And. mod(c,i) == 0)Then
            MPF3 = i
            return
          Endif
        Enddo

        MPF3 = 1

    End Function

END MODULE

