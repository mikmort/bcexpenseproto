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
                field("Posting Group Code"; Rec."Posting Group Code") { ApplicationArea = All; }
                field("Description"; Rec."Description") { ApplicationArea = All; }
                field("Refundable Debit Account"; Rec."Refundable Debit Account") { ApplicationArea = All; }
                field("Non Refundable Debit Account"; Rec."Non Refundable Debit Account") { ApplicationArea = All; }
                field("Prepayment Credit Account"; Rec."Prepayment Credit Account") { ApplicationArea = All; }
            }
        }
    }
}


