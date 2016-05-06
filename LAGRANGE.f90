Program main
    
    Implicit None
    Integer :: n = 0 , n_x = 0
    !ѭ������
    Integer :: i = 0, j = 0
    !���嶯̬����
    Real*8 , ALLOCATABLE :: x0(:), f_x0(:)
    !������ֵ
    Real*8 , ALLOCATABLE :: x(:), f_x(:)
    !lagrange��������ֵ
    Real*8 , External :: lagrange
    
    
    !������֪������
    Print * , '��������֪��ĸ�����INTEGER��'
100 Read * , n
    
    If(n .LE. 0)Then
        Print* , '������һ����������INTEGER��'
        goto 100
    Else
        !���������ڴ�ռ䣬���鳤��Ϊn
        Allocate(x0( n ),f_x0( n ))
        !Allocate(f_x0(n))
        !Allocate(ln_x0(n))
        x0 = 0.
        f_x0 = 0.
    End If
    
    Print* , '��������֪���Ա������ֵ�� n�� ����ʹ�ÿո�򶺺Ÿ�����'
    Read * , x0
    
    Print* , '�������Ӧ���������ֵ�� n�� ����ʹ�ÿո�򶺺Ÿ�����'
    Read * , f_x0
    
    
    
    !�����������Ա���
    Print* , '�����������ĸ�����INTEGER��'
200 Read* , n_x
    
    If(n_x .LE. 0)Then
        Print* , '������һ����������INTEGER��'
        goto 200
    Else
        !���������ڴ�ռ䣬���鳤��Ϊn
        Allocate(x( n_x ),f_x( n_x ))
        x = 0.
        f_x = 0.
    End If
    
    Print* , '������Ҫ����Ա������ֵ����ʹ�ÿո�򶺺Ÿ�����'
    Read * , x
    
    Do i = 1 , n_x
        !Function lagrange(x0, f_x0, x)
        f_x(i) = lagrange(x0, f_x0, x(i))
        Print 300 , '�Ա���',x(i) ,'�����', f_x(i)
    End Do
300 Format(1x,2(A10,F10.3))    
    
    !print*, (x(i),f_x(i),i = 1,n_x)
    
    !If(Allocated(x0)) Deallocate(x0)
    !�ͷ������ڴ�ռ�
    Deallocate(x0,f_x0,x,f_x)
    
    End Program main
    
    
    Function lagrange(x0, f_x0, x)
        
        Implicit None
        Real*8 :: lagrange
        Real*8 :: x0(:), f_x0(:), x
        Integer :: n = 0 , i = 0 , j = 0
        Real*8 , ALLOCATABLE :: ln_x0(:)

        n = Size( x0 )
        
        If(n .LE. 0)Then
            Print* , '�������ô��󣨴����������'
            Return
        Else
            !���������ڴ�ռ�
            Allocate(ln_x0(n))
            ln_x0 = 1.  
        End If
        
        !��ÿһ��li(x)
        Do i = 1 , n
            Do j = 1 , n
                If(j .NE. i) Then
                    ln_x0(i) = ln_x0(i) * ((x - x0(j))/(x0(i) - x0(j)))
                Else
                    Cycle
                End If            
            End Do
        End Do
        
        !Ҫ���ֵ
        lagrange = sum(f_x0 * ln_x0)
        
        
        If(Allocated(ln_x0))Then
            Deallocate(ln_x0)
        End If
        
        Return
    End Function
    
    
    