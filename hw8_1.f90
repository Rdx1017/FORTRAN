!**
! ------------------------------------------------------------------------------------
    
    ! 作业8.1 利用随机数函数产生若干个整数放在一个无格式顺序文件中
    !         然后删除其中的奇数
    
    ! Author Ren Dexin
    ! Date 2016/5/4
! ------------------------------------------------------------------------------------
    
    Program hw8_1
    
        Implicit None
        Integer i, number, n_num
        Real random_x
        
        !定义一个一维可变长数组
        Integer,Allocatable :: data_arr(:)
        
        !生成一个随机数种子
        Call RANDOM_SEED()
        
        Call RANDOM_NUMBER(random_x)
        
        !生成写入文件的数据个数
        n_num = floor(random_x * 100)
        
        !生成长度n_num的数组用来存放数据
        Allocate(data_arr(n_num))
        
        !打开一个mydata文件，属性为顺序存取 .and. 无格式
        Open(1,FILE = 'mydata',ACCESS = 'sequential', FORM = 'unformatted')
        
        Do i = 1, n_num
            Call RANDOM_NUMBER(random_x)
            number = floor(random_x * 100)
            !写入文件，因为为无格式文件，所以write不需要指定格式，包括（*）默认格式
            write(1) number            
        End Do
        
        !文件指针回退到第一个记录
        Rewind(1)
        
        Print*,'原来的数据是'
        
        Do i = 1, n_num
            Read(1,End = 100) data_arr(i)  
            Print*, data_arr(i)
        End do
        
100     continue
        !关闭文件
        Close(1)
        
        Open(1,FILE = 'mydata',ACCESS = 'sequential', FORM = 'unformatted')
        
        Do i = 1, n_num
            If(Mod(data_arr(i),2) == 0)Then
                write(1) data_arr(i)  
            End if
        End do
        
        Print*,'后来的数据是'
        Rewind(1)
        Do i = 1, n_num
            Read(1,End = 200) number
            Print*, number
        End do
        
200     Continue 
        
    !关闭文件
    Close(1)
    !释放数组内存
    Deallocate(data_arr)
        
    End Program
    
