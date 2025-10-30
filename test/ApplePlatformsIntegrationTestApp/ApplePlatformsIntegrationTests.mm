/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <XCTest/XCTest.h>

#import <hermes/DebuggerAPI.h>
#import <hermes/hermes.h>

#include <iostream>

using namespace std;

@interface ApplePlatformsIntegrationTests : XCTestCase

@end

@implementation ApplePlatformsIntegrationTests

static string commonCode = R"(
function generateLargeArray(type) {
  const largeArray = [];
  for (let i = 0; i < 5_000_000; i++) {
    if (type === 'map') largeArray.push(new Map());
    if (type === 'set') largeArray.push(new Set());
    if (type === 'fun') largeArray.push(() => {});
    if (type === 'obj') largeArray.push({});
    if (type === 'str') largeArray.push(`${i} this is very very very long string`);
  }
  return largeArray;
}

const result = generateLargeArray(dataType);
print(JSON.stringify(HermesInternal.getInstrumentedStats(), undefined, 2));
)";

- (void)testMemoryUsageMap {
  facebook::hermes::HermesRuntime::DebugFlags flags;

  auto runtime = facebook::hermes::makeHermesRuntime();
  auto typedCode = "const dataType = 'map';\n" + commonCode;

  runtime->debugJavaScript(typedCode, "", flags);
}

- (void)testMemoryUsageSet {
  facebook::hermes::HermesRuntime::DebugFlags flags;

  auto runtime = facebook::hermes::makeHermesRuntime();
  auto typedCode = "const dataType = 'set';\n" + commonCode;

  runtime->debugJavaScript(typedCode, "", flags);
}

- (void)testMemoryUsageFunction {
  facebook::hermes::HermesRuntime::DebugFlags flags;

  auto runtime = facebook::hermes::makeHermesRuntime();
  auto typedCode = "const dataType = 'fun';\n" + commonCode;

  runtime->debugJavaScript(typedCode, "", flags);
}

- (void)testMemoryUsageObject {
  facebook::hermes::HermesRuntime::DebugFlags flags;

  auto runtime = facebook::hermes::makeHermesRuntime();
  auto typedCode = "const dataType = 'obj';\n" + commonCode;

  runtime->debugJavaScript(typedCode, "", flags);
}

- (void)testMemoryUsageString {
  facebook::hermes::HermesRuntime::DebugFlags flags;

  auto runtime = facebook::hermes::makeHermesRuntime();
  auto typedCode = "const dataType = 'str';\n" + commonCode;

  runtime->debugJavaScript(typedCode, "", flags);
}

@end
