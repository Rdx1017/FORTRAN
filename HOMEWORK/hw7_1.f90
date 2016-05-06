! **
    ! ---------------------------------------------------------------------------------
        !INTEGER I,J
        !      REAL X,Y
        !      READ(*,10)I,X,J,Y
        !设要求输入的值为I=87，X=67.4，J=465，Y=345.705
        !用下面的FORMAT语句应如何输入数据？

    ! Author: Ren Dexin
    ! Date: 2016/5/5    
    ! --------------------------------------------------------------------------------
    
    Program hw7_1
    
    Implicit none
    
    Integer i,j
    Real x,y
    
        !The first format
        Print*,'The first format'
        Read(*,10) i,x,j,y
        !maybe you need input("-"means space)
        !-87--67.4--465--345.705
10      Format(1X,I4,F6.2,I5,F8.2)
        Print*,'Your inputed data :', i,x,j,y
    
        !The second format
        Print*,'The second format'
        Read(*,20) i,x,j,y
        !-87----67.4------465---345.705
20      Format(1X,2(I4,2X,F10.2))
        Print*,'Your inputed data :', i,x,j,y
        
        !The third format
        Print*,'The third format'
        Read(*,30) i,x,j,y
        !87--67.4$\ENTER$
        !46--345.705
30      Format(I4,F6.2/I5,F8.2)
        Print*,'Your inputed data :', i,x,j,y
        
        !The fourth format
        Print*,'The fourth format'
        Read(*,40) i,x,j,y
        !87$\ENTER$
        !67.4$\ENTER$
        !465$\ENTER$
        !345.705
40      Format(I4/F6.2/I5/F8.2)
        Print*,'Your inputed data :', i,x,j,y
        
        !The fifth format
        Print*,'The fifth format'
        Read(*,50) i,x,j,y
        !87---67.4$\ENTER$
        !465--345.705$\ENTER$
50      Format(I5,F8.1)
        Print*,'Your inputed data :', i,x,j,y
        
        !The sixth format
        Print*,'The sixth format'
        Read(*,60) i,x,j,y
        !87--67.4----465--345.705
60      Format(I4,F8.1,I5,F10.2,I6,F10.3)
        Print*,'Your inputed data :', i,x,j,y
        
    
    
    
    
    
    End Program