using DemoBank.Transaction.Infrastructure.Data.Models;

namespace DemoBank.Transaction.Domain.Interfaces
{
    public interface ITransactionServices
    {
        long CreateTransaction(TransactionModel transaction);
        TransactionModel[] TransactionsByAccountNumber(long accountNumber);
    }
}
