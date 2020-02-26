ä,
oC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Api\Controllers\TransactionController.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Presentation +
.+ ,
Controllers, 7
{ 
[ 
Route 

(
 
$str 
)  
]  !
[ 
ApiController 
] 
public 

class !
TransactionController &
:' (
ControllerBase) 7
{ 
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly  
ITransactionServices - 
_transactionServices. B
;B C
public !
TransactionController $
($ % 
ITransactionServices% 9
transactionServices: M
,M N
ILoggerO V
<V W!
TransactionControllerW l
>l m
loggern t
)t u
{ 	
this 
.  
_transactionServices %
=& '
transactionServices( ;
;; <
this 
. 
_logger 
= 
logger !
;! "
} 	
[## 	
HttpPost##	 
]## 
public$$ 
ActionResult$$ 
<$$ 
long$$  
>$$  !
CreateTransaction$$" 3
($$3 4
TransactionModel$$4 D
transaction$$E P
)$$P Q
{%% 	
long&& 
transactionId&& 
=&&  
$num&&! "
;&&" #
if'' 
('' 
ValidateTransaction'' #
(''# $
transaction''$ /
)''/ 0
)''0 1
transactionId(( 
=(( 
this((  $
.(($ % 
_transactionServices((% 9
.((9 :
CreateTransaction((: K
(((K L
transaction((L W
)((W X
;((X Y
if** 
(** 
transactionId** 
==**  
$num**! "
)**" #
{++ 
_logger,, 
.,, 
LogError,,  
(,,  !
$str,,! D
),,D E
;,,E F
return-- 

BadRequest-- !
(--! "
$str--" =
)--= >
;--> ?
}.. 
else// 
{00 
_logger11 
.11 
LogInformation11 &
(11& '
$str11' N
+22 
transaction22 !
.22! "
DestinationAccount22" 4
.224 5
AccountNumber225 B
+33 
$str33 !
+33" #
transaction33$ /
.33/ 0
TransactionType330 ?
+33@ A
$str33B W
+33X Y
transactionId33Z g
)33g h
;33h i
return44 
transactionId44 $
;44$ %
}55 
}66 	
[== 	
HttpGet==	 
(== 
$str== "
)==" #
]==# $
public>> 
ActionResult>> 
<>> 
TransactionModel>> ,
[>>, -
]>>- .
>>>. /*
GetTransactionsByAccountNumber>>0 N
(>>N O
long>>O S
accountNumber>>T a
)>>a b
{?? 	
TransactionModel@@ 
[@@ 
]@@ 
transactions@@ +
=@@, -
this@@. 2
.@@2 3 
_transactionServices@@3 G
.@@G H'
TransactionsByAccountNumber@@H c
(@@c d
accountNumber@@d q
)@@q r
;@@r s
ifAA 
(AA 
transactionsAA 
==AA 
nullAA  $
)AA$ %
{BB 
_loggerCC 
.CC 
LogErrorCC  
(CC  !
$strCC! K
+CCL M
accountNumberCCN [
)CC[ \
;CC\ ]
returnDD 
UnprocessableEntityDD *
(DD* +
)DD+ ,
;DD, -
}EE 
elseFF 
returnGG 
transactionsGG #
;GG# $
}HH 	
privateLL 
boolLL 
ValidateTransactionLL (
(LL( )
TransactionModelLL) 9
transactionLL: E
)LLE F
{MM 	
ifNN 
(NN 1
%ValidateTransactionDestinationAccountNN 5
(NN5 6
transactionNN6 A
)NNA B
&&OO $
ValidateTransactionValueOO +
(OO+ ,
transactionOO, 7
)OO7 8
)OO8 9
returnPP 
truePP 
;PP 
returnQQ 
falseQQ 
;QQ 
}RR 	
privateTT 
boolTT 1
%ValidateTransactionDestinationAccountTT :
(TT: ;
TransactionModelTT; K
transactionTTL W
)TTW X
{UU 	
ifVV 
(VV 
transactionVV 
?VV 
.VV 
DestinationAccountVV /
?VV/ 0
.VV0 1
AccountNumberVV1 >
>VV? @
$numVVA B
)VVB C
returnWW 
trueWW 
;WW 
returnXX 
falseXX 
;XX 
}YY 	
private[[ 
bool[[ $
ValidateTransactionValue[[ -
([[- .
TransactionModel[[. >
transaction[[? J
)[[J K
{\\ 	
if]] 
(]] 
transaction]] 
?]] 
.]] 
Value]] "
>]]# $
$num]]% &
)]]& '
return^^ 
true^^ 
;^^ 
return__ 
false__ 
;__ 
}`` 	
}dd 
}ee ’
ZC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Api\InjectorBase.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Presentation +
{		 
public 

abstract 
class 
InjectorBase &
{ 
public 
void 
ConfigureInjections '
(' (
IServiceCollection( :
service; B
)B C
{ 	&
ConfigureServiceInjections &
(& '
service' .
). /
;/ 0)
ConfigureRepositoryInjections )
() *
service* 1
)1 2
;2 3
} 	
private 
void &
ConfigureServiceInjections /
(/ 0
IServiceCollection0 B
serviceC J
)J K
{ 	
service 
. 
AddSingleton  
(  !
typeof! '
(' ( 
ITransactionServices( <
)< =
,= >
typeof? E
(E F
TransactionServicesF Y
)Y Z
)Z [
;[ \
service"" 
."" 
AddSingleton""  
(""  !
typeof""! '
(""' (
IAccountService""( 7
)""7 8
,""8 9
typeof"": @
(""@ A
AccountService""A O
)""O P
)""P Q
;""Q R
}## 	
private%% 
void%% )
ConfigureRepositoryInjections%% 2
(%%2 3
IServiceCollection%%3 E
service%%F M
)%%M N
{&& 	
service(( 
.(( 
AddSingleton((  
(((  !
typeof((! '
(((' (
IAccountRepository((( :
)((: ;
,((; <
typeof((= C
(((C D
AccountRepository((D U
)((U V
)((V W
;((W X
service++ 
.++ 
AddSingleton++  
(++  !
typeof++! '
(++' (
ICustomerRepository++( ;
)++; <
,++< =
typeof++> D
(++D E
CustomerRepository++E W
)++W X
)++X Y
;++Y Z
service.. 
... 
AddSingleton..  
(..  !
typeof..! '
(..' ("
ITransactionRepository..( >
)..> ?
,..? @
typeof..A G
(..G H!
TransactionRepository..H ]
)..] ^
)..^ _
;.._ `
}// 	
}00 
}11 ·
UC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Api\Program.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Presentation +
{ 
public 

class 
Program 
{ 
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{

 	 
CreateWebHostBuilder  
(  !
args! %
)% &
.& '
Build' ,
(, -
)- .
.. /
Run/ 2
(2 3
)3 4
;4 5
} 	
public 
static 
IWebHostBuilder % 
CreateWebHostBuilder& :
(: ;
string; A
[A B
]B C
argsD H
)H I
=>J L
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 
ConfigureLogging !
(! "

logBuilder" ,
=>- /
{ 

logBuilder 
. 
ClearProviders -
(- .
). /
;/ 0

logBuilder 
. 

AddConsole )
() *
)* +
;+ ,

logBuilder 
. 
AddTraceSource -
(- .
$str. L
)L M
;M N
} 
) 
. 

UseStartup 
< 
Startup #
># $
($ %
)% &
;& '
} 
} ì
UC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Api\Startup.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Presentation +
{ 
public 

class 
Startup 
: 
InjectorBase '
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public%% 
void%% 
ConfigureServices%% %
(%%% &
IServiceCollection%%& 8
services%%9 A
)%%A B
{&& 	
services'' 
.'' 
AddMvc'' 
('' 
)'' 
.'' #
SetCompatibilityVersion'' 5
(''5 6 
CompatibilityVersion''6 J
.''J K
Version_2_2''K V
)''V W
;''W X
ConfigureInjections** 
(**  
services**  (
)**( )
;**) *
services,, 
.,, 
AddSwaggerGen,, "
(,," #
c,,# $
=>,,% '
{-- 
c.. 
... 

SwaggerDoc.. 
(.. 
$str.. !
,..! "
new..# &
	Microsoft..' 0
...0 1
OpenApi..1 8
...8 9
Models..9 ?
...? @
OpenApiInfo..@ K
{..L M
Title..N S
=..T U
$str..V d
,..d e
Version..f m
=..n o
$str..p t
}..u v
)..v w
;..w x
}// 
)// 
;// 
}00 	
public77 
void77 
	Configure77 
(77 
IApplicationBuilder77 1
app772 5
,775 6
IHostingEnvironment777 J
env77K N
)77N O
{88 	
if99 
(99 
env99 
.99 
IsDevelopment99 !
(99! "
)99" #
)99# $
{:: 
app;; 
.;; %
UseDeveloperExceptionPage;; -
(;;- .
);;. /
;;;/ 0
app>> 
.>> 

UseSwagger>> 
(>> 
)>>  
;>>  !
appBB 
.BB 
UseSwaggerUIBB  
(BB  !
cBB! "
=>BB# %
{CC 
cDD 
.DD 
SwaggerEndpointDD %
(DD% &
$strDD& @
,DD@ A
$strDDB S
)DDS T
;DDT U
}EE 
)EE 
;EE 
}FF 
elseGG 
{HH 
appJJ 
.JJ 
UseHstsJJ 
(JJ 
)JJ 
;JJ 
}KK 
appMM 
.MM 
UseHttpsRedirectionMM #
(MM# $
)MM$ %
;MM% &
appNN 
.NN 
UseMvcNN 
(NN 
)NN 
;NN 
}OO 	
}PP 
}QQ 