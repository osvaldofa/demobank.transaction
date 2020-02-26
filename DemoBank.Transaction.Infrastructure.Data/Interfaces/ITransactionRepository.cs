using DemoBank.Transaction.Infrastructure.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace DemoBank.Transaction.Infrastructure.Data.Repositories
{
    public interface ITransactionRepository
    {
        long Save(TransactionModel transaction);
        TransactionModel[] GetTransactionsByAccountNumber(long accountNumber);
    }
}
