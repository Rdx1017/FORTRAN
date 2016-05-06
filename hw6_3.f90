!**
    ! --------------------------------------------------------------------------------
    
    !���һ������n! �ĺ����ӳ��򣬲����ø��ӳ��������e�Ľ���ֵ���� n!>1E8ʱֹͣ���㡣
    !ʹ��������ʵ��
    
    ! Author: Ren Dexin
    ! Date: 2016/5/5    
    
    ! --------------------------------------------------------------------------------
    
    Program hw6_3
    
    Implicit none
    Integer*8 :: max_fact_val = 1E8
    Real*8 re_exp
    Real*8,external :: exp_val
    
    re_exp = exp_val(max_fact_val)
    
    Print*,'The value of e is:'
    Print*,re_exp
    
    End Program
    
    Real*8 Function exp_val(max_fact_val)
        
        Implicit none
        Integer*8 max_fact_val
        !��������n_num�Ľ׳˴���max_fact_val
        Integer,external :: n_num
        Integer max_loc
        External factorial
        Integer i
        Real*8,Allocatable :: fact(:)
        
        max_loc = n_num(max_fact_val)
        Allocate(fact(max_loc + 1))
        
        fact(1) = 1
        
        !fact(n+1) = n!
        Call factorial(fact(2:max_loc+1),max_loc)
        
        Do i = 1+1, max_loc+1
               fact(i) =  1 / fact(i)
        End do
        
        exp_val = sum(fact)
        
    End Function
    
    !�����������鳤�ȣ�Ҳ���ǽ׳˴���10^8��n
    Integer Function n_num(max_fact_val)
    
        Implicit none
        Integer*8 max_fact_val
        Integer :: i = 1
        Integer*8 :: now_result = 1
    
        DO while(now_result < max_fact_val)
            now_result = now_result * i
            i = i + 1
        Enddo
        
        n_num = i
    
    End function
    
    !�����Ӧ����ֵ�Ľ׳�
    Subroutine factorial(fact,max_loc)
    
        Implicit none
        Real*8 :: fact(:)
        Integer max_loc
        Integer i
        fact(1) = 1
        
        Do i = 2 , max_loc
            fact(i) = fact(i - 1) * i
        Enddo

    End subroutine
    
    
    
    
    
    