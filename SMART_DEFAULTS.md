# Smart Defaults for Expense Management

## New Expense Report Defaults

When creating a new expense report, the system automatically sets the following smart defaults:

### 🗓️ **Date Fields**
- **Report Date**: Valid date that complies with license restrictions
- **Posting Date**: Valid date that complies with license restrictions
- Uses `GetValidDateForEntry()` function to ensure dates are within allowed ranges

### 🆔 **Identification & Numbering**
- **Report ID**: Auto-generated using number series from Expense Management Setup
- **Employee ID**: Attempts to find current user's employee record by:
  1. Looking up User Setup email and matching to Employee email
  2. Searching for employee email containing current user ID
  3. Falls back to empty (user selects manually) if no match found

### 💰 **Financial Defaults**
- **Currency Code**: 
  1. Uses employee's default currency if employee is identified
  2. Falls back to system LCY (Local Currency) from General Ledger Setup
- **Payment Method**: 
  1. Tries 'PERSONAL' first (most common for reimbursable expenses)
  2. Falls back to 'CORP-CARD' if available
  3. Uses first available payment method if neither exists
- **Total Amount**: Initialized to 0

### 📋 **Status & Workflow**
- **Status**: Set to "Draft" (allows editing)
- **Receipts Attached**: Initialized to false
- **Created By**: Current user ID
- **Created Date Time**: Current system date/time

## New Expense Line Defaults

When adding expense lines to a report, the system inherits and sets:

### 📅 **Date & Currency**
- **Expense Date**: Valid date using license-compliant date function
- **Currency Code**: Inherited from parent expense report
- **Payment Method**: Inherited from parent expense report

### 🔧 **Processing Defaults**
- **Status**: Set to "Draft"
- **Receipt Required**: Defaulted to true (encourages compliance)
- **Line Number**: Auto-incremented by 1000 from highest existing line

## Smart Date Logic

The system includes intelligent date handling for license restrictions:

```al
// Checks if current month is allowed (01, 02, 11, 12)
if TargetMonth in [1, 2, 11, 12] then
    exit(TargetDate);

// Falls back to February 15 if current date not allowed
exit(DMY2Date(15, 2, Date2DMY(TargetDate, 3)));
```

## Employee Detection Logic

The system attempts to automatically identify the current user as an employee:

1. **User Setup Email Match**: Looks up current user in User Setup table and matches email to Employee table
2. **Partial Email Match**: Searches for employee emails containing the current user ID
3. **Manual Selection**: If no automatic match found, field remains empty for manual selection

## Benefits

### 🎯 **User Experience**
- Minimal data entry required for new records
- Sensible defaults reduce errors
- License-compliant dates prevent validation errors

### ⚡ **Efficiency**
- Auto-generated Report IDs eliminate manual numbering
- Inherited values reduce duplicate entry
- Smart employee detection speeds up workflow

### 🛡️ **Data Quality**
- Consistent defaults across the system
- Currency alignment between reports and lines
- Receipt requirements encouraged by default

## Configuration Dependencies

The smart defaults rely on:
- **Expense Management Setup**: Number series configuration
- **General Ledger Setup**: Default currency (LCY)
- **Payment Methods**: Available payment options
- **User Setup**: Email addresses for employee matching
- **License Configuration**: Date range restrictions
