# Smart Date Handling for License Restrictions

## Problem
Business Central demo/evaluation licenses often have date restrictions that only allow certain months. The typical restriction pattern is `??11*|??12*|??01*|??02*` which allows:
- November (11)
- December (12) 
- January (01)
- February (02)

## Solution
Implemented smart date calculation functions that automatically handle license date restrictions:

### ExpenseDemoData.Codeunit.al
- `GetValidDate(DaysOffset: Integer): Date` - Calculates a valid date based on offset from today
- `GetValidDateInPast(DaysAgo: Integer): Date` - Helper for past dates
- All demo data creation uses these functions instead of hard-coded dates

### ExpenseReportCard.Page.al
- `GetValidDateForEntry(): Date` - Provides valid default dates for new expense reports
- Automatically used when creating new expense reports

## How It Works
1. **Current Month Check**: First checks if the current/target month is in the allowed range
2. **Fallback Strategy**: If not allowed, defaults to February 15 of the current year
3. **Relative Calculations**: Uses day offsets to maintain realistic relative dates between records

## Benefits
- **No Hard-Coded Years**: Automatically adapts to any year
- **License Compliant**: Always generates dates within allowed ranges
- **Realistic Demo Data**: Maintains logical relationships between expense dates
- **User-Friendly**: New expense reports get valid default dates automatically

## Usage Example
```al
// Instead of: Report."Report Date" := Today() - 30;
Report."Report Date" := GetValidDateInPast(30);

// Instead of: Report."Report Date" := DMY2Date(15, 2, 2025);
Report."Report Date" := GetValidDateInPast(30);
```

This approach ensures the application works regardless of:
- Current system date
- License restrictions 
- Year changes
- Demo environment constraints
