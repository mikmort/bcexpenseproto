# Demo Data Restructuring - Issue #10

This document describes the implementation of the data split requested in GitHub issue #10.

## Overview

The demo data has been split into two distinct categories:

### 1. Setup Data (Realistic Defaults)
Great defaults that would make sense for any customer in the US.

**Files Created:**
- `src/ExpenseSetupData.Codeunit.al` (Codeunit 50200)

**Includes:**
- **Expense Groups (6)**: Travel, Office, Meals, Training, Telecom, Vehicle
- **Expense Categories (17)**: Comprehensive list including Airfare, Hotel, Meals, Taxi, Office Supplies, Software, Training, Phone, Internet, Mileage, etc.
- **Expense Subcategories (8)**: Domestic/International flights, Breakfast/Lunch/Dinner, Conference/Certification/Workshop
- **Payment Methods (6)**: Personal, Corporate Card, Cash, Check, Debit Card, Petty Cash
- **Expense Locations (12)**: Major US cities (NYC, Chicago, LA, Atlanta, etc.) plus common international locations (London, Toronto)
- **Posting Groups (3)**: Standard, Travel, Entertainment
- **Expense Policies (6)**: Based on realistic US business practices:
  - Daily meal allowances (GSA rates)
  - High-cost city adjustments
  - Hotel receipt requirements
  - Airfare approval thresholds
  - Entertainment expense policies
  - IRS standard mileage rates

### 2. Demo Data (Sample Transactions)
Examples that make sense for a demo, but not intended for real use.

**Files Created:**
- `src/ExpenseDemoData.Codeunit.al` (Codeunit 50201)

**Includes:**
- **Sample Employees (5)**: John Smith, Sarah Johnson, Michael Brown, Emily Davis, David Wilson
- **Sample Expense Reports (4)**: 
  - Client meeting in NYC
  - Technical conference in Chicago
  - European sales meeting in London
  - Office supplies purchase
- **Expense Report Lines (8)**: Various expense types with realistic amounts
- **Supporting Data**: Receipts, comments, itemizations, participants, per diem expenses

## Updated Files

### Modified Files:
- `src/ExpenseDemoDataSetup.Codeunit.al` - Now orchestrates the setup and demo data codeunits
- `src/ExpenseDemoDataSetup.Page.al` - Updated UI with separate buttons for Setup Data, Demo Data, or Both

### New Page Features:
- **Create Setup Data Only**: Creates realistic defaults suitable for any US customer
- **Create Demo Data Only**: Creates sample transactions for demonstration
- **Create All Data**: Creates both setup and demo data
- **Clear Demo Data**: Removes all created data

## Benefits

1. **Flexibility**: Customers can choose to install only setup data for production use
2. **Realistic Defaults**: Setup data is based on actual US business practices and GSA rates
3. **Clean Separation**: Demo transactions are clearly separated from production-ready setup
4. **Scalability**: Easy to extend either category independently

## Usage Scenarios

### For Production Deployment:
Use "Create Setup Data Only" to get realistic defaults without sample transactions.

### For Demonstration:
Use "Create All Data" to get both setup data and sample transactions.

### For Testing:
Use individual buttons to test setup or demo data creation separately.

## Technical Details

- **Setup Data Codeunit**: Contains 17 expense categories, 6 policies based on GSA rates, and comprehensive location/payment method setup
- **Demo Data Codeunit**: Contains 5 employees, 4 expense reports, and all related transaction data
- **Original Codeunit**: Now acts as an orchestrator, calling the appropriate specialized codeunits
- **Updated Page**: Provides clear options and descriptions for each data type

This implementation fully addresses the requirements in issue #10 by providing a clear separation between realistic setup data and demonstration examples.
