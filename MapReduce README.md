# MapReduce: Count Courses Per Year

**Goal:** Given records like `(Student_Id, Age, Course_Id, Course_Grade, School, Year)`, output the **number of courses per year**.

## Mapper (with local aggregation)
Emit `(year, 1)` for each record and aggregate locally to reduce shuffle.

## Combiner
Sum values per `year` produced by mappers on the node.

## Reducer
Aggregate across nodes to produce `(year, total_courses)`.

**Why it scales:** Local aggregation reduces network I/O; sum is associative/commutative; Hadoop provides retries/fault-tolerance.
