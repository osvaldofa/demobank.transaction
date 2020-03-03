Ë
pC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Domain\Interfaces\ITransactionServices.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Domain %
.% &

Interfaces& 0
{ 
public 

	interface  
ITransactionServices )
{ 
long 
CreateTransaction 
( 
TransactionModel /
transaction0 ;
); <
;< =
TransactionModel 
[ 
] '
TransactionsByAccountNumber 6
(6 7
long7 ;
accountNumber< I
)I J
;J K
}		 
}

 ÁU
mC:\Development\Test\DemoBank\DemoBank.Transaction\DemoBank.Transaction.Domain\Services\TransactionServices.cs
	namespace 	
DemoBank
 
. 
Transaction 
. 
Domain %
.% &
Services& .
{		 
public

 

class

 
TransactionServices

 $
:

% & 
ITransactionServices

' ;
{ 
private 
readonly "
ITransactionRepository /"
_transactionRepository0 F
;F G
private 
readonly 
IAccountRepository +
_accountRepository, >
;> ?
private 
readonly 
IAccountService (
_accountService) 8
;8 9
public 
TransactionServices "
(" #"
ITransactionRepository# 9!
transactionRepository: O
,O P
IAccountRepositoryQ c
accountRepositoryd u
,u v
IAccountService	w Ü
accountService
á ï
)
ï ñ
{ 	
this 
. "
_transactionRepository '
=( )!
transactionRepository* ?
;? @
this 
. 
_accountRepository #
=$ %
accountRepository& 7
;7 8
this 
. 
_accountService  
=! "
accountService# 1
;1 2
} 	
public 
long 
CreateTransaction %
(% &
TransactionModel& 6
transaction7 B
)B C
{ 	
switch 
( 
transaction 
.  
TransactionType  /
)/ 0
{ 
case   
TransactionTypes   %
.  % &
DEPOSIT  & -
:  - .
return!! $
CreateDepositTransaction!! 3
(!!3 4
transaction!!4 ?
)!!? @
;!!@ A
case"" 
TransactionTypes"" %
.""% &
WITHDRAW""& .
:"". /
return## %
CreateWithdrawTransaction## 4
(##4 5
transaction##5 @
)##@ A
;##A B
case$$ 
TransactionTypes$$ %
.$$% &
TRANSFER$$& .
:$$. /
return%% %
CreateTransferTransaction%% 4
(%%4 5
transaction%%5 @
)%%@ A
;%%A B
default&& 
:&& 
return'' 
$num'' 
;'' 
}(( 
throw)) 
new)) #
NotImplementedException)) -
())- .
))). /
;))/ 0
}** 	
public,, 
TransactionModel,, 
[,,  
],,  !'
TransactionsByAccountNumber,," =
(,,= >
long,,> B
accountNumber,,C P
),,P Q
{-- 	
if.. 
(.. 
AccountExists.. 
(.. 
accountNumber.. +
)..+ ,
).., -
return// 
this// 
.// "
_transactionRepository// 2
.//2 3*
GetTransactionsByAccountNumber//3 Q
(//Q R
accountNumber//R _
)//_ `
;//` a
return00 
null00 
;00 
}11 	
private33 
long33 $
CreateDepositTransaction33 -
(33- .
TransactionModel33. >
transaction33? J
)33J K
{44 	
if55 
(55 
transaction55 
!=55 
null55 #
)55# $
{66 
if77 
(77 
AccountExists77 !
(77! "
transaction77" -
?77- .
.77. /
DestinationAccount77/ A
)77A B
&&77C E
transaction77F Q
.77Q R
Value77R W
>77X Y
$num77Z [
)77[ \
{88 
if:: 
(:: 
this:: 
.:: 
_accountService:: ,
.::, - 
UpdateAccountBalance::- A
(::A B
transaction::B M
)::M N
)::N O
{;; 
transaction== #
.==# $
When==$ (
===) *
DateTime==+ 3
.==3 4
Now==4 7
;==7 8
long>> 
transactionId>> *
=>>+ ,
this>>- 1
.>>1 2"
_transactionRepository>>2 H
.>>H I
Save>>I M
(>>M N
transaction>>N Y
)>>Y Z
;>>Z [
return?? 
transactionId?? ,
;??, -
}@@ 
}AA 
}BB 
returnCC 
$numCC 
;CC 
}DD 	
privateFF 
longFF %
CreateWithdrawTransactionFF .
(FF. /
TransactionModelFF/ ?
transactionFF@ K
)FFK L
{GG 	
ifHH 
(HH 
transactionHH 
!=HH 
nullHH #
)HH# $
{II 
ifJJ 
(JJ 
AccountExistsJJ !
(JJ! "
transactionJJ" -
?JJ- .
.JJ. /
DestinationAccountJJ/ A
)JJA B
&&JJC E!
AccountEnoughtBalanceJJF [
(JJ[ \
transactionJJ\ g
.JJg h
DestinationAccountJJh z
,JJz {
transaction	JJ| á
.
JJá à
Value
JJà ç
)
JJç é
)
JJé è
{KK 
ifMM 
(MM 
thisMM 
.MM 
_accountServiceMM ,
.MM, - 
UpdateAccountBalanceMM- A
(MMA B
transactionMMB M
)MMM N
)MMN O
{NN 
transactionPP #
.PP# $
WhenPP$ (
=PP) *
DateTimePP+ 3
.PP3 4
NowPP4 7
;PP7 8
longQQ 
transactionIdQQ *
=QQ+ ,
thisQQ- 1
.QQ1 2"
_transactionRepositoryQQ2 H
.QQH I
SaveQQI M
(QQM N
transactionQQN Y
)QQY Z
;QQZ [
returnSS 
transactionIdSS ,
;SS, -
}TT 
}UU 
}VV 
returnWW 
$numWW 
;WW 
}XX 	
privateZZ 
longZZ %
CreateTransferTransactionZZ .
(ZZ. /
TransactionModelZZ/ ?
transactionZZ@ K
)ZZK L
{[[ 	
if\\ 
(\\ 
AccountExists\\ 
(\\ 
transaction\\ )
.\\) *
DestinationAccount\\* <
)\\< =
&&]] 
AccountExists]]  
(]]  !
transaction]]! ,
.]], -
OriginAccount]]- :
)]]: ;
&&^^ !
AccountEnoughtBalance^^ (
(^^( )
transaction^^) 4
.^^4 5
OriginAccount^^5 B
,^^B C
transaction^^D O
.^^O P
Value^^P U
)^^U V
)^^V W
{__ 
transactionaa 
.aa 
Whenaa  
=aa! "
DateTimeaa# +
.aa+ ,
Nowaa, /
;aa/ 0
longbb 
transactionIdbb "
=bb# $
thisbb% )
.bb) *"
_transactionRepositorybb* @
.bb@ A
SavebbA E
(bbE F
transactionbbF Q
)bbQ R
;bbR S
AccountModelee 
originAccountee *
=ee+ ,
thisee- 1
.ee1 2
_accountRepositoryee2 D
.eeD E
GetByIdeeE L
(eeL M
transactioneeM X
.eeX Y
OriginAccounteeY f
.eef g
AccountNumbereeg t
)eet u
;eeu v
originAccountff 
.ff 
Balanceff %
-=ff& (
transactionff) 4
.ff4 5
Valueff5 :
;ff: ;
thisgg 
.gg 
_accountRepositorygg '
.gg' (
Savegg( ,
(gg, -
originAccountgg- :
)gg: ;
;gg; <
AccountModelii 
destinationAccountii /
=ii0 1
thisii2 6
.ii6 7
_accountRepositoryii7 I
.iiI J
GetByIdiiJ Q
(iiQ R
transactioniiR ]
.ii] ^
DestinationAccountii^ p
.iip q
AccountNumberiiq ~
)ii~ 
;	ii Ä
destinationAccountjj "
.jj" #
Balancejj# *
+=jj+ -
transactionjj. 9
.jj9 :
Valuejj: ?
;jj? @
thiskk 
.kk 
_accountRepositorykk '
.kk' (
Savekk( ,
(kk, -
destinationAccountkk- ?
)kk? @
;kk@ A
returnmm 
transactionIdmm $
;mm$ %
}nn 
returnoo 
$numoo 
;oo 
}pp 	
privaterr 
boolrr 
AccountExistsrr "
(rr" #
AccountModelrr# /
accountrr0 7
)rr7 8
{ss 	
iftt 
(tt 
accounttt 
?tt 
.tt 
AccountNumbertt &
>tt' (
$numtt) *
&&uu 
thisuu 
.uu 
_accountRepositoryuu *
.uu* +
GetByIduu+ 2
(uu2 3
accountuu3 :
.uu: ;
AccountNumberuu; H
)uuH I
!=uuJ L
nulluuM Q
)uuQ R
returnvv 
truevv 
;vv 
returnww 
falseww 
;ww 
}xx 	
privatezz 
boolzz 
AccountExistszz "
(zz" #
longzz# '
accountNumberzz( 5
)zz5 6
{{{ 	
if|| 
(|| 
accountNumber|| 
>|| 
$num||  !
&&}} 
this}} 
.}} 
_accountRepository}} *
.}}* +
GetById}}+ 2
(}}2 3
accountNumber}}3 @
)}}@ A
!=}}B D
null}}E I
)}}I J
return~~ 
true~~ 
;~~ 
return 
false 
; 
}
ÄÄ 	
private
ÇÇ 
bool
ÇÇ #
AccountEnoughtBalance
ÇÇ *
(
ÇÇ* +
AccountModel
ÇÇ+ 7
account
ÇÇ8 ?
,
ÇÇ? @
double
ÇÇA G
value
ÇÇH M
)
ÇÇM N
{
ÉÉ 	
AccountModel
ÑÑ 
accountFound
ÑÑ %
=
ÑÑ& '
this
ÑÑ( ,
.
ÑÑ, - 
_accountRepository
ÑÑ- ?
.
ÑÑ? @
GetById
ÑÑ@ G
(
ÑÑG H
account
ÑÑH O
.
ÑÑO P
AccountNumber
ÑÑP ]
)
ÑÑ] ^
;
ÑÑ^ _
if
ÖÖ 
(
ÖÖ 
accountFound
ÖÖ 
?
ÖÖ 
.
ÖÖ 
Balance
ÖÖ %
>
ÖÖ& '
value
ÖÖ( -
)
ÖÖ- .
return
ÜÜ 
true
ÜÜ 
;
ÜÜ 
return
áá 
false
áá 
;
áá 
}
àà 	
}
ââ 
}ää 