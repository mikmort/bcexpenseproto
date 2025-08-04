page 50194 "Expense Demo Data Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Expense Management Data Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Data Creation Options';
                field(InfoText; InfoText)
                {
                    Caption = 'Information';
                    MultiLine = true;
                    Editable = false;
                    ShowCaption = false;
                }
            }

            group(SetupDataInfo)
            {
                Caption = 'Setup Data (Realistic Defaults)';
                field(SetupInfoText; SetupInfoText)
                {
                    Caption = 'Setup Data Description';
                    MultiLine = true;
                    Editable = false;
                    ShowCaption = false;
                }
            }

            group(DemoDataInfo)
            {
                Caption = 'Demo Data (Sample Transactions)';
                field(DemoInfoText; DemoInfoText)
                {
                    Caption = 'Demo Data Description';
                    MultiLine = true;
                    Editable = false;
                    ShowCaption = false;
                }
            }

            group(DataCreated)
            {
                Caption = 'Current Data Summary';
                field(EmployeeCount; EmployeeCount)
                {
                    Caption = 'Employees Created';
                    Editable = false;
                }
                field(CategoryCount; CategoryCount)
                {
                    Caption = 'Expense Categories';
                    Editable = false;
                }
                field(ReportCount; ReportCount)
                {
                    Caption = 'Expense Reports';
                    Editable = false;
                }
                field(LineCount; LineCount)
                {
                    Caption = 'Expense Report Lines';
                    Editable = false;
                }
                field(ReceiptCount; ReceiptCount)
                {
                    Caption = 'Receipts Attached';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateSetupDataOnly)
            {
                Caption = 'Create Setup Data Only';
                ApplicationArea = All;
                Image = Setup;
                ToolTip = 'Create realistic default data suitable for any US customer (categories, policies, payment methods, etc.)';

                trigger OnAction()
                var
                    DemoDataSetup: Codeunit "Expense Demo Data Setup";
                begin
                    if Confirm('This will create realistic setup data for the Expense Management system. Continue?', false) then begin
                        DemoDataSetup.CreateSetupDataOnly();
                        CurrPage.Update();
                    end;
                end;
            }

            action(CreateDemoDataOnly)
            {
                Caption = 'Create Demo Data Only';
                ApplicationArea = All;
                Image = TestDatabase;
                ToolTip = 'Create sample demonstration data (employees, expense reports, transactions)';

                trigger OnAction()
                var
                    DemoDataSetup: Codeunit "Expense Demo Data Setup";
                begin
                    if Confirm('This will create sample demo data for the Expense Management system. Continue?', false) then begin
                        DemoDataSetup.CreateDemoDataOnly();
                        CurrPage.Update();
                    end;
                end;
            }

            action(CreateAllData)
            {
                Caption = 'Create All Data (Setup + Demo)';
                ApplicationArea = All;
                Image = Database;
                ToolTip = 'Create both setup data and demo data';

                trigger OnAction()
                var
                    DemoDataSetup: Codeunit "Expense Demo Data Setup";
                begin
                    if Confirm('This will create both setup and demo data for the Expense Management system. Continue?', false) then begin
                        DemoDataSetup.CreateAllData();
                        CurrPage.Update();
                    end;
                end;
            }

            action(ClearDemoData)
            {
                Caption = 'Clear Demo Data';
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                begin
                    if Confirm('This will delete all demo data. Are you sure you want to continue?', false) then begin
                        ClearAllDemoData();
                        CurrPage.Update();
                    end;
                end;
            }

            action(RefreshCounts)
            {
                Caption = 'Refresh Counts';
                ApplicationArea = All;
                Image = Refresh;

                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        InfoText := 'Choose how to populate your Expense Management system:' +
                   '\' +
                   '\• Setup Data Only: Create realistic defaults for any US customer' +
                   '\• Demo Data Only: Create sample transactions for demonstration' +
                   '\• All Data: Create both setup and demo data';

        SetupInfoText := 'Setup Data includes realistic defaults suitable for any US customer:' +
                        '\• Comprehensive expense categories (17 categories)' +
                        '\• US business locations and payment methods' +
                        '\• Common expense policies based on GSA rates' +
                        '\• Posting groups for different expense types';

        DemoInfoText := 'Demo Data includes sample transactions for demonstration:' +
                       '\• 5 Sample employees with different currencies' +
                       '\• 4 Example expense reports with various statuses' +
                       '\• Expense report lines with receipts and comments' +
                       '\• Itemizations and participant information';

        UpdateCounts();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateCounts();
    end;

    local procedure UpdateCounts()
    var
        Employee: Record Employees;
        Category: Record "Expense Categories";
        Report: Record "Expense Reports";
        Line: Record "Expense Report Lines";
        Receipt: Record "Expense Receipts";
    begin
        EmployeeCount := Employee.Count();
        CategoryCount := Category.Count();
        ReportCount := Report.Count();
        LineCount := Line.Count();
        ReceiptCount := Receipt.Count();
    end;

    local procedure ClearAllDemoData()
    var
        Employee: Record Employees;
        ExpenseGroup: Record "Expense Groups";
        PostingGroup: Record "Expense Posting Groups";
        Category: Record "Expense Categories";
        Subcategory: Record "Expense Subcategories";
        Location: Record "Expense Locations";
        PaymentMethod: Record "Payment Methods";
        Setup: Record "Expense Management Setup";
        Policy: Record "Expense Policies";
        Report: Record "Expense Reports";
        Line: Record "Expense Report Lines";
        Receipt: Record "Expense Receipts";
        Comment: Record "Expense Comments";
        Itemization: Record "Expense Itemizations";
        ItemLine: Record "Expense Itemization Lines";
        Participant: Record "Expense Participants";
        PerDiem: Record "Per Diem Expenses";
    begin
        // Delete in reverse dependency order
        PerDiem.DeleteAll();
        Participant.DeleteAll();
        ItemLine.DeleteAll();
        Itemization.DeleteAll();
        Comment.DeleteAll();
        Receipt.DeleteAll();
        Line.DeleteAll();
        Report.DeleteAll();
        Policy.DeleteAll();
        Setup.DeleteAll();
        PaymentMethod.DeleteAll();
        Location.DeleteAll();
        Subcategory.DeleteAll();
        Category.DeleteAll();
        PostingGroup.DeleteAll();
        ExpenseGroup.DeleteAll();
        Employee.DeleteAll();

        Message('All demo data has been cleared.');
    end;

    var
        InfoText: Text;
        SetupInfoText: Text;
        DemoInfoText: Text;
        EmployeeCount: Integer;
        CategoryCount: Integer;
        ReportCount: Integer;
        LineCount: Integer;
        ReceiptCount: Integer;
}
