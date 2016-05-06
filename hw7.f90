! **
    ! --------------------------------------------------------------------------------
    
    !��50���ڵĹ���������������A��ƽ����B��ƽ������C��ƽ����A��B��C��Ҫ��:
    !1. A��B��C��С�ڻ����50����û���ظ��⡣
    !���磬A=3��B=4��C=5��A=4��B=3��C=5�����ظ��⡣
    !2. ��ʽ�������������� 3^2+4^2=5^2
    
    !Author: Ren Dexin
    !Date: 2016/5/5
    
    ! --------------------------------------------------------------------------------
    Program hw7
    
    Implicit None
    
    Type TRIPLE
        !��������������
        Integer min_a
        integer b,c
        !����һ��nextָ��ָ����һ�����
        Type(TRIPLE),Pointer::next
    End Type
    
    Integer :: max_a = 50
    Integer i, j, k
    Logical,external :: is_triple_num
    
    !����ͷָ��head����ǰ�ڵ�ָ��now��flagָ��
    Type(TRIPLE),Pointer :: head, now, flag
    
    Allocate(now)
    !flag����β�ڵ���
    flag => now
    !head����
    head => flag
    
    Print*,'50���ڵĹ������У�'
    
    Do i = 1, floor(max_a/sqrt(3.))
        Do j = i, max_a
            Do k = j, max_a
                If(is_triple_num(i, j, k))then
                    flag.min_a = i
                    flag.b = j
                    flag.c = k
                    
                    !��ӡ����
                    Print 100, i, j, k
                    
                    !���·���һ���ڵ㣬������һ������
                    Allocate(now)
                    flag.next => now
                    flag => flag.next
                Endif
            ENDDO
        ENDDO
    ENDDO
    
100 Format(1X,I2,'^2 + ',I2,'^2 = ',I2,'^2')    
    
    Deallocate(now)
    flag.next => NULL()
    
    !��������
    Do
        now => head
        head => head.next
        Deallocate(now)
        
        If(Associated(head))Then
            Deallocate(head)
            goto 200
        Endif   
    Enddo
200 Continue
    
    
    End Program
    
    !�ж�a,b,c�Ƿ񹹳ɹ��������� a <= b < c
    Logical function is_triple_num(a,b,c)
    
        Implicit None
        Integer a, b, c
        
        If((a**2 + b**2 == c**2).AND.(a .NE. 0))Then
            is_triple_num = .TRUE.
        else
            is_triple_num = .FALSE.
        Endif
    
    End function
    
    