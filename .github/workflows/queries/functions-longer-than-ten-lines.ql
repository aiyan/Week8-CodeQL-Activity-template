/**
 * @description Finds functions that are longer than 10 lines
 * @kind problem
 * @id javascript/long-function
 * @problem.severity recommendation
 */
import javascript

predicate isLongFunction(Function f) {
  f.getEndLine() - f.getStartLine() > 10
}

from Function f
where isLongFunction(f)
select f, "This function is longer than 10 lines."

\