page 50199 "Expense Demo Data Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Expense Management Demo Data Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Demo Data Creation';
                field(InfoText; InfoText)
                {
                    Caption = 'Information';
                    MultiLine = true;
                    Editable = false;
                    ShowCaption = false;
                }
            }

            group(DataCreated)
            {
                Caption = 'Demo Data Summary';
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
            action(CreateDemoData)
            {
                Caption = 'Create Demo Data';
                ApplicationArea = All;
                Image = Setup;

                trigger OnAction()
                var
                    DemoDataSetup: Codeunit "Expense Demo Data Setup";
                    TempInteger: Record Integer temporary;
                begin
                    if Confirm('This will create comprehensive demo data for the Expense Management system. Continue?', false) then begin
                        TempInteger.Number := 1;
                        TempInteger.Insert();
                        DemoDataSetup.Run(TempInteger);
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
        InfoText := 'This page allows you to create comprehensive demo data for the Expense Management system.' +
                   '\' +
                   '\Demo data includes:' +
                   '\• 5 Sample employees with different currencies and legal entities' +
                   '\• Expense categories, subcategories, and groups' +
                   '\• Payment methods and posting groups' +
                   '\• Sample expense reports with various statuses' +
                   '\• Expense report lines with receipts and comments' +
                   '\• Policy definitions and per diem settings' +
                   '\• Itemizations and participant information' +
                   '\' +
                   '\Click "Create Demo Data" to populate all tables with realistic sample data.';

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
        EmployeeCount: Integer;
        CategoryCount: Integer;
        ReportCount: Integer;
        LineCount: Integer;
        ReceiptCount: Integer;
}
