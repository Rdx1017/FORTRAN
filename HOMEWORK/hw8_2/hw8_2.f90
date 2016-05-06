!**
! --------------------------------------------------------------------------
    
    !�ļ��е������Ѿ����մ�С�����˳�����У�һ����¼�з�һ������.
    !�뽫����һ�������뵽�ļ���ȥ��������ļ��е�����Ȼ����.
    
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
        
        
        !Ĭ���޸�ʽ�ļ�
        Open(1,FILE = 'C:\Users\Rdx\Documents\FORTRAN\HW\hw8_1\doc\mydata',FORM = 'unformatted')
        
        !������ѯ�ļ������ݸ���
         i = 0
        Do while(.TRUE.)
            Read(1,End = 100)
            i = i + 1
        End DO
100     Continue
        
        !���һ������������1
        n_num = i + 1
        
        Allocate(data(n_num))
        
        !ָ����ƣ���ȡ����
        Rewind(1)
        Do i = 1,n_num - 1
            Read(1) data(i)
        Enddo
        !��������������ӵ���
        data(n_num) = randnum
        
        !��������
        Call force_sort(data,n_num)
        
        !ָ����ƣ�����д������
        Rewind(1)
        Do i = 1,n_num
            Write(1),data(i)
            print*,data(i)
        Enddo
        
    Deallocate(data)
    End Program