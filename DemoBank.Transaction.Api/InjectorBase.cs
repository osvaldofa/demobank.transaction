using DemoBank.Transaction.Domain.Interfaces;
using DemoBank.Transaction.Domain.Services;
using DemoBank.Transaction.Infrastructure.Data.Repositories;
using DemoBank.Transaction.Infrastructure.Communication;
using DemoBank.Transaction.Infrastructure.Communication.Services;
using Microsoft.Extensions.DependencyInjection;

namespace DemoBank.Transaction.Presentation
{
    /// <summary>
    /// Startup extension methods.
    /// </summary>
    public abstract class InjectorBase
    {
        /// <summary>
        /// Configure dependency injections.
        /// </summary>
        /// <param name="service">Service collection instantiated on StartUp class.</param>
        public void ConfigureInjections(IServiceCollection service) 
        {
            // Configure dependency injection for Domain Services
            ConfigureServiceInjections(service);

            // Configure dependency injection for Repositories
            ConfigureRepositoryInjections(service);
        }

        private void ConfigureServiceInjections(IServiceCollection service)
        {
            // Attaching Transaction service dependency injection.
            service.AddSingleton(typeof(ITransactionServices), typeof(TransactionServices));

            // Attaching external Account service dependency injection.
            service.AddSingleton(typeof(IAccountService), typeof(AccountService));
        }

        private void ConfigureRepositoryInjections(IServiceCollection service)
        {
            // Attaching Customer Repository for data access provider.
            service.AddSingleton(typeof(ICustomerRepository), typeof(CustomerRepository));

            // Attaching Transaction Repository for data access provider.
            service.AddSingleton(typeof(ITransactionRepository), typeof(TransactionRepository));
        }
    }
}
