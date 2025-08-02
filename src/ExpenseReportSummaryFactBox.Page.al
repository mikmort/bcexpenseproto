page 50190 "Expense Report Summary FactBox"
{
    PageType = CardPart;
    SourceTable = "Expense Reports";
    ApplicationArea = All;
    Caption = 'Expense Report Summary';

    layout
    {
        area(content)
        {
            group(Summary)
            {
                Caption = 'Summary';

                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Total amount of all expense lines.';
                    Style = Strong;
                    StyleExpr = true;
                }
                field("Line Count"; LineCount)
                {
                    ApplicationArea = All;
                    Caption = 'Number of Lines';
                    ToolTip = 'Number of expense lines in this report.';
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Currency code for this expense report.';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Current status of the expense report.';
                    Editable = false;
                }
            }

            group(Categories)
            {
                Caption = 'Top Categories';

                field("Most Used Category"; MostUsedCategory)
                {
                    ApplicationArea = All;
                    Caption = 'Most Used Category';
                    ToolTip = 'Category with the most expense lines.';
                    Editable = false;
                }
                field("Highest Amount Category"; HighestAmountCategory)
                {
                    ApplicationArea = All;
                    Caption = 'Highest Amount Category';
                    ToolTip = 'Category with the highest total amount.';
                    Editable = false;
                }
            }
        }
    }

    var
        LineCount: Integer;
        MostUsedCategory: Code[20];
        HighestAmountCategory: Code[20];

    trigger OnAfterGetRecord()
    begin
        CalculateSummary();
    end;

    local procedure CalculateSummary()
    var
        ExpenseReportLines: Record "Expense Report Lines";
        CategoryCounts: Dictionary of [Code[20], Integer];
        CategoryAmounts: Dictionary of [Code[20], Decimal];
        CategoryCode: Code[20];
        MaxCount: Integer;
        MaxAmount: Decimal;
        Count: Integer;
        Amount: Decimal;
    begin
        // Reset values
        LineCount := 0;
        MostUsedCategory := '';
        HighestAmountCategory := '';
        MaxCount := 0;
        MaxAmount := 0;

        // Calculate line count and category statistics
        ExpenseReportLines.SetRange("Report Id", Rec."Report Id");
        if ExpenseReportLines.FindSet() then begin
            repeat
                LineCount += 1;

                // Track category usage count
                if CategoryCounts.ContainsKey(ExpenseReportLines."Category Code") then
                    Count := CategoryCounts.Get(ExpenseReportLines."Category Code") + 1
                else
                    Count := 1;
                CategoryCounts.Set(ExpenseReportLines."Category Code", Count);

                // Track category amounts
                if CategoryAmounts.ContainsKey(ExpenseReportLines."Category Code") then
                    Amount := CategoryAmounts.Get(ExpenseReportLines."Category Code") + ExpenseReportLines.Amount
                else
                    Amount := ExpenseReportLines.Amount;
                CategoryAmounts.Set(ExpenseReportLines."Category Code", Amount);

            until ExpenseReportLines.Next() = 0;
        end;

        // Find most used category
        foreach CategoryCode in CategoryCounts.Keys() do begin
            Count := CategoryCounts.Get(CategoryCode);
            if Count > MaxCount then begin
                MaxCount := Count;
                MostUsedCategory := CategoryCode;
            end;
        end;

        // Find highest amount category
        foreach CategoryCode in CategoryAmounts.Keys() do begin
            Amount := CategoryAmounts.Get(CategoryCode);
            if Amount > MaxAmount then begin
                MaxAmount := Amount;
                HighestAmountCategory := CategoryCode;
            end;
        end;
    end;
}
