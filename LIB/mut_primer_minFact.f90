! **
  ! --------------------------------------------------------

  ! 返回两个或三个参数共同的最小素因子
  
  ! Author: Ren Dexin
  ! Date: 2016/5/26
  
  ! ********************************************
  
  ! 对于不定参数函数，需要在调用函数中使用interface来实现接口
  ! 格式如下：

  !Interface
  !   Integer Function mut_primer_minFact(a,b,c)
  !   Implicit none
  !   Integer :: a,b
  !   Integer,optional :: c
  !   End Function
  !End Interface   

  ! --------------------------------------------------------

  include"isPrime.f90"

  Integer Function mut_primer_minFact(a,b,c)

    Implicit none
    Integer :: a, b
    !optional设置c定义c为不定参数（不定个数参数）
    Integer,Optional :: c

    If(PRESENT(c))Then
      mut_primer_minFact = mut_PMF3(a,b,c)
    Else
      mut_primer_minFact = mut_PMF2(a,b)
    Endif

  CONTAINS
    
    Integer Function mut_PMF3(a,b,c)
      Implicit none
      Integer a, b, c
      Integer i
      Logical,external :: isPrime

      Do i = 2 , min(a,b,c)
        If(isPrime(i) .AND. mod(a,i) == 0 .AND. mod(b,i) == 0 .And. mod(c,i) == 0)Then
          mut_PMF3 = i 
          return
        Endif
      Enddo
      
      mut_PMF3 = 1

    End Function
    
    Integer Function mut_PMF2(a,b)
      
      Implicit none 
      Integer a,b
      Integer i
      Logical,external :: isPrime

      Do i = 2 , min(a,b)
        If(isPrime(i) .AND. mod(a,i) == 0 .AND. mod(b,i) == 0)Then
          mut_PMF2 = i
          return
        Endif
      Enddo
    
      mut_PMF2 = 1

      End Function

  End Function
