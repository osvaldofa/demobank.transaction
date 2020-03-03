using DemoBank.Transaction.Infrastructure.Data.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System.Net.Http;
using Newtonsoft.Json;

namespace DemoBank.Transaction.Infrastructure.Communication.Services
{
    public class AccountService : IAccountService
    {
        private readonly ILogger<AccountService> _logger;
        private readonly IConfiguration _config;
        private readonly HttpClient httpClient;

        public AccountService(ILogger<AccountService> logger, IConfiguration config)
        {
            this._logger = logger;
            this._config = config;
            this.httpClient = new HttpClient();
        }


        /// <summary>
        /// Verify ia an specific account exists.
        /// </summary>
        /// <param name="account">The account to be verified.</param>
        /// <returns>True/False about the account existence.</returns>
  /*      public AccountModel GetById(long accountNumber)
        {
            string accountURL = this._config["AccountServiceURL"] + "/" + accountNumber;
            this._logger.LogInformation("----------> Verifying account existence: " + accountURL);

            HttpResponseMessage response = httpClient.GetAsync(accountURL).Result;

            AccountModel account = JsonConvert.DeserializeObject<AccountModel>(response.Content.ReadAsStringAsync().);
            return account;
        }*/

        public bool UpdateAccountBalance(TransactionModel transaction)
        {
            string accountURL = this._config["AccountServiceURL"] + "/" + transaction.DestinationAccount.AccountNumber;
            this._logger.LogInformation("----------> Sending Account Update to " + accountURL);            

            HttpResponseMessage response = httpClient.PutAsJsonAsync(accountURL, transaction).Result;

            if (response.IsSuccessStatusCode)
                return true;

            return false;
        }
    }
}
