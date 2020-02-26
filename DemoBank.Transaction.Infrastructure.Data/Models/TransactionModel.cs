using System;

namespace DemoBank.Transaction.Infrastructure.Data.Models
{
    public class TransactionModel
    {
        public long TransactionId { get; set; }
        public AccountModel DestinationAccount { get; set; }
        public AccountModel OriginAccount { get; set; }
        public double Value { get; set; }
        public string TransactionType { get; set; }
        public DateTime When { get; set; }

    }
}
