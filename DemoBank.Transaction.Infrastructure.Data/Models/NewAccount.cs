﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoBank.Transaction.Infrastructure.Data.Models
{
    public class NewAccount
    {
        public long CustomerId { get; set; }
        public double InitialCredit { get; set; }
    }
}
