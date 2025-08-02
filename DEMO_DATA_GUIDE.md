# Expense Management Data Setup Guide

This document describes the data setup options for the Expense Management system, now split into two categories per issue #10.

## Data Categories

### 1. Setup Data (Realistic Defaults)
Comprehensive defaults suitable for any US customer in production.

### 2. Demo Data (Sample Transactions)  
Example transactions for demonstration and testing purposes.

## Overview

The Expense Management system now provides flexible data creation options:

The demo data includes realistic sample records across all expense management tables, designed to showcase the full functionality of the system.

## Setup Data Contents (Realistic Defaults)

### Expense Groups (6 records)
- **TRAVEL** - Travel Related Expenses
- **OFFICE** - Office Supplies and Equipment  
- **MEALS** - Meals and Entertainment
- **TRAINING** - Training and Development
- **TELECOM** - Telecommunications
- **VEHICLE** - Vehicle and Transportation

### Expense Categories (17 records)
Comprehensive list covering typical US business expenses:
- **Travel**: Airfare, Hotel, Rental Car, Taxi, Parking
- **Meals**: Business Meals, Entertainment
- **Office**: Office Supplies, Software, Postage
- **Training**: Training/Conferences, Books, Professional Memberships
- **Telecom**: Phone, Internet
- **Vehicle**: Mileage, Gas, Tolls

### Payment Methods (6 records)
Standard US business payment methods:
- **PERSONAL** - Personal Payment (Reimbursable)
- **CORP-CARD** - Corporate Credit Card
- **CASH** - Cash Payment
- **CHECK** - Company Check
- **DEBIT-CARD** - Corporate Debit Card
- **PETTY-CASH** - Petty Cash

### Expense Policies (6 records)
Based on realistic US business practices:
1. Daily meal allowance ($60 GSA rate)
2. High-cost city meal allowance ($85 for NYC)
3. Hotel receipt requirements
4. Airfare approval threshold ($500)
5. Entertainment receipt requirements ($25+)
6. IRS standard mileage rate ($0.67/mile)

### Expense Locations (12 records)
Major US cities plus common international destinations:
- **US Cities**: NYC, Chicago, LA, Atlanta, Seattle, Dallas, Boston, Miami, Denver, Las Vegas
- **International**: London UK, Toronto Canada

## Demo Data Contents (Sample Transactions)

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

## How to Use the Data Setup

### Creating Setup Data Only (Production Ready)
1. Open **Expense Management Menu**
2. Navigate to **Setup & Configuration** → **Demo Data Setup**
3. Click **"Create Setup Data Only"**
4. This creates realistic defaults without sample transactions

### Creating Demo Data Only (For Testing)
1. Follow steps 1-2 above
2. Click **"Create Demo Data Only"** 
3. This creates sample employees and expense reports (requires setup data)

### Creating All Data (Complete Demo)
1. Follow steps 1-2 above
2. Click **"Create All Data (Setup + Demo)"**
3. This creates both realistic setup data and sample transactions

### Clearing Demo Data
1. Use **"Clear Demo Data"** to remove all created data
2. This clears both setup and demo data
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
