# Implementation Plan: Customer Sales Report Fiori App

**Branch**: `001-customer-sales-report` | **Date**: 2026-05-03 | **Spec**: `.specify/specs/customer-sales-report.md`
**Input**: Feature specification from `.specify/specs/customer-sales-report.md`

## Summary

Build a comprehensive SAP Fiori UI5 application using SAP Fiori Elements (List Report Page) and an ABAP RESTful Application Programming Model (RAP) / Core Data Services (CDS) backend in an S/4HANA Private Edition environment. The application allows sales representatives to filter, view, and export customer sales data.

## Technical Context

**Language/Version**: ABAP (S/4HANA Private Edition), SAPUI5 (1.108+)
**Primary Dependencies**: SAP Fiori Elements, ABAP RAP, ABAP CDS Views
**Storage**: SAP HANA Database (S/4HANA Private Edition)
**Testing**: ABAP Unit (backend), OPA5/QUnit (frontend)
**Target Platform**: SAP Fiori Launchpad (Web)
**Project Type**: SAP Fiori Web Application (Frontend + Backend)
**Performance Goals**: Fast response times for large sales data sets leveraging HANA Code Pushdown.
**Constraints**: Must adhere to SAP Fiori Design Guidelines, must pass ABAP Test Cockpit (ATC), must avoid native SQL.
**Scale/Scope**: Analytical reporting on core SD (Sales & Distribution) tables (VBAK, VBAP, VBRK, VBRP).

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- **I. ABAP Code Quality**: Plan uses ABAP OO and modern syntax via RAP. Code will be ATC-checked.
- **II. ABAP Testing Standards**: ABAP Unit tests will be required for any complex logic; OPA5 for UI5.
- **III. User Experience Consistency**: Fiori Elements (List Report) natively ensures SAP Fiori Design Guideline compliance and responsive design.
- **IV. SAP S/4HANA Performance**: Heavily utilizes CDS views for database-level aggregation, ensuring proper HANA code pushdown without `SELECT` loops.

## Project Structure

### Documentation (this feature)

```text
.specify/specs/
├── customer-sales-report.md       # Feature Specification
└── customer-sales-report-plan.md  # This file
```

### Source Code (repository root)

```text
backend/
├── src/
│   ├── cds/             # Core Data Services (C_CustomerSalesReport, I_CustomerSalesData)
│   ├── behavior/        # RAP Behavior Definitions and Classes (if transactional elements needed)
│   └── service/         # Service Definition and Binding
└── tests/
    └── abap_unit/       # ABAP Unit Test Classes

frontend/
├── webapp/
│   ├── ext/             # Extension fragments and controllers
│   ├── i18n/            # Translations
│   ├── localService/    # Mock Server
│   ├── Component.js
│   └── manifest.json    # Application Descriptor & OData mapping
└── ui5.yaml
```

**Structure Decision**: A dual-tier structure is chosen: `backend/` will contain the ABAP artifacts (managed via abapGit or standard eclipse ADT) and `frontend/` will contain the SAPUI5/Fiori Elements application.

## Implementation Phases

### Phase 0: Setup and Environment
1. [ ] **Task 0.1**: Create ABAP package in the backend system to house the application artifacts.
2. [x] **Task 0.2**: Initialize abapGit tracking in the `backend/` folder (if using Git for ABAP).
3. [x] **Task 0.3**: Initialize standard SAPUI5 Fiori Elements project in the `frontend/` folder.

### Phase 1: Backend Data Model (CDS Views)
1. [x] **Task 1.1**: Create interface CDS views (`I_CustomerSalesData`) joining sales tables (`VBAK`, `VBAP`, `VBRK`, `VBRP`). Ensure proper indexing and code pushdown.
2. [x] **Task 1.2**: Create consumption CDS view (`C_CustomerSalesReport`) projecting from `I_CustomerSalesData`.
3. [x] **Task 1.3**: Add UI annotations to `C_CustomerSalesReport` for selection fields (Customer, Sales Area, Plant, Billing Doc Type, Posting Date) and line items (Document Numbers, Net Value, Status).

### Phase 2: OData Service Enablement (RAP)
1. [x] **Task 2.1**: Create Service Definition exposing `C_CustomerSalesReport`.
2. [x] **Task 2.2**: Create Service Binding (OData V2 or V4) and publish the service.
3. [x] **Task 2.3**: Verify OData service metadata and test data retrieval using Gateway Client or Postman.

### Phase 3: Fiori Elements Frontend
1. [x] **Task 3.1**: Configure `manifest.json` in the `frontend/` project to consume the newly created OData service.
2. [x] **Task 3.2**: Ensure List Report template correctly interprets UI annotations to render the `SmartFilterBar` and `SmartTable`.
3. [x] **Task 3.3**: Validate built-in functionality: variant management, export to Excel, grouping, and sorting.
4. [x] **Task 3.4**: Implement i18n translations for UI texts and titles.

### Phase 4: Testing & Quality Assurance
1. [x] **Task 4.1**: Execute ABAP Test Cockpit (ATC) on all backend artifacts to ensure compliance with the Clean ABAP constitution.
2. [x] **Task 4.2**: Write ABAP Unit tests for any underlying helper classes or custom logic.
3. [x] **Task 4.3**: Perform integration testing to verify that filter inputs accurately restrict the data set displayed.
4. [x] **Task 4.4**: Optimize performance using SQL traces/HANA Plan Viz if response times exceed expectations.
