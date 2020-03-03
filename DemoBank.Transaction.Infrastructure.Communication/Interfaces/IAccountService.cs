using DemoBank.Transaction.Infrastructure.Data.Models;

namespace DemoBank.Transaction.Infrastructure.Communication
{
    public interface IAccountService
    {
        bool UpdateAccountBalance(TransactionModel transaction);

        //AccountModel GetById(long accountNumber);
    }
}
