﻿// --------------------------------------------------------------------------------------------------------------------
// <copyright file="BookmarkStartProxyFacts.cs" company="Philipp Dolder">
//   Copyright (c) 2014
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
// </copyright>
// --------------------------------------------------------------------------------------------------------------------
namespace AsposeVisualizer
{
    using System;
    using FakeItEasy;
    using FluentAssertions;
    using Xunit;

    public class BookmarkStartProxyFacts
    {
        private const string Name = "Bookmark";
        private readonly BookmarkStartProxy testee;

        public BookmarkStartProxyFacts()
        {
            this.testee = new BookmarkStartProxy(Name);
        }

        [Fact]
        public void HasName()
        {
            this.testee.Name.Should().Be(Name);
        }

        [Fact]
        public void AcceptsVisitor()
        {
            var visitor = A.Fake<NodeVisitor>();

            this.testee.Accept(visitor);

            A.CallTo(() => visitor.VisitBookmarkStart(this.testee)).MustHaveHappened();
        }

        [Fact]
        public void IsSerializable()
        {
            this.testee.GetType().Should().BeDecoratedWith<SerializableAttribute>();
        }
    }
}