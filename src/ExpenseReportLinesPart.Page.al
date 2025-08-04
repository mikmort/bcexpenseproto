page 50189 "Expense Report Lines Part"
{
    PageType = ListPart;
    SourceTable = "Expense Report Lines";
    ApplicationArea = All;
    Caption = 'Expense Lines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Number"; Rec."Line Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number.';
                }
                field("Expense Date"; Rec."Expense Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the expense.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the expense category.';
                }
                field("Subcategory Code"; Rec."Subcategory Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the expense subcategory.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency code for the expense.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the expense.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the expense amount.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the payment method.';
                }
                field("Receipt Required"; Rec."Receipt Required")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates if a receipt is required.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the expense line.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(EditLine)
            {
                ApplicationArea = All;
                Caption = 'Edit Line';
                Image = Edit;
                ToolTip = 'Edit the selected expense line.';

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Expense Report Line Card", Rec);
                    CurrPage.Update(false);
                end;
            }
            action(DeleteLine)
            {
                ApplicationArea = All;
                Caption = 'Delete Line';
                Image = Delete;
                ToolTip = 'Delete the selected expense line.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to delete this expense line?') then begin
                        Rec.Delete(true);
                        CurrPage.Update(false);
                    end;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if GetFilter("Report Id") <> '' then
            Rec."Report Id" := GetRangeMin("Report Id");

        // Set next line number
        Rec."Line Number" := GetNextLineNumber();
    end;

    local procedure GetNextLineNumber(): Integer
    var
        ExpenseReportLine: Record "Expense Report Lines";
        MaxLineNo: Integer;
    begin
        if Rec."Report Id" = '' then
            exit(1000);

        ExpenseReportLine.SetRange("Report Id", Rec."Report Id");
        if ExpenseReportLine.FindLast() then
            MaxLineNo := ExpenseReportLine."Line Number";

        exit(MaxLineNo + 1000);
    end;
}
