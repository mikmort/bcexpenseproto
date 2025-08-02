# Expense Management Demo Data

This document describes the comprehensive demo data created for the Expense Management system.

## Overview

The demo data includes realistic sample records across all expense management tables, designed to showcase the full functionality of the system.

## Demo Data Contents

### Employees (5 records)
- **EMP001** - John Smith (USD, MAIN legal entity)
- **EMP002** - Sarah Johnson (USD, MAIN legal entity)
- **EMP003** - Michael Brown (EUR, EU legal entity)
- **EMP004** - Emily Davis (USD, MAIN legal entity)
- **EMP005** - David Wilson (GBP, UK legal entity)

### Expense Categories (6 records)
- **AIRFARE** - Airfare and Flight Tickets (Travel group, refundable)
- **HOTEL** - Hotel Accommodation (Travel group, refundable)
- **MEALS** - Business Meals (Meals group, refundable)
- **TAXI** - Taxi and Rideshare (Travel group, refundable)
- **OFFICE** - Office Supplies (Office group, non-refundable)
- **TRAINING** - Training and Conferences (Training group, refundable)

### Expense Subcategories (5 records)
- **DOMESTIC** - Domestic Flights (under AIRFARE)
- **INTL** - International Flights (under AIRFARE)
- **BREAKFAST** - Breakfast (under MEALS)
- **LUNCH** - Lunch (under MEALS)
- **DINNER** - Dinner (under MEALS)

### Expense Groups (4 records)
- **TRAVEL** - Travel Related Expenses
- **OFFICE** - Office Supplies and Equipment
- **MEALS** - Meals and Entertainment
- **TRAINING** - Training and Development

### Payment Methods (4 records)
- **CORP-CARD** - Corporate Credit Card (company paid)
- **PERSONAL** - Personal Payment (reimbursable)
- **CASH** - Cash Payment (reimbursable)
- **CHECK** - Company Check (company paid)

### Expense Locations (5 records)
- **NYC** - New York City, NY (US)
- **LON** - London, UK (GB)
- **PAR** - Paris, France (FR)
- **CHI** - Chicago, IL (US)
- **BER** - Berlin, Germany (DE)

### Expense Reports (4 records)
1. **EXP-2025-001** - John Smith's client meeting in NYC ($1,250.00, Submitted)
2. **EXP-2025-002** - Sarah Johnson's training in Chicago ($980.50, Approved)
3. **EXP-2025-003** - Michael Brown's sales meeting in London (£875.25, Draft)
4. **EXP-2025-004** - Emily Davis's office supplies ($125.75, Submitted)

### Expense Report Lines (6 records)
- Airfare, hotel, meals, training, taxi, and office supplies
- Various amounts, tax calculations, and statuses
- Proper category assignments and location codes

### Supporting Data
- **Receipts**: 3 sample receipt records with file names and URIs
- **Comments**: 3 expense comments from different employees
- **Policies**: 3 expense policies with daily limits and requirements
- **Itemizations**: Detailed breakdown for business dinner
- **Participants**: Meeting attendees for business meals
- **Per Diem**: Sample per diem calculations

## How to Use Demo Data

### Creating Demo Data
1. Navigate to **Expense Management** → **Policy & Setup** → **Demo Data Setup**
2. Click **"Create Demo Data"** button
3. Confirm the action to populate all tables
4. Review the data summary showing record counts

### Clearing Demo Data
1. Open the **Demo Data Setup** page
2. Click **"Clear Demo Data"** button
3. Confirm to delete all demo records

### Testing Scenarios

#### Scenario 1: Travel Expense Report
- Use employee EMP001 (John Smith)
- Review report EXP-2025-001 with multiple expense types
- Check attached receipts and comments
- View itemized business dinner with participants

#### Scenario 2: Training Expenses
- Use employee EMP002 (Sarah Johnson)
- Review approved training report EXP-2025-002
- See corporate card payment method usage

#### Scenario 3: International Expenses
- Use employee EMP003 (Michael Brown)
- Review draft report EXP-2025-003 in GBP currency
- Test different legal entity and currency handling

#### Scenario 4: Simple Office Expenses
- Use employee EMP004 (Emily Davis)
- Review small office supplies report EXP-2025-004
- Test cash payment method

## Navigation

Use the **Expense Management Menu** (page 50198) to easily navigate between all components:

### Main Sections
- **Expense Reports**: Create and manage expense reports
- **Master Data**: Manage employees, categories, locations, etc.
- **Policy & Setup**: Configure policies, posting groups, and settings
- **Per Diem**: Manage per diem expenses
- **Analysis & Reports**: View receipts, comments, and detailed analysis

### Quick Actions
- Create new expense reports
- Add new employees or categories
- Access demo data setup

## Data Relationships

The demo data maintains proper referential integrity:
- Expense reports link to valid employees
- Report lines reference valid categories and locations
- Receipts attach to specific expense lines
- Comments associate with reports and lines
- Policies apply to specific categories and locations
- Itemizations break down complex expenses
- Participants track attendees for business expenses

## Best Practices Demonstrated

1. **Currency Handling**: Multiple currencies (USD, EUR, GBP)
2. **Legal Entities**: Different organizational structures
3. **Receipt Management**: Attached receipts with file references
4. **Policy Compliance**: Daily limits and receipt requirements
5. **Approval Workflow**: Various status levels (Draft, Submitted, Approved)
6. **Tax Calculations**: Proper tax amount tracking
7. **Reimbursement Logic**: Company-paid vs. reimbursable expenses

This demo data provides a comprehensive foundation for testing and demonstrating all aspects of the Expense Management system.
