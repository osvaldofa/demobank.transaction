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
        private readonly IAccountRepository _accountRepository;
        private readonly IAccountService _accountService;
        private readonly ILogger<TransactionServices> _logger;

        /// <summary>
        /// Constructor method.
        /// </summary>
        /// <param name="transactionRepository">Transaction repository instantiated by dependency injection.</param>
        /// <param name="accountRepository">Account repository instantiated by dependency injection.</param>
        public TransactionServices(ITransactionRepository transactionRepository, IAccountRepository accountRepository, IAccountService accountService, ILogger<TransactionServices> logger)
        {
            this._transactionRepository = transactionRepository;
            this._accountRepository = accountRepository;
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
            if (AccountExists(accountNumber))
                return this._transactionRepository.GetTransactionsByAccountNumber(accountNumber);
            return null;
        }

        private long CreateDepositTransaction(TransactionModel transaction)
        {
            if (transaction != null)
            {
                if (AccountExists(transaction?.DestinationAccount) && transaction.Value > 0)
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
            }                
            return 0;
        }

        private long CreateWithdrawTransaction(TransactionModel transaction)
        {
            if (transaction != null)
            {
                if (AccountExists(transaction?.DestinationAccount) && AccountEnoughtBalance(transaction.DestinationAccount, transaction.Value))
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
            }
            return 0;
        }

        private long CreateTransferTransaction(TransactionModel transaction)
        {
            if (AccountExists(transaction.DestinationAccount)
                && AccountExists(transaction.OriginAccount)
                && AccountEnoughtBalance(transaction.OriginAccount, transaction.Value))
            {
                // Transaction registration.
                transaction.When = DateTime.Now;
                long transactionId = this._transactionRepository.Save(transaction);

                // Account update.
                AccountModel originAccount = this._accountRepository.GetById(transaction.OriginAccount.AccountNumber);
                originAccount.Balance -= transaction.Value;
                this._accountRepository.Save(originAccount);

                AccountModel destinationAccount = this._accountRepository.GetById(transaction.DestinationAccount.AccountNumber);
                destinationAccount.Balance += transaction.Value;
                this._accountRepository.Save(destinationAccount);

                return transactionId;
            }
            return 0;
        }

        private bool AccountExists(AccountModel account)
        {
            if (account?.AccountNumber > 0
                && this._accountRepository.GetById(account.AccountNumber) != null)
                return true;
            return false;
        }

        private bool AccountExists(long accountNumber)
        {
            if (accountNumber > 0
                && this._accountRepository.GetById(accountNumber) != null)
                return true;
            return false;
        }

        private bool AccountEnoughtBalance(AccountModel account, double value)
        {
            AccountModel accountFound = this._accountRepository.GetById(account.AccountNumber);
            if (accountFound?.Balance > value)
                return true;
            return false;
        }
    }
}
