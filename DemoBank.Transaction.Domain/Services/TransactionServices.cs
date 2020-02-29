using DemoBank.Transaction.CrossCutting.Enumerators;
using DemoBank.Transaction.Domain.Interfaces;
using DemoBank.Transaction.Infrastructure.Communication;
using DemoBank.Transaction.Infrastructure.Data.Models;
using DemoBank.Transaction.Infrastructure.Data.Repositories;
using Microsoft.Extensions.Logging;
using System;

namespace DemoBank.Transaction.Domain.Services
{
    public class TransactionServices : ITransactionServices
    {
        private readonly ITransactionRepository _transactionRepository;        
        private readonly IAccountService _accountService;
        private readonly ILogger<TransactionServices> _logger;

        /// <summary>
        /// Constructor method.
        /// </summary>
        /// <param name="transactionRepository">Transaction repository instantiated by dependency injection.</param>
        /// <param name="accountService">Account service integration instantiated by dependency injection.</param>
        /// <param name="logger">Logger component.</param>
        public TransactionServices(ITransactionRepository transactionRepository, IAccountService accountService, ILogger<TransactionServices> logger)
        {
            this._transactionRepository = transactionRepository;
            this._accountService = accountService;
            this._logger = logger;
        }

        public long CreateTransaction(TransactionModel transaction)
        {
            switch (transaction.TransactionType)
            {
                case TransactionTypes.DEPOSIT:
                    return CreateDepositTransaction(transaction);
                case TransactionTypes.WITHDRAW:
                    return CreateWithdrawTransaction(transaction);
                case TransactionTypes.TRANSFER:
                    return CreateTransferTransaction(transaction);
                default:
                    return 0;
            }
            throw new NotImplementedException();
        }

        public TransactionModel[] TransactionsByAccountNumber(long accountNumber)
        {
            return this._transactionRepository.GetTransactionsByAccountNumber(accountNumber);
         
        }

        private long CreateDepositTransaction(TransactionModel transaction)
        {
            if (transaction != null)
            {
                // If external Account update.
                if (this._accountService.UpdateAccountBalance(transaction))
                {
                    // Transaction registration.
                    transaction.When = DateTime.Now;
                    long transactionId = this._transactionRepository.Save(transaction);
                    return transactionId;
                }             
            }                
            return 0;
        }

        private long CreateWithdrawTransaction(TransactionModel transaction)
        {
            if (transaction != null)
            {
                // If external Account update.
                if (this._accountService.UpdateAccountBalance(transaction))
                {
                    // Transaction registration.
                    transaction.When = DateTime.Now;
                    long transactionId = this._transactionRepository.Save(transaction);

                    return transactionId;
                }             
            }
            return 0;
        }

        private long CreateTransferTransaction(TransactionModel transaction)
        {
            long transactionId = 0;

            if (this._accountService.UpdateAccountBalance(transaction))
            {
                // Transaction registration.
                transaction.When = DateTime.Now;
                transactionId = this._transactionRepository.Save(transaction);
            }                
            
            return transactionId;
        }

       /* private bool AccountExists(AccountModel account)
        {
            if (account?.AccountNumber > 0
                && this._accountService.GetById(account.AccountNumber) != null)
                return true;
            return false;
        }

        private bool AccountExists(long accountNumber)
        {
            if (accountNumber > 0
                && this._accountService.GetById(accountNumber) != null)
                return true;
            return false;
        }

        private bool AccountEnoughtBalance(AccountModel account, double value)
        {
            AccountModel accountFound = this._accountService.GetById(account.AccountNumber);

            if (accountFound?.Balance > value)
                return true;
            return false;
        }*/
    }
}
