using computer_store;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Runtime.Serialization;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTestRegistration
    {
        [TestMethod]
        public void TestRegistration()
        {
            // Создаем объект Registration БЕЗ вызова конструктора
            var page = (Registration)FormatterServices.GetUninitializedObject(typeof(Registration));

            // Принудительно инициализируем _context
            typeof(Registration)
                .GetField("_context", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance)
                .SetValue(page, new Entities());

            // Вызываем тестируемый метод
            bool result = page.RegisterUser("newUser1234", "securePass1234", "securePass1234");

            Assert.IsTrue(result);
        }
    }
}
