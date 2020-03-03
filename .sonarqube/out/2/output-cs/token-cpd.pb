Ä
C:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Communication\Interfaces\IAccountService.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Communication. ;
{ 
public 

	interface 
IAccountService $
{ 
bool  
UpdateAccountBalance !
(! "
TransactionModel" 2
transaction3 >
)> ?
;? @
} 
}		 ¯
~C:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Infrastructure.Communication\Services\AccountService.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Infrastructure -
.- .
Communication. ;
.; <
Services< D
{ 
public 

class 
AccountService 
:  !
IAccountService" 1
{		 
private

 
readonly

 
ILogger

  
<

  !
AccountService

! /
>

/ 0
_logger

1 8
;

8 9
private 
readonly 
IConfiguration '
_config( /
;/ 0
private 
readonly 

HttpClient #

httpClient$ .
;. /
public 
AccountService 
( 
ILogger %
<% &
AccountService& 4
>4 5
logger6 <
,< =
IConfiguration> L
configM S
)S T
{ 	
this 
. 
_logger 
= 
logger !
;! "
this 
. 
_config 
= 
config !
;! "
this 
. 

httpClient 
= 
new !

HttpClient" ,
(, -
)- .
;. /
} 	
public 
bool  
UpdateAccountBalance (
(( )
TransactionModel) 9
transaction: E
)E F
{ 	
string 

accountURL 
= 
this  $
.$ %
_config% ,
[, -
$str- @
]@ A
+B C
$strD G
+H I
transactionJ U
.U V
DestinationAccountV h
.h i
AccountNumberi v
;v w
this 
. 
_logger 
. 
LogInformation '
(' (
$str( P
+Q R

accountURLS ]
)] ^
;^ _
HttpResponseMessage 
response  (
=) *

httpClient+ 5
.5 6
PutAsJsonAsync6 D
(D E

accountURLE O
,O P
transactionQ \
)\ ]
.] ^
Result^ d
;d e
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
return 
true 
; 
return 
false 
; 
}   	
}!! 
}"" 