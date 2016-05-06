! **
    ! --------------------------------------------------------------------------------
    
    !求50以内的勾股数，即求满足A的平方加B的平方等于C的平方的A、B、C。要求:
    !1. A、B和C均小于或等于50，且没有重复解。
    !例如，A=3，B=4，C=5及A=4，B=3，C=5即是重复解。
    !2. 格式化输出结果，例如 3^2+4^2=5^2
    
    !Author: Ren Dexin
    !Date: 2016/5/5
    
    ! --------------------------------------------------------------------------------
    Program hw7
    
    Implicit None
    
    Type TRIPLE
        !保存三个勾股数
        Integer min_a
        integer b,c
        !定义一个next指针指向下一个结点
        Type(TRIPLE),Pointer::next
    End Type
    
    Integer :: max_a = 50
    Integer i, j, k
    Logical,external :: is_triple_num
    
    !定义头指针head，当前节点指针now和flag指针
    Type(TRIPLE),Pointer :: head, now, flag
    
    Allocate(now)
    !flag跟随尾节点走
    flag => now
    !head不动
    head => flag
    
    Print*,'50以内的勾股数有：'
    
    Do i = 1, floor(max_a/sqrt(3.))
        Do j = i, max_a
            Do k = j, max_a
                If(is_triple_num(i, j, k))then
                    flag.min_a = i
                    flag.b = j
                    flag.c = k
                    
                    !打印数据
                    Print 100, i, j, k
                    
                    !重新分配一个节点，保存下一个数据
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
    
    !销毁链表
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
    
    !判断a,b,c是否构成勾股数，且 a <= b < c
    Logical function is_triple_num(a,b,c)
    
        Implicit None
        Integer a, b, c
        
        If((a**2 + b**2 == c**2).AND.(a .NE. 0))Then
            is_triple_num = .TRUE.
        else
            is_triple_num = .FALSE.
        Endif
    
    End function
    
    