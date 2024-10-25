/**
 * @description Find tests that call the function pressActionKey
 * @kind recommendation
 * @id javascript/tests-calling-pressactionkey
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
 * Holds if the function calls pressActionKey.
 */
predicate callsPressActionKey(Function test) {
  exists(CallExpr call |
    call.getCalleeName() = "pressActionKey" and
    call.getEnclosingFunction() = test
  )
}

from Function test
where isTest(test) and callsPressActionKey(test)
select test, "This test calls the function pressActionKey."
