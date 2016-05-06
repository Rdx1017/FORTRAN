!**
! --------------------------------------------------------------------------
    
    !文件中的数据已经按照从小到大的顺序排列，一个记录中放一个整数.
    !请将任意一个数插入到文件中去，插入后文件中的数仍然有序.
    
    !Author: Ren Dexin
    !Date: 2016/5/4
    
! --------------------------------------------------------------------------
    
    
    
    Program hw8_2
    
        Implicit None
        
        Integer now_num, n_num, i
        Real random_real_num
        Integer randnum
        External force_sort
        
        Integer,Allocatable :: data(:)
        
        call RANDOM_SEED
        call RANDOM_NUMBER(random_real_num)
        randnum = floor(100 * random_real_num)
        
        
        !默认无格式文件
        Open(1,FILE = 'C:\Users\Rdx\Documents\FORTRAN\HW\hw8_1\doc\mydata',FORM = 'unformatted')
        
        !遍历查询文件中数据个数
         i = 0
        Do while(.TRUE.)
            Read(1,End = 100)
            i = i + 1
        End DO
100     Continue
        
        !添加一个数，总数加1
        n_num = i + 1
        
        Allocate(data(n_num))
        
        !指针回绕，读取数据
        Rewind(1)
        Do i = 1,n_num - 1
            Read(1) data(i)
        Enddo
        !数组中添加新增加的数
        data(n_num) = randnum
        
        !数组排序
        Call force_sort(data,n_num)
        
        !指针回绕，重新写入数据
        Rewind(1)
        Do i = 1,n_num
            Write(1),data(i)
            print*,data(i)
        Enddo
        
    Deallocate(data)
    End Program