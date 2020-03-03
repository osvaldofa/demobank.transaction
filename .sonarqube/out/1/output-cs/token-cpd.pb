Ñ
{C:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Interfaces\IAccountRepository.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Repositories3 ?
{ 
public 

	interface 
IAccountRepository '
{		 
long

 
Save

 
(

 
AccountModel

 
account

 &
)

& '
;

' (
AccountModel 
GetById 
( 
long !
AccountNumber" /
)/ 0
;0 1
} 
} Ñ
|C:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Interfaces\ICustomerRepository.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Repositories3 ?
{ 
public 

	interface 
ICustomerRepository (
{		 
CustomerModel

 
GetById

 
(

 
long

 "

customerId

# -
)

- .
;

. /
} 
} š
C:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Interfaces\ITransactionRepository.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Repositories3 ?
{ 
public 

	interface "
ITransactionRepository +
{		 
long

 
Save

 
(

 
TransactionModel

 "
transaction

# .
)

. /
;

/ 0
TransactionModel 
[ 
] *
GetTransactionsByAccountNumber 9
(9 :
long: >
accountNumber? L
)L M
;M N
} 
} õ
qC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Models\AccountModel.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Models3 9
{ 
public 

class 
AccountModel 
{ 
public 
long 
AccountNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
CustomerModel 
CustomerReference .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
double 
Balance 
{ 
get  #
;# $
set% (
;( )
}* +
public 
AccountModel 
( 
long  
accountNumber! .
,. /
CustomerModel0 =
customer> F
,F G
doubleH N
balanceO V
)V W
{ 	
this 
. 
AccountNumber 
=  
accountNumber! .
;. /
this 
. 
CustomerReference "
=# $
customer% -
;- .
this 
. 
Balance 
= 
balance "
;" #
} 	
} 
} ¼
rC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Models\CustomerModel.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Models3 9
{ 
public 

class 
CustomerModel 
{ 
public		 
long		 

CustomerId		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
public 
CustomerModel 
( 
long !

customerId" ,
,, -
string. 4
name5 9
,9 :
string; A
surnameB I
)I J
{ 	
this 
. 

CustomerId 
= 

customerId (
;( )
this 
. 
Name 
= 
name 
; 
this 
. 
Surname 
= 
surname "
;" #
} 	
} 
} ç
oC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Models\NewAccount.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Models3 9
{ 
public 

class 

NewAccount 
{		 
public

 
long

 

CustomerId

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
double 
InitialCredit #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} þ

uC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Models\TransactionModel.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Models3 9
{ 
public 

class 
TransactionModel !
{ 
public 
long 
TransactionId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
AccountModel 
DestinationAccount .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public		 
AccountModel		 
OriginAccount		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
public

 
double

 
Value

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
TransactionType %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
When 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ….
|C:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Repositories\AccountRepository.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Repositories3 ?
{ 
public 

class 
AccountRepository "
:# $
IAccountRepository% 7
{ 
private		 
List		 
<		 
AccountModel		 !
>		! "
Accounts		# +
;		+ ,
public 
AccountRepository  
(  !
)! "
{ 	
this 
. 
Accounts 
= 
new 
List  $
<$ %
AccountModel% 1
>1 2
(2 3
)3 4
;4 5
CustomerModel 
	customerA #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> D
,D E
$strF K
)K L
;L M
CustomerModel 
	customerB #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> F
,F G
$strH O
)O P
;P Q
CustomerModel 
	customerC #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> E
,E F
$strG P
)P Q
;Q R
this 
. 
Accounts 
. 
Add 
( 
new !
AccountModel" .
(. /
$num/ 3
,3 4
	customerA5 >
,> ?
$num@ E
)E F
)F G
;G H
this 
. 
Accounts 
. 
Add 
( 
new !
AccountModel" .
(. /
$num/ 3
,3 4
	customerB5 >
,> ?
$num@ G
)G H
)H I
;I J
this 
. 
Accounts 
. 
Add 
( 
new !
AccountModel" .
(. /
$num/ 3
,3 4
	customerC5 >
,> ?
$num@ H
)H I
)I J
;J K
} 	
public!! 
AccountModel!! 
GetById!! #
(!!# $
long!!$ (
accountNumber!!) 6
)!!6 7
{"" 	
if## 
(## 
accountNumber## 
==##  
$num##! "
)##" #
return$$ 
null$$ 
;$$ 
else%% 
{&& 
var(( 
accounts(( 
=(( 
from(( #
a(($ %
in((& (
this(() -
.((- .
Accounts((. 6
where)) $
a))% &
.))& '
AccountNumber))' 4
==))5 7
accountNumber))8 E
select** %
a**& '
;**' (
if++ 
(++ 
accounts++ 
.++ 
ToList++ #
<++# $
AccountModel++$ 0
>++0 1
(++1 2
)++2 3
.++3 4
Count++4 9
==++: <
$num++= >
)++> ?
{,, 
return-- 
null-- 
;--  
}.. 
else// 
return00 
accounts00 #
?00# $
.00$ %
First00% *
(00* +
)00+ ,
;00, -
}11 
}22 	
public44 
long44 
Save44 
(44 
AccountModel44 %
account44& -
)44- .
{55 	
if77 
(77 
GetById77 
(77 
account77 
.77  
AccountNumber77  -
)77- .
!=77/ 1
null772 6
)776 7
{88 
AccountModel99 
accountExistent99 ,
=99- .
this99/ 3
.993 4
Accounts994 <
.99< =
Find99= A
(99A B
a99B C
=>99D F
a99G H
.99H I
AccountNumber99I V
==99W Y
account99Z a
.99a b
AccountNumber99b o
)99o p
;99p q
CopyAccount:: 
(:: 
account:: #
,::# $
accountExistent::% 4
)::4 5
;::5 6
return;; 
account;; 
.;; 
AccountNumber;; ,
;;;, -
}<< 
else== 
{>> 
long@@ 
max@@ 
=@@ 
this@@ 
.@@  
Accounts@@  (
.@@( )
Select@@) /
(@@/ 0
a@@0 1
=>@@2 4
a@@5 6
.@@6 7
AccountNumber@@7 D
)@@D E
.@@E F
Max@@F I
(@@I J
)@@J K
;@@K L
accountBB 
.BB 
AccountNumberBB %
=BB& '
maxBB( +
+BB, -
$numBB. /
;BB/ 0
thisCC 
.CC 
AccountsCC 
.CC 
AddCC !
(CC! "
accountCC" )
)CC) *
;CC* +
returnEE 
accountEE 
.EE 
AccountNumberEE ,
;EE, -
}FF 
}GG 	
privateII 
voidII 
CopyAccountII  
(II  !
AccountModelII! -
accountAII. 6
,II6 7
AccountModelII8 D
accountBIIE M
)IIM N
{JJ 	
accountBKK 
.KK 
BalanceKK 
=KK 
accountAKK '
.KK' (
BalanceKK( /
;KK/ 0
}LL 	
}MM 
}NN Œ
}C:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Repositories\CustomerRepository.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Repositories3 ?
{ 
public 

class 
CustomerRepository #
:$ %
ICustomerRepository& 9
{		 
private

 
List

 
<

 
CustomerModel

 "
>

" #
	Customers

$ -
;

- .
public 
CustomerRepository !
(! "
)" #
{ 	
this 
. 
	Customers 
= 
new  
List! %
<% &
CustomerModel& 3
>3 4
(4 5
)5 6
;6 7
this 
. 
	Customers 
. 
Add 
( 
new "
CustomerModel# 0
(0 1
$num1 5
,5 6
$str7 =
,= >
$str? D
)D E
)E F
;F G
this 
. 
	Customers 
. 
Add 
( 
new "
CustomerModel# 0
(0 1
$num1 5
,5 6
$str7 ?
,? @
$strA H
)H I
)I J
;J K
this 
. 
	Customers 
. 
Add 
( 
new "
CustomerModel# 0
(0 1
$num1 5
,5 6
$str7 >
,> ?
$str@ J
)J K
)K L
;L M
} 	
public 
CustomerModel 
GetById $
($ %
long% )

customerId* 4
)4 5
{ 	
var 
	customers 
= 
from  
c! "
in# %
this& *
.* +
	Customers+ 4
where !
c" #
.# $

CustomerId$ .
==/ 1

customerId2 <
select "
c# $
;$ %
return 
	customers 
. 
First "
(" #
)# $
;$ %
}   	
}!! 
}"" ã
€C:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Data\Repositories\TransactionRepository.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Data. 2
.2 3
Repositories3 ?
{ 
public		 

class		 !
TransactionRepository		 &
:		' ("
ITransactionRepository		) ?
{

 
private 
List 
< 
TransactionModel %
>% &
Transactions' 3
;3 4
public !
TransactionRepository $
($ %
)% &
{ 	
this 
. 
Transactions 
= 
new  #
List$ (
<( )
TransactionModel) 9
>9 :
(: ;
); <
;< =
TransactionModel 
transaction (
=) *
new+ .
TransactionModel/ ?
(? @
)@ A
;A B
CustomerModel 
customer "
=# $
new% (
CustomerModel) 6
(6 7
$num7 ;
,; <
$str= C
,C D
$strE J
)J K
;K L
AccountModel 
destinationAccount +
=, -
new. 1
AccountModel2 >
(> ?
$num? C
,C D
customerE M
,M N
$numO P
)P Q
;Q R
transaction 
. 
DestinationAccount *
=+ ,
destinationAccount- ?
;? @
transaction 
. 
TransactionId %
=& '
$num( .
;. /
transaction 
. 
Value 
= 
$num  #
;# $
transaction 
. 
TransactionType '
=( )
TransactionTypes* :
.: ;
DEPOSIT; B
;B C
transaction 
. 
When 
= 
DateTime '
.' (
Now( +
;+ ,
this 
. 
Transactions 
. 
Add !
(! "
transaction" -
)- .
;. /
} 	
public## 
TransactionModel## 
[##  
]##  !*
GetTransactionsByAccountNumber##" @
(##@ A
long##A E
accountNumber##F S
)##S T
{$$ 	
var%% 
transactions%% 
=%% 
from%% #
t%%$ %
in%%& (
this%%) -
.%%- .
Transactions%%. :
where&& $
t&&% &
.&&& '
DestinationAccount&&' 9
.&&9 :
AccountNumber&&: G
==&&H J
accountNumber&&K X
select'' %
t''& '
;''' (
return(( 
transactions(( 
.((  
ToArray((  '
(((' (
)((( )
;(() *
})) 	
public00 
long00 
Save00 
(00 
TransactionModel00 )
transaction00* 5
)005 6
{11 	
long22 
newId22 
=22 
this22 
.22 
Transactions22 *
.22* +
Select22+ 1
(221 2
t222 3
=>224 6
t227 8
.228 9
TransactionId229 F
)22F G
.22G H
Max22H K
(22K L
)22L M
+22N O
$num22P Q
;22Q R
transaction33 
.33 
TransactionId33 %
=33& '
newId33( -
;33- .
this44 
.44 
Transactions44 
.44 
Add44 !
(44! "
transaction44" -
)44- .
;44. /
return66 
newId66 
;66 
}77 	
}88 
}99 