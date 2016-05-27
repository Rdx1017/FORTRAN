# USING FORTRAN
**AUTHOR: Ren Dexin**

---
## 数据和运算

> INTEGER(n), REAL(n), COMPLEX(n)

>CHARACTER(n), LOGICAL(.true. & .false.)

>Fortran中，复数用一对括号表示(real,aimag),real和aimage。

>CHARACTER([len = ]n) name,字符型变量有n个字符。

    字符串 str = 'hello ustc' , 取字串str[a:b]

    字符串连接 str1 // str2
```
.LT. <-> <
.LE. <-> <=
.EQ. <-> ==
.NE. <-> /=
.GT. <-> >
.GE. <-> >=
```
```
.AND. .OR. .NOT.
```
**PARAMETER(常量)**

    Integer pi
    Parameter (pi = 3.14)

>**END:** 只能在主程序单元中使用，终止整个程序运行。

>**STOP[integer|string]:** 终止程序运行，主程序、模块、子程序中使用，停止运行，并输出信息。

>**PAUSE[integer|string]:** 暂停语句。

---
## 常用标准函数


```
COS(X) ACOS(x)
SIN(x) ASIN(x)
TAN(x) ATAN(x)
SQRT(x)
EXP(X)
LOG(X)
LOG10(X)
ABS(X)

REAL(x)
AIMAGE(complex) 虚部 IMAG(x)
CMPLX(x[,y])

INT(X) 取整
AINT(x[,kind]) x取整并转化为实数。
SIGN(x,y) |x|*y/|y|
MAX(X1,X2,...)
MIN(X1,X2,...)
MOD(m,n)
KIND(x)
FLOOR(x) 小于等于x的最大整数

```
**数组运算**
```
ANY(m[,D])
MAXLOC(arr[,d])
MAXVAL(arr[,d])
MINLOC,MICVAL
    d=1，列的最大（最小）值（索引）
    d=2，行
    省略d，全数组最大值
RESHAPE(a,m)
SHAPE(a)
SIZE(a,[,d])
SUM(a[,d])
TRANSPOSE(a) 转置

```

## 语法

**选择结构**
```
! ***
If(< .TRUE. >) <what to do>

! ***
If(< .TRUE.>)Then
  [do what]
Else if (<.TRUE.>)Then
  [do what]  
Else
  [do what]
End if

! ***
Select case(<n>)
  case (<1,3>)
    <do what>
  case (<4:10>)
    <do what>
  case default
    <do what>
End select
```

**循环结构**

> EXIT,CYCLE,CONTINUE,GOTO

```
! ***
Do i = a,b,step
  <do what>
End do

! ***
Do while(<.TRUE.>)
  <do what>
End do

! ***
Do  
  <do what>
  If(.true.) exit
End do

```

## 数组

**索引从m到n**
>Integer arr(m:n)

```
arr(m1:n1[:step])
arr(:n1)
arr(m1:)
arr(:)
```

**赋值**
1. arr = (/data,(k,k = 1,3,5)/)

2. arr = RESHAPE((data),(dim1,dim2,...))

3. data arr/data/

**WHERE**
```
   Where(arr|><=|num) <do what>

! ***
   Where(<.true.>)
      <赋值语句>
   ElseWhere(<.true>)
      <do what>
   ElseWhere
      <do what>
   End Where
```
**FORALL**

>Forall([i=1:m,arr1(i)<m]) do what for arr1or2(i)

**动态数组**
```
Integer, Dimension(:[,:]), Allocatable::arr
Integer,Allocatable::arr(:[,:])

Allocate(arr(size))

Allocated(arr)
Deallocate(arr)
```

## 结构体和模块
**定义结构体**
```
Type name
  <Intger p1
  Type(otype) otpname
  ... >
End Type name
```

**结构体变量**
> Type(name) :: typename

> Type(name) :: typename = name(data)

> Read*,typename.p1

**引用**

> typename.p1

> typename.otpname.op1

> . <=> %

**结构体数组**

> Type(name) :: typearr(num)

**指针（引用）**
```
Integer,Target::a
Integer,Pointer::p=>a
p=2
```
指向结构体的指针
>Type(name),Pointer::pty

**模块**
```
Module name
  Implicit none
  Integer p
  ...
  
  Contains
    Subroutine and Function
```

Use module 需要放在Implicit之前。

## 文件读取

> Open( [Unit =] 1,file = 'filename',access = 'sequential or direct',form = '[un]formatted' )

> Close(1)

> Write(unit,format) data

> Read(unit,format) data
