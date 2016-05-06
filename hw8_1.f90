!**
! ------------------------------------------------------------------------------------
    
    ! ��ҵ8.1 ��������������������ɸ���������һ���޸�ʽ˳���ļ���
    !         Ȼ��ɾ�����е�����
    
    ! Author Ren Dexin
    ! Date 2016/5/4
! ------------------------------------------------------------------------------------
    
    Program hw8_1
    
        Implicit None
        Integer i, number, n_num
        Real random_x
        
        !����һ��һά�ɱ䳤����
        Integer,Allocatable :: data_arr(:)
        
        !����һ�����������
        Call RANDOM_SEED()
        
        Call RANDOM_NUMBER(random_x)
        
        !����д���ļ������ݸ���
        n_num = floor(random_x * 100)
        
        !���ɳ���n_num�����������������
        Allocate(data_arr(n_num))
        
        !��һ��mydata�ļ�������Ϊ˳���ȡ .and. �޸�ʽ
        Open(1,FILE = 'mydata',ACCESS = 'sequential', FORM = 'unformatted')
        
        Do i = 1, n_num
            Call RANDOM_NUMBER(random_x)
            number = floor(random_x * 100)
            !д���ļ�����ΪΪ�޸�ʽ�ļ�������write����Ҫָ����ʽ��������*��Ĭ�ϸ�ʽ
            write(1) number            
        End Do
        
        !�ļ�ָ����˵���һ����¼
        Rewind(1)
        
        Print*,'ԭ����������'
        
        Do i = 1, n_num
            Read(1,End = 100) data_arr(i)  
            Print*, data_arr(i)
        End do
        
100     continue
        !�ر��ļ�
        Close(1)
        
        Open(1,FILE = 'mydata',ACCESS = 'sequential', FORM = 'unformatted')
        
        Do i = 1, n_num
            If(Mod(data_arr(i),2) == 0)Then
                write(1) data_arr(i)  
            End if
        End do
        
        Print*,'������������'
        Rewind(1)
        Do i = 1, n_num
            Read(1,End = 200) number
            Print*, number
        End do
        
200     Continue 
        
    !�ر��ļ�
    Close(1)
    !�ͷ������ڴ�
    Deallocate(data_arr)
        
    End Program
    
