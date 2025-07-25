page 50165 "Expense Posting Group Card"
{
    PageType = Card;
    SourceTable = "Expense Posting Groups";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Posting Group Code"; "Posting Group Code") { ApplicationArea = All; }
                field("Refundable Debit Account"; "Refundable Debit Account") { ApplicationArea = All; }
                field("Non Refundable Debit Account"; "Non Refundable Debit Account") { ApplicationArea = All; }
                field("Prepayment Credit Account"; "Prepayment Credit Account") { ApplicationArea = All; }
            }
        }
    }
}
