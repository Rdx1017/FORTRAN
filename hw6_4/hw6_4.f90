!**
    ! ------------------------------------------------------------------------------
    
    !��Ŀ6��4 ����֪��Ȼ��n�����һ���ж�n�Ƿ�Ϊ�������ӳ��򣬲����ø��ӳ���
    !��1����100��120��11��ż���ֽ�Ϊ���������͵���ʽ
    !��2����READ������һ����Ȼ��n����n���������ӷֽ⡣

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
    
    !��С������
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
    
    !�ݹ���������ӷֽ�
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