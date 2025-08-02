page 50198 "Expense Management Menu"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Expense Management';

    layout
    {
        area(RoleCenter)
        {
            part(HeadlinePart; "Headline RC Business Manager")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(ExpenseReports)
            {
                Caption = 'Expense Reports';
                action(MyExpenseReportsList)
                {
                    Caption = 'My Expense Reports';
                    ApplicationArea = All;
                    RunObject = page "My Expense Reports List";
                    ToolTip = 'View expense reports where you are the author or involved in approving.';
                }
                action(ExpenseReportsList)
                {
                    Caption = 'All Expense Reports';
                    ApplicationArea = All;
                    RunObject = page "Expense Reports List";
                    ToolTip = 'View and manage all expense reports.';
                }
                action(PostedExpenseReportsList)
                {
                    Caption = 'Posted Expense Reports';
                    ApplicationArea = All;
                    RunObject = page "Posted Expense Reports List";
                    ToolTip = 'View posted expense reports.';
                }
                action(CreateNewExpenseReport)
                {
                    Caption = 'New Expense Report';
                    ApplicationArea = All;
                    RunObject = page "Expense Report Card";
                    RunPageMode = Create;
                    ToolTip = 'Create a new expense report.';
                }
            }

            group(MasterData)
            {
                Caption = 'Master Data';
                action(EmployeesList)
                {
                    Caption = 'Employees';
                    ApplicationArea = All;
                    RunObject = page "Employees List";
                    ToolTip = 'Manage employee master data.';
                }
                action(ExpenseCategoriesList)
                {
                    Caption = 'Expense Categories';
                    ApplicationArea = All;
                    RunObject = page "Expense Categories List";
                    ToolTip = 'Manage expense categories.';
                }
                action(ExpenseSubcategoriesList)
                {
                    Caption = 'Expense Subcategories';
                    ApplicationArea = All;
                    RunObject = page "Expense Subcategories List";
                    ToolTip = 'Manage expense subcategories.';
                }
                action(ExpenseGroupsList)
                {
                    Caption = 'Expense Groups';
                    ApplicationArea = All;
                    RunObject = page "Expense Groups List";
                    ToolTip = 'Manage expense groups.';
                }
                action(PaymentMethodsList)
                {
                    Caption = 'Payment Methods';
                    ApplicationArea = All;
                    RunObject = page "Payment Methods List";
                    ToolTip = 'Manage payment methods.';
                }
                action(ExpenseLocationsList)
                {
                    Caption = 'Expense Locations';
                    ApplicationArea = All;
                    RunObject = page "Expense Locations List";
                    ToolTip = 'Manage expense locations.';
                }
            }

            group(PolicyAndSetup)
            {
                Caption = 'Policy & Setup';
                action(GettingStarted)
                {
                    Caption = 'Getting Started';
                    ApplicationArea = All;
                    RunObject = page "Expense Management Getting Started";
                    ToolTip = 'Get started with the expense management system - setup guide and overview.';
                    Image = TileInfo;
                }
                action(ExpensePoliciesList)
                {
                    Caption = 'Expense Policies';
                    ApplicationArea = All;
                    RunObject = page "Expense Policies List";
                    ToolTip = 'Manage expense policies and limits.';
                }
                action(ExpensePostingGroupsList)
                {
                    Caption = 'Expense Posting Groups';
                    ApplicationArea = All;
                    RunObject = page "Expense Posting Groups List";
                    ToolTip = 'Manage expense posting groups.';
                }
                action(ExpenseManagementSetupWizard)
                {
                    Caption = 'Setup Wizard';
                    ApplicationArea = All;
                    RunObject = page "Expense Management Setup Wizard";
                    ToolTip = 'Run the guided setup wizard to configure the expense management system.';
                    Image = SetupColumns;
                }
                action(ExpenseSetupChecklist)
                {
                    Caption = 'Setup Checklist';
                    ApplicationArea = All;
                    RunObject = page "Expense Setup Checklist";
                    ToolTip = 'Review the setup status and complete any missing configuration.';
                    Image = CheckList;
                }
                action(ExpenseManagementSetup)
                {
                    Caption = 'Expense Management Setup';
                    ApplicationArea = All;
                    RunObject = page "Expense Management Setup";
                    ToolTip = 'Configure expense management settings.';
                }
                action(DemoDataSetup)
                {
                    Caption = 'Demo Data Setup';
                    ApplicationArea = All;
                    RunObject = page "Expense Demo Data Setup";
                    ToolTip = 'Create or manage demo data for expense management.';
                }
            }

            group(PerDiem)
            {
                Caption = 'Per Diem';
                action(PerDiemExpensesList)
                {
                    Caption = 'Per Diem Expenses';
                    ApplicationArea = All;
                    RunObject = page "Per Diem Expenses List";
                    ToolTip = 'Manage per diem expenses.';
                }
            }

            group(Analysis)
            {
                Caption = 'Analysis & Reports';
                action(ExpenseReceiptsList)
                {
                    Caption = 'Expense Receipts';
                    ApplicationArea = All;
                    RunObject = page "Expense Receipts List";
                    ToolTip = 'View and manage expense receipts.';
                }
                action(ExpenseCommentsList)
                {
                    Caption = 'Expense Comments';
                    ApplicationArea = All;
                    RunObject = page "Expense Comments List";
                    ToolTip = 'View expense comments and notes.';
                }
                action(ExpenseItemizationsList)
                {
                    Caption = 'Expense Itemizations';
                    ApplicationArea = All;
                    RunObject = page "Expense Itemizations List";
                    ToolTip = 'View detailed expense itemizations.';
                }
                action(ExpenseParticipantsList)
                {
                    Caption = 'Expense Participants';
                    ApplicationArea = All;
                    RunObject = page "Expense Participants List";
                    ToolTip = 'View expense participants and attendees.';
                }
            }
        }

        area(Creation)
        {
            action(NewExpenseReport)
            {
                Caption = 'New Expense Report';
                ApplicationArea = All;
                RunObject = page "Expense Report Card";
                RunPageMode = Create;
                ToolTip = 'Create a new expense report.';
            }
            action(NewEmployee)
            {
                Caption = 'New Employee';
                ApplicationArea = All;
                RunObject = page "Expense Mgmt Employee Card";
                RunPageMode = Create;
                ToolTip = 'Create a new employee record.';
            }
            action(NewExpenseCategory)
            {
                Caption = 'New Expense Category';
                ApplicationArea = All;
                RunObject = page "Expense Category Card";
                RunPageMode = Create;
                ToolTip = 'Create a new expense category.';
            }
        }

        area(Processing)
        {
            action(CreateDemoData)
            {
                Caption = 'Create Demo Data';
                ApplicationArea = All;
                RunObject = page "Expense Demo Data Setup";
                ToolTip = 'Create comprehensive demo data for the expense management system.';
            }
        }
    }
}
