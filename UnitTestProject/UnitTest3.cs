using computer_store;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest3
    {
        [TestMethod]
        public void TestMethod1()
        {
            var page = new Authorization();
            Assert.IsTrue(page.Auth("sa", "1qaz"));

        }
    }
}
