# SpecDriven-Abap-Report Constitution

## Core Principles

### I. ABAP Code Quality
- **Clean Code Standard:** All ABAP code must adhere to clean ABAP principles. Code should be self-documenting with meaningful names for variables, methods, and classes.
- **Modern ABAP:** Leverage modern ABAP syntax (e.g., inline declarations, functional method calls, constructor expressions, table expressions) over obsolete legacy statements.
- **Modularity:** Ensure high cohesion and low coupling. Use object-oriented ABAP (ABAP OO) instead of procedural programming. Complex business logic should be encapsulated in classes, not function modules or subroutines.
- **Static Code Analysis:** All code must pass ABAP Test Cockpit (ATC) checks with no errors or unhandled warnings before release.

### II. ABAP Testing Standards
- **Test-Driven Development (TDD):** Adopt a test-first approach where applicable. ABAP Unit tests must be written for all core business logic and algorithms.
- **Test Coverage:** Maintain a minimum of 80% statement coverage for new and modified classes.
- **Isolation:** Use Test Seams and ABAP OO mocking frameworks (e.g., ABAP OO test doubles, cl_abap_testdouble) to isolate the unit under test from database access and external dependencies.
- **Continuous Execution:** Unit tests must be executed automatically during ATC checks or transport release.

### III. User Experience (UX) Consistency
- **Fiori Guidelines:** All user interfaces (whether SAPUI5, Fiori Elements, or classic UI converted) must comply with SAP Fiori Design Guidelines to ensure a consistent, role-based, and intuitive user experience.
- **Responsive Design:** If applicable, applications should be responsive and adaptive, providing optimal usability across desktop, tablet, and mobile devices.
- **Accessibility:** UI components must meet standard accessibility guidelines (WCAG) as supported by SAP Fiori.
- **Error Handling:** Present clear, actionable, user-friendly error messages (via message classes) without exposing internal technical details, generic exceptions, or ABAP short dumps.

### IV. SAP S/4HANA Performance Requirements
- **Code Pushdown:** Leverage SAP HANA capabilities by pushing data-intensive logic to the database layer. Use Core Data Services (CDS) views and ABAP Managed Database Procedures (AMDP) where performance benefits are significant.
- **Efficient Data Access:** Minimize database accesses. Avoid SELECT loops (`SELECT` within `LOOP`) and use array operations, joins, and fast internal table operations (`SORT`, `READ TABLE ... BINARY SEARCH`, `HASHED`/`SORTED` tables) instead.
- **HANA Readiness:** Ensure all custom ABAP code is fully compatible with SAP HANA. Avoid native SQL unless absolutely necessary and properly encapsulated.
- **Optimization Tools:** Utilize SQL Monitor (SQLM), Code Inspector (SCI), and ABAP Profiler (SAT) to proactively identify and resolve performance bottlenecks.

## Development Workflow

- **Specification First:** Every feature or report starts with a clear specification using the Spec Kit methodology.
- **Code Review:** All code requires review before moving to the QA system. Reviews focus on the principles outlined in this constitution.
- **Source Control:** Ensure code is well-documented in transport requests and strictly adheres to standard versioning, or Git branching models if abapGit is in use.

## Governance
This constitution dictates the core standards for the SpecDriven-Abap-Report project. All developers contributing to this repository are required to follow these guidelines. Exceptions must be explicitly documented and approved by the architecture team.

**Version**: 1.0.0 | **Ratified**: 2026-05-03
