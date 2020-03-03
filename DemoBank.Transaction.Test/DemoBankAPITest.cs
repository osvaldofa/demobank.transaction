using DemoBank.Transaction.CrossCutting.Enumerators;
using DemoBank.Transaction.Domain.Interfaces;
using DemoBank.Transaction.Domain.Services;
using DemoBank.Transaction.Infrastructure.Communication;
using DemoBank.Transaction.Infrastructure.Data.Models;
using DemoBank.Transaction.Infrastructure.Data.Repositories;
using DemoBank.Transaction.Presentation.Controllers;
using Microsoft.Extensions.Logging;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NSubstitute;

namespace DemoBank.Test
{
    [TestClass]
    public class DemoBankAPITest
    {
        private ICustomerRepository customerRepository;
        private ITransactionRepository transactionRepository;
        private IAccountService accountService;        

        private ITransactionServices transactionServices;        
        private ILogger<TransactionController> transactionLogger;
        private TransactionController transactionController;

        /// <summary>
        /// Initializes mock objects for test purposes.
        /// </summary>
        [TestInitialize]
        public void TestInitialization()
        {
            this.customerRepository = Substitute.For<ICustomerRepository>(); ;
            this.transactionRepository = Substitute.For<ITransactionRepository>(); ;            
            this.accountService = Substitute.For<IAccountService>();

            
            this.transactionLogger = Substitute.For<ILogger<TransactionController>>();
            this.transactionController = new TransactionController(this.transactionServices, this.transactionLogger);
        }

        [TestCleanup]
        public void TestClean()
        {
            this.customerRepository = null;
            this.transactionRepository = null;
            this.accountService = null;

            this.transactionServices = null;

            this.transactionController = null;
        }       


        #region TEST METHODS        

        /// <summary>
        /// Test the creation of a new transaction for an existent account.
        /// </summary>
        [TestMethod]
        public void TestCreateTransactionValidDeposit()
        {
            // Set account repository mock.
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel account = new AccountModel(1101, customer, 100);            

            TransactionModel transaction = new TransactionModel();
            transaction.DestinationAccount = account;
            transaction.TransactionType = TransactionTypes.DEPOSIT;
            transaction.Value = 100;

            this.accountService.GetById(1101).Returns(account);
            this.transactionRepository.Save(transaction).ReturnsForAnyArgs(11001);
            this.accountService.UpdateAccountBalance(transaction).ReturnsForAnyArgs(true);
            
            Assert.AreEqual(this.transactionController.CreateTransaction(transaction).Value, 11001);
        }

        /// <summary>
        /// Test the creation of a new transaction for a non existent account.
        /// </summary>
        [TestMethod]
        public void TestCreateTransactionValidDepositInInvalidAccount()
        {
            // Set account repository mock.
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel account = new AccountModel(1101, customer, 100);

            TransactionModel transaction = new TransactionModel();
            transaction.DestinationAccount = account;
            transaction.TransactionType = TransactionTypes.DEPOSIT;
            transaction.Value = 100;
                        
            this.transactionRepository.Save(transaction).ReturnsForAnyArgs(11001);

            Assert.AreEqual(this.transactionController.CreateTransaction(transaction).Value, 0);
        }

        [TestMethod]
        public void TestGetTransactionsByAccountNumber()
        {
            CustomerModel customer = new CustomerModel(1010, "John", "Doe");
            AccountModel account = new AccountModel(1101, customer, 100);
            
            TransactionModel transaction = new TransactionModel();
            transaction.TransactionId = 11002;
            transaction.DestinationAccount = account;
            transaction.TransactionType = TransactionTypes.DEPOSIT;
            transaction.Value = 100;

            TransactionModel[] transactions = { transaction };
            this.accountService.GetById(1101).ReturnsForAnyArgs(account);
            this.transactionRepository.GetTransactionsByAccountNumber(1101).ReturnsForAnyArgs(transactions);

            var result = this.transactionController.GetTransactionsByAccountNumber(1101);
            Assert.AreSame(result.Value, transactions);
        }

        #endregion

    }
}
