using DemoBank.Transaction.Infrastructure.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace DemoBank.Transaction.Infrastructure.Data.Repositories
{
    public interface ICustomerRepository
    {
        CustomerModel GetById(long customerId);
    }
}
