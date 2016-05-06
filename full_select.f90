
Program main

    Implicit None
    Integer,Allocatable::txt(:,:)
    Integer,Allocatable::ele_txt(:)
    Integer,Allocatable::Selected_fre(:)
    External Select_group
    Real*8 :: rate

    Integer :: a(3),n,i,j,ele,now_group(3)

    Open(1,FILE = 'C:\Users\Rdx\Desktop\data.txt' )

    Read(1,*) a
    !ele��Ԫ�أ�n����
    n = a(2)
    ele = a(1)
    
    !ele_txt���ÿ�������ֵĴ���
    Allocate(ele_txt(ele))
    !ǰ�������������ĸ��ǳ��ִ����ܺͣ�������Ǳ��,���Ϊ0��δʹ�ã����Ϊ-1��ѡ�񣬱��Ϊ+n����ʹ��n��
    Allocate(txt(n,5))
    !��δ��ѡ���������±��Ӧ��Ԫ��Ϊ0��ѡ����Ϊ��1,����sum(Selected_fre)Ϊ�����ָ���
    Allocate(Selected_fre(ele))
    ele_txt = 0
    txt = 0
    Selected_fre = 0

    Do i = 1,n
    Read(1,*,End = 100) a
    forall(j = 1:3) txt(i,j) = a(j)
    forall(j = 1:3) ele_txt(a(j)) = ele_txt(a(j))+1
    Enddo

    Close(1)
    
100 Print*,'�ļ���ȡ������'
    Print*,'ѡȡ������Ϊ��'
    
    forall(i = 1:n) txt(i,4) = ele_txt(txt(i,1)) + ele_txt(txt(i,2)) + ele_txt(txt(i,3))
    
    Do While(Minval(Selected_fre) == 0)
        Call Select_group(txt,n,now_group)
        forall(i = 1:3) Selected_fre(now_group(i)) = Selected_fre(now_group(i)) + 1
        print*,now_group
    Enddo
    
    rate = sum(Selected_fre)/Real(ele)
    Print*,'��ѡ������������Ϊ��'
    print*,sum(Selected_fre)
    Print*,'�ظ���Ϊ'
    Print 200,rate
200 Format(5x,f8.4)
    
    Deallocate(ele_txt,txt,Selected_fre)
    end
    
    !ѡ������������飬�ظ�������С��ʹ�ô�����С
    Subroutine Select_group(txt,n,now_group)
        Implicit none
        Integer n,txt(:,:),now_group(:)
        Integer i,now_i,j,k
        Integer::weight = 0
        
        now_i = 1
        
        Do i = 1,n-1
            if((txt(i,4) < txt(now_i,4) .AND. txt(i,5) == txt(now_i,5)) .OR. (txt(i,5) < txt(now_i,5)))Then
                now_i = i
            Endif    
        Enddo
        
        now_group(1:3) = txt(now_i,1:3)
        txt(now_i,5) = n
        
        !������ѡ�����ظ����飬��Ȩ
        Do i = 1,n  
            weight = 0
            Do j = 1,3
                Do k = 1,3
                    if(now_group(j) == txt(i,k))Then
                        weight = weight + 1
                    Endif
                Enddo
            Enddo
            txt(i,5)  = txt(i,5) + 2 * weight
        End do
        
        
    End Subroutine
    
    
