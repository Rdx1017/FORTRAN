!ģ����������f��x��
Module DIFF_EQ
    Implicit None
    Contains
    Real*8 Function f(x,y)
        Real*8 :: x,y
        f = y ** 2 * cos(x)      !�û�����f��x��
    End Function
    
    End Module
    
    !ģ�����������n����x��y��k
    Module DATA_RK
    
    Use DIFF_EQ
    Implicit None
    !Real*8 :: y_np1, k1, k2, k3, k4
    Real :: h
    Common /h/ h
    !Real*8,Save :: x, y
    
    Type rk_n_data
        Real*8 :: y_np1, xn, yn, k1, k2, k3, k4
    End Type
    Type(rk_n_data) now_data
    
    Type now_pos
        Real*8 :: x, y
    End Type
    Type(now_pos) now_xy
    
    Contains 
    !����n+1��x��y
    Subroutine Cal_pos(now_data, now_xy)
        Implicit None
        Real :: h
        common /h/ h
        Type(rk_n_data) :: now_data
        Type(now_pos) now_xy
        
        now_data.xn = now_xy.x
        now_data.yn = now_xy.y
        
        now_data.k1 = f(now_data.xn,now_data.yn)
        now_data.k2 = f(now_data.xn + h/2,now_data.yn + h/2 * now_data.k1)
        now_data.k3 = f(now_data.xn + h/2,now_data.yn + h/2 * now_data.k2)
        now_data.k4 = f(now_data.xn + h,now_data.yn + h * now_data.k3) 
        now_data.y_np1 = now_data.yn + h/6 * (now_data.k1 + 2 * now_data.k2 + 2 * now_data.k3 + now_data.k4)
        
        now_xy.x = now_data.xn + h
        now_xy.y = now_data.y_np1
        
    End Subroutine
    
    End Module
    
    
    
    
    Program main
    
    
    Use DATA_RK
    Implicit None
    Real*8 :: Needed_x
    Integer :: step
    Integer :: i
    
    !f��x����ֵ
    now_xy.x = 0
    now_xy.y = 1
    
    Print* , '�����������ֵ���Ա���ֵ' 
    Read* , needed_x
    
    Print*, '�����벽��(������)'
    Read* , step
    
    !����
    h = needed_x/step
    
    Do i = 1 , step 
        Call Cal_pos(now_data, now_xy)
    End Do
    
    Print 100 ,'Ҫ��ĵ�', needed_x,'�ĺ���ֵ��', now_xy.y 
    
100 Format(1x,A10,F6.2,A12,F14.8)
    
    End Program