using System;
using System.Collections.Generic;
using System.Text;
using DemoBank.Transaction.Infrastructure.Data.Models;

namespace DemoBank.Transaction.Infrastructure.Data.Repositories
{
    public interface IAccountRepository
    {
        long Save(AccountModel account);
        AccountModel GetById(long AccountNumber);        
    }
}
