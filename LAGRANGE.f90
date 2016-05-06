Program main
    
    Implicit None
    Integer :: n = 0 , n_x = 0
    !循环变量
    Integer :: i = 0, j = 0
    !定义动态数组
    Real*8 , ALLOCATABLE :: x0(:), f_x0(:)
    !所求点的值
    Real*8 , ALLOCATABLE :: x(:), f_x(:)
    !lagrange函数返回值
    Real*8 , External :: lagrange
    
    
    !读入已知点坐标
    Print * , '请输入已知点的个数（INTEGER）'
100 Read * , n
    
    If(n .LE. 0)Then
        Print* , '请输入一个正整数（INTEGER）'
        goto 100
    Else
        !分配数组内存空间，数组长度为n
        Allocate(x0( n ),f_x0( n ))
        !Allocate(f_x0(n))
        !Allocate(ln_x0(n))
        x0 = 0.
        f_x0 = 0.
    End If
    
    Print* , '请输入已知的自变量点的值（ n个 ，请使用空格或逗号隔开）'
    Read * , x0
    
    Print* , '请输入对应的因变量的值（ n个 ，请使用空格或逗号隔开）'
    Read * , f_x0
    
    
    
    !读入所求点的自变量
    Print* , '请输入所求点的个数（INTEGER）'
200 Read* , n_x
    
    If(n_x .LE. 0)Then
        Print* , '请输入一个正整数（INTEGER）'
        goto 200
    Else
        !分配数组内存空间，数组长度为n
        Allocate(x( n_x ),f_x( n_x ))
        x = 0.
        f_x = 0.
    End If
    
    Print* , '请输入要求的自变量点的值（请使用空格或逗号隔开）'
    Read * , x
    
    Do i = 1 , n_x
        !Function lagrange(x0, f_x0, x)
        f_x(i) = lagrange(x0, f_x0, x(i))
        Print 300 , '自变量',x(i) ,'因变量', f_x(i)
    End Do
300 Format(1x,2(A10,F10.3))    
    
    !print*, (x(i),f_x(i),i = 1,n_x)
    
    !If(Allocated(x0)) Deallocate(x0)
    !释放数组内存空间
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
            Print* , '函数调用错误（传入参数错误）'
            Return
        Else
            !分配数组内存空间
            Allocate(ln_x0(n))
            ln_x0 = 1.  
        End If
        
        !求每一项li(x)
        Do i = 1 , n
            Do j = 1 , n
                If(j .NE. i) Then
                    ln_x0(i) = ln_x0(i) * ((x - x0(j))/(x0(i) - x0(j)))
                Else
                    Cycle
                End If            
            End Do
        End Do
        
        !要求的值
        lagrange = sum(f_x0 * ln_x0)
        
        
        If(Allocated(ln_x0))Then
            Deallocate(ln_x0)
        End If
        
        Return
    End Function
    
    
    