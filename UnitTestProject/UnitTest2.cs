using computer_store;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest2
    {
        [TestMethod]
        public void AuthTest()
        {
            var page = new Authorization();
            Assert.IsTrue(page.Auth("sa", "1qaz"));
            Assert.IsFalse(page.Auth("jhsd", " 12746"));
            Assert.IsFalse(page.Auth("", ""));
            Assert.IsFalse(page.Auth(" ", " "));
        }
    }
}
